

-- Directory where the map data will be stored
tutorial.map_directory = minetest.get_modpath("tutorial").."/mapdata/"

-- entity management functions

function save_entities()
	local entities = {}
	local count = 0;

	for id,entity in pairs(minetest.luaentities) do
		local entry = {
			pos = entity.object:getpos(),
			name = entity.name,
			staticdata = entity.object:get_luaentity().get_staticdata(entity.object)
		}
		if entry.name == "__builtin:item" then
			entry.itemstring = entity.itemstring
		end
		table.insert(entities, entry)
		count = count+1
		minetest.log("action", "[tutorial] entity FOUND to be saved: "..(entry.itemstring or entry.name).." at " ..entry.pos.x..","..entry.pos.y..","..entry.pos.z)
	end

	-- Because the entities can easily be unloaded, we won't override the
	-- entities save file. Instead, we will try to deduce as best as we can to try
	-- to include as well the already saved entities without creating duplicates.
	local saved_entities = get_saved_entities()

	for k,ent in pairs(saved_entities) do
		local already_added=false

		for k,e in pairs(entities) do
			if math.abs(ent.pos.x-e.pos.x) + math.abs(ent.pos.y - e.pos.y) + math.abs(ent.pos.z -e.pos.z) < 1 then
				already_added=true
				break
			end
		end
		if not already_added then
			table.insert(entities,ent)
			count = count + 1
			minetest.log("action", "[tutorial] entity to CONTINUE saved: "..(ent.itemstring or ent.name).." at " ..ent.pos.x..","..ent.pos.y..","..ent.pos.z)
		end
	end

	local str = minetest.serialize(entities)

	local filename = tutorial.map_directory .. "entities"
	local file, err = io.open(filename, "wb")
	if err ~= nil then
		error("Couldn't write to \"" .. filename .. "\"")
	end
	file:write(minetest.compress(str))
	file:flush()
	file:close()
	minetest.log("action","[tutorial] " .. filename .. ": " .. count .. " entities saved")
	return count
end

function get_saved_entities()
	local filename = tutorial.map_directory .. "entities"
	local f, err = io.open(filename, "rb")
	if not f then
		minetest.log("action", "[tutorial] Could not open file '" .. filename .. "': " .. err)
		return {}
	end
	local entities = minetest.deserialize(minetest.decompress(f:read("*a")))
	f:close()
	return entities
end

function load_entities()
	local entities = get_saved_entities()

	local count = 0
	for k,entity in pairs(entities) do
		if entity.name == "__builtin:item" then
			minetest.add_item(entity.pos, entity.itemstring)
		else
			local luaentity = minetest.add_entity(entity.pos, entity.name)
			luaentity.on_activate(luaentity, entity.staticdata)
		end
		count = count + 1
	end
	minetest.log("action", "[tutorial] " .. count .. " entities loaded")
end

function load_entities_area(minp, maxp)

	if not tutorial.entities_cache then
		tutorial.entities_cache = get_saved_entities()
	end

	local count = 0
	for k,entity in pairs(tutorial.entities_cache) do

		-- Only load it if not out of the generating range
		if not ((maxp.x < entity.pos.x) or (minp.x > entity.pos.x)
			or (maxp.y < entity.pos.y) or (minp.y > entity.pos.y)
			or (maxp.z < entity.pos.z) or (minp.z > entity.pos.z))
		then
			if entity.name == "__builtin:item" then
				minetest.add_item(entity.pos, entity.itemstring)
			else
				local luaentity = minetest.add_entity(entity.pos, entity.name)
				luaentity.on_activate(luaentity, entity.staticdata)
			end
			count = count + 1
		end
	end
	minetest.log("action", "[tutorial] " .. count .. " entities loaded")
end

---

-- Sectors of the map to save/load
-- I've divided the map into 9 sectors (3x1x3) of 75 blocks on each direction
-- However, some of them are empty (all air nodes) so they are commented out.
tutorial.map_sector = {
	[1] = {x=0, y=-30, z=-11, l=75},
	[2] = {x=75, y=-30, z=-11, l=75},
	--[3] = {x=150, y=-30, z=11, l=75},
	[4] = {x=0, y=-30, z=64, l=75},
	[5] = {x=75, y=-30, z=64, l=75},
	--[6] = {x=150, y=-30, z=64, l=75},
	--[7] = {x=0, y=-30, z=136, l=75},
	--[8] = {x=75, y=-30, z=136, l=75},
	--[9] = {x=150, y=-30, z=136, l=75}
 }

function save_schematic()
	local count = 0
	for k,sector in pairs(tutorial.map_sector) do
		local filename = tutorial.map_directory .. "sector_"..k
		count = count + save_worldedit(filename, sector, {
			x = sector.x + sector.l,
			y = sector.y + sector.l,
			z = sector.z + sector.l
		})
	end
	return count
end

function load_schematic()
	local count = 0
	for k,sector in pairs(tutorial.map_sector) do
		local filename = tutorial.map_directory .. "sector_"..k
		count = count + load_worldedit(filename, sector)
	end
	return count
end

function save_worldedit(filename, minp, maxp)
	local result, count = worldedit.serialize(minp, maxp)
	local file, err = io.open(filename, "wb")
	if err ~= nil then
		error("Could not save file to \"" .. filename .. "\"")
	end
	file:write(minetest.compress(result, "deflate" ))
	file:flush()
	file:close()
	minetest.log("action", "[tutorial] " .. (count or 0) .. " nodes saved from "
		.. minp.x .. "," .. minp.y .. "," .. minp.z .. " " .. maxp.x .. "," .. maxp.y .. "," .. maxp.z)
	return count
end

function load_worldedit(filename, pos)
	local f, err = io.open(filename, "rb")
	if not f then
		error("Could not open " .. filename)
	end
	local value_compressed = f:read("*a")
	local value = minetest.decompress(value_compressed, "deflate");
	f:close()

	if value == nil then
		error("File is invalid: " .. filename)
		return
	end

	local count = worldedit.deserialize(pos, value)
	minetest.log("action", "[tutorial] " .. (count or 0) .. " nodes loaded to " .. pos.x .. "," .. pos.y .. "," .. pos.z)
	return count or 0
end


------ Commands

minetest.register_privilege("tutorialmap", "Can use commands to manage the tutorial map")
minetest.register_chatcommand("treset", {
	params = "",
	description = "Resets the tutorial map",
	privs = {tutorialmap=true},
	func = function(name, param)
		local count = load_schematic()
		minetest.chat_send_player(name, count .. " nodes restored")

		-- TODO: right now there's no clear way we can properly remove all entities
		--remove_entities()
		--load_entities()
	end,
})

minetest.register_chatcommand("tsave", {
	params = "",
	description = "Saves the tutorial map",
	privs = {tutorialmap=true},
	func = function(name, param)
		local count = save_schematic()
		minetest.chat_send_player(name, count .. " nodes saved")

		local count = save_entities()
		minetest.chat_send_player(name, count .. " entities saved")
	end,
})

minetest.register_chatcommand("tsave_entities", {
	params = "",
	description = "Saves the tutorial map",
	privs = {tutorialmap=true},
	func = function(name, param)
		for k,s in pairs(tutorial.map_sector) do
			minetest.forceload_block(s)
		end
		local count = save_entities()
		minetest.chat_send_player(name, count .. " entities saved")
	end,
})

------ Map Generation

tutorial.state.loaded = {}
minetest.register_on_generated(function(minp, maxp, seed)
	local state_changed = false

	for k,sector in pairs(tutorial.map_sector) do
		if not tutorial.state.loaded[k] then

			if sector.maxp == nil then
				sector.maxp = {
					x = sector.x + sector.l,
					y = sector.y + sector.l,
					z = sector.z + sector.l,
				}
			end

			-- Only load it if not out of the generating range
			if not ((maxp.x < sector.x) or (minp.x > sector.maxp.x)
				or (maxp.y < sector.y) or (minp.y > sector.maxp.y)
				or (maxp.z < sector.z) or (minp.z > sector.maxp.z))
			then
				local filename = tutorial.map_directory .. "sector_"..k
				load_worldedit(filename, sector)
				load_entities_area(sector, sector.maxp)
				tutorial.state.loaded[k] = true
				state_changed = true
			end
		end
	end

	if(state_changed) then
		tutorial.save_state()
	end
end)

minetest.register_on_mapgen_init(function(mgparams)
	minetest.set_mapgen_params({mgname="singlenode"})
end)

-- coordinates for the first time the player spawns
tutorial.first_spawn = { pos={x=42,y=0.5,z=28}, yaw=(math.pi * 0.5) }
