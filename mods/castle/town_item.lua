minetest.register_node("castle:light",{
	drawtype = "glasslike",
	description = "Light Block",
	sunlight_propagates = true,
	light_source = 14,
	tiles = {"castle_street_light.png"},
	groups = {immortal=1},
	paramtype = "light",
	sounds = default.node_sound_glass_defaults()
})
