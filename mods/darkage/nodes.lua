minetest.register_node("darkage:basalt_cobble", {
	description = "Basalt Cobble",
	tiles = {"darkage_basalt_cobble.png"},
	groups = {immortal=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:basalt_brick", {
	description = "Basalt Brick",
	tiles = {"darkage_basalt_brick.png"},
	groups = {immortal=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:stone_brick", {
	description = "Stone Brick",
	tiles = {"darkage_stone_brick.png"},
	groups = {immortal=1},
	sounds = default.node_sound_stone_defaults()
})

-- Other Blocks
minetest.register_node("darkage:straw", {
	description = "Straw",
	tiles = {"darkage_straw.png"},
	groups = {immortal=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("darkage:lamp", {
	description = "Lamp",
	tiles = {"darkage_lamp.png"},
	paramtype = "light",
	light_source = 18,
	groups = {immortal=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("darkage:marble_tile", {
	description = "Marble Tile",
	tiles = {"darkage_marble_tile.png"},
	groups = {immortal=1},
	sounds = default.node_sound_stone_defaults()
})

-- Glass / Glow Glass
minetest.register_node("darkage:glass", {
	description = "Medieval Glass",
	drawtype = "glasslike",
	tiles = {"darkage_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {immortal=1},
	sounds = default.node_sound_glass_defaults(),
})

-- Wood based deco items
minetest.register_node("darkage:wood_bars", {
	description = "Wooden Bars",
	drawtype = "glasslike",
	tiles = {"darkage_wood_bars.png"},
	inventory_image = "darkage_wood_bars.png",
	wield_image = "darkage_wood_bars.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {immortal=1},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("darkage:wood_grille", {
	description = "Wooden Grille",
	drawtype = "glasslike",
	tiles = {"darkage_wood_grille.png"},
	inventory_image = "darkage_wood_grille.png",
	wield_image = "darkage_wood_grille.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {immortal=1},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("darkage:wood_frame", {
	description = "Wooden Frame",
	drawtype = "glasslike",
	tiles = {"darkage_wood_frame.png"},
	inventory_image = "darkage_wood_frame.png",
	wield_image = "darkage_wood_frame.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {immortal=1},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("darkage:iron_bars", {
	description = "Iron Bars",
	drawtype = "glasslike",
	tiles = {"darkage_iron_bars.png"},
	inventory_image = "darkage_iron_bars.png",
	wield_image = "darkage_iron_bars.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {immortal=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:iron_grille", {
	description = "Iron Grille",
	drawtype = "glasslike",
	tiles = {"darkage_iron_grille.png"},
	inventory_image = "darkage_iron_grille.png",
	sunlight_propagates = true,
	paramtype = "light",
	groups = {immortal=1},
	sounds = default.node_sound_stone_defaults()
})
