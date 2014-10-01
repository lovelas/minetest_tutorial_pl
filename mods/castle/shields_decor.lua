minetest.register_node("castle:shield_2",{
	description = "Mounted Shield",
	tiles = {"castle_shield_side_2.png", "castle_shield_side_2.png", "castle_shield_side_2.png", "castle_shield_side_2.png", "castle_shield_back.png", "castle_shield_front_2.png"},
	drawtype="nodebox",
	paramtype2 = "facedir",
	paramtype = "light",
	groups={immortal=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.125000,0.375000,0.500000,0.500000,0.500000}, --NodeBox 1
			{-0.437500,-0.312500,0.375000,0.425000,0.500000,0.500000}, --NodeBox 2
			{-0.312500,-0.437500,0.375000,0.312500,0.500000,0.500000}, --NodeBox 3
			{-0.187500,-0.500000,0.375000,0.187500,0.500000,0.500000}, --NodeBox 4
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,0.375000,0.500000,0.500000,0.500000}, --NodeBox 1
		},
	},			
	walkable = false,
})