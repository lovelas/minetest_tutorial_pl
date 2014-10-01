-- intllib support
local S
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
else
  S = function ( s ) return s end
end

minetest.register_node("darkage:basalt_cobble", {
	description = S("basalt cobble"),
	tiles = {"darkage_basalt_cobble.png"},
	groups = {immortal=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:basalt_brick", {
	description = S("basalt brick"),
	tiles = {"darkage_basalt_brick.png"},
	groups = {immortal=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:stone_brick", {
	description = S("stone brick"),
	tiles = {"darkage_stone_brick.png"},
	groups = {immortal=1},
	sounds = default.node_sound_stone_defaults()
})

-- Other Blocks
minetest.register_node("darkage:straw", {
	description = S("straw"),
	tiles = {"darkage_straw.png"},
	groups = {immortal=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("darkage:lamp", {
	description = S("lamp"),
	tiles = {"darkage_lamp.png"},
	paramtype = "light",
	light_source = 18,
	groups = {immortal=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("darkage:marble_tile", {
	description = S("marble tile"),
	tiles = {"darkage_marble_tile.png"},
	groups = {immortal=1},
	sounds = default.node_sound_stone_defaults()
})

-- Glass / Glow Glass
minetest.register_node("darkage:glass", {
	description = S("medieval glass"),
	drawtype = "glasslike",
	tiles = {"darkage_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {immortal=1},
	sounds = default.node_sound_glass_defaults(),
})

-- Wood based deco items
minetest.register_node("darkage:wood_bars", {
	description = S("wooden bars"),
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
	description = S("wooden grille"),
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
	description = S("wooden frame"),
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
	description = S("iron bars"),
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
	description = S("iron grille"),
	drawtype = "glasslike",
	tiles = {"darkage_iron_grille.png"},
	inventory_image = "darkage_iron_grille.png",
	sunlight_propagates = true,
	paramtype = "light",
	groups = {immortal=1},
	sounds = default.node_sound_stone_defaults()
})
