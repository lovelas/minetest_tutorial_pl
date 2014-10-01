-- intllib support
local S
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
else
  S = function ( s ) return s end
end

minetest.register_node("castle:light",{
	drawtype = "glasslike",
	description = S("light block"),
	sunlight_propagates = true,
	light_source = 14,
	tiles = {"castle_street_light.png"},
	groups = {immortal=1},
	paramtype = "light",
	sounds = default.node_sound_glass_defaults()
})
