

-- Directory where the map data will be stored
tutorial.map_directory = minetest.get_modpath("tutorial").."/mapdata/"

-- entity management functions

function save_entities()
	local entities = {}
	local count = 0;
	-- TODO: figure out a way to save ALL the entities, not just the currently loaded ones
	for id,entity in pairs(minetest.luaentities) do
		local entry = {
			pos = entity:getpos(),
			name = entity.name,
			staticdata = entity:get_luaentity().get_staticdata(entity.object)
		}
		if entry.name == "__builtin:item" then
			entry.itemstring = entity.itemstring
		end
		table.insert(entities, entry)
		count = count+1
	end
	local str = minetest.serialize(entities)

	local filename = tutorial.map_directory .. "entities"
	local file, err = io.open(filename, "wb")
	if err ~= nil then
		error("Couldn't write to \"" .. filename .. "\"")
	end
	file:write(str)
	file:flush()
	file:close()
	minetest.log("action", filename .. ": " .. count .. " entities saved")
end

function load_entities()
	local filename = tutorial.map_directory .. "entities"
	local f, err = io.open(filename, "r")
	if not f then
		error("Could not open file '" .. filename .. "': " .. err)
	end
	local entities = minetest.deserialize(f:read("*a"))
	f:close()

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
	minetest.log("action", filename .. ": " .. count .. " entities loaded")
end

function remove_entities()
	local count = 0;
	for id,entity in pairs(minetest.luaentities) do
		entity.object.get_luaentity(entity.object).remove()
		count = count + 1
	end
	minetest.log("action", count .. " entities removed")
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
	for k,sector in pairs(tutorial.map_sector) do
		local filename = tutorial.map_directory .. "sector_"..k
		save_worldedit(filename, sector, {
			x = sector.x + sector.l,
			y = sector.y + sector.l,
			z = sector.z + sector.l
		})
	end
end

function load_schematic()
	for k,sector in pairs(tutorial.map_sector) do
		local filename = tutorial.map_directory .. "sector_"..k
		load_worldedit(filename, sector)
	end
end

function save_worldedit(filename, minp, maxp)
	local result, count = worldedit.serialize(minp, maxp)
	local file, err = io.open(filename, "wb")
	if err ~= nil then
		error("Could not save file to \"" .. filename .. "\"")
	end
	file:write(result)
	-- TODO: minetest.compress is broken!!!
	--file:write(minetest.compress(result, "deflate" ))
	file:flush()
	file:close()
	minetest.log("action", "[tutorial] " .. (count or 0) .. " nodes saved from "
		.. minp.x .. "," .. minp.y .. "," .. minp.z .. " " .. maxp.x .. "," .. maxp.y .. "," .. maxp.z)
end

function load_worldedit(filename, pos)
	local f, err = io.open(filename, "r")
	if not f then
		error("Could not open tutorial world schematic")
	end
	local value = f:read("*a")
	--local value_compressed = f:read("*a")
	--local value = minetest.decompress(value_compressed, "deflate");
	f:close()
	if value == nil then
		error("File is invalid: "..filename)
		return
	end

	local count = worldedit.deserialize(pos, value)
	minetest.log("action", "[tutorial] " .. (count or 0) .. " nodes loaded to " .. pos.x .. "," .. pos.y .. "," .. pos.z)
end


------ Commands

minetest.register_privilege("tutorialmap", "Can use commands to manage the tutorial map")
minetest.register_chatcommand("treset", {
	params = "",
	description = "Resets the tutorial map",
	privs = {tutorialmap=true},
	func = function(name, param)
		load_schematic()
		-- TODO: remove the entities when I figure out a way to save them all
		--remove_entities()
		load_entities()
	end,
})

minetest.register_chatcommand("tsave", {
	params = "",
	description = "Saves the tutorial map",
	privs = {tutorialmap=true},
	func = function(name, param)
		save_schematic()
		save_entities()
	end,
})

------ Map Generation

loaded = false
minetest.register_on_generated(function(minp, maxp, seed)

	for k,sector in pairs(tutorial.map_sector) do
		if sector.loaded == nil then

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
				sector.loaded = true
			end
		end
	end
end)

minetest.register_on_mapgen_init(function(mgparams)
	minetest.set_mapgen_params({mgname="singlenode"})
end)

-- Make sure the player spawns in the right place
minetest.register_on_joinplayer(function(player)
	-- TODO: the player is looking at the wrong direction on spawn.. maybe we need to rotate the entire map
	player:setpos({x=42,y=0.5,z=28})
end)
