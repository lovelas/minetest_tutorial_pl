-- This is inspired by the landrush mod by Bremaweb

areas.hud = {}

minetest.register_globalstep(function(dtime)
	for _, player in pairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		local pos = vector.round(player:getpos())
		local areaStrings = {}
		for id, area in pairs(areas:getAreasAtPos(pos)) do
			table.insert(areaStrings, ("%s [%u]")
					:format(area.name, id))
		end
		local areaString = table.concat(areaStrings, "\n")
		local hud = areas.hud[name]
		if not hud then
			hud = {}
			areas.hud[name] = hud
			hud.areasId = player:hud_add({
				hud_elem_type = "text",
				name = "Areas",
				number = 0xFFFFFF,
				position = {x=0.5, y=0.9},
				offset = {x=0, y=0},
				text = areaString,
				scale = {x=200, y=60},
				alignment = {x=0, y=0},
			})
			hud.oldAreas = areaString
			return
		elseif hud.oldAreas ~= areaString then
			player:hud_change(hud.areasId, "text", areaString)
			hud.oldAreas = areaString
		end
	end
end)

minetest.register_on_leaveplayer(function(player)
	areas.hud[player:get_player_name()] = nil
end)

