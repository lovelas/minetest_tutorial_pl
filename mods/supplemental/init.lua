minetest.register_node("supplemental:sticky", {
	description = "Sticky Stone Brick",
	tiles = {"default_stone_brick.png^supplemental_splat.png",
		"default_stone_brick.png", "default_stone_brick.png", "default_stone_brick.png",
		"default_stone_brick.png", "default_stone_brick.png"},
	groups = {immortal=1, disable_jump=1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("supplemental:conglomerate", {
	description = "Conglomerate",
	tiles = {"supplemental_conglomerate.png" },
	groups = {cracky=3},
	drop = { items = {
			{ items={"supplemental:rock"} },
			{ items={"supplemental:rock"}, rarity = 5 },
			{ items={"supplemental:rock"}, rarity = 5 },
			{ items={"supplemental:rock"}, rarity = 5 },
			{ items={"supplemental:rock"}, rarity = 5 },
		}
	},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("supplemental:frame",{
	description = "Picture Frame",
	drawtype = "signlike",
	selection_box = { type = "wallmounted" },
	walkable = false,
	tiles = {"supplemental_frame.png"},
	inventory_image = "supplemental_frame.png",
	wield_image = "supplemental_frame.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	groups = { immortal=1, attached_node=1 },
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})

minetest.register_node("supplemental:spikes", {
	description = "Small Spikes",
	tiles = {"supplemental_spikes_small.png"},
	inventory_image = "supplemental_spikes_small.png",
	wield_image = "supplemental_spikes_small.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	groups = { immortal = 1 },
	damage_per_second = 1,
	collision_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.1, 0.5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.1, 0.5}
	}
})

minetest.register_node("supplemental:spikes_large", {
	description = "Large Spikes",
	tiles = {"supplemental_spikes_large.png"},
	inventory_image = "supplemental_spikes_large.png",
	wield_image = "supplemental_spikes_large.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	groups = { immortal = 1 },
	damage_per_second = 2
})

minetest.register_craftitem("supplemental:rock", {
	description = "Rock",
	inventory_image = "supplemental_rock.png",
})

minetest.register_craftitem("supplemental:wheat", {
	description = "Wheat",
	inventory_image = "supplemental_wheat.png",
})

minetest.register_craftitem("supplemental:flour", {
	description = "Flour",
	inventory_image = "supplemental_flour.png",
})
-- Crafting example #2
minetest.register_craft({
	type = "shapeless",
	output = "supplemental:flour",
	recipe = {"supplemental:wheat", "supplemental:wheat", "supplemental:wheat", "supplemental:wheat"}
})

-- Items for crafting examples #1, #4 and #5
minetest.register_craftitem("supplemental:paper_white", {
	description = "White Paper",
	inventory_image = "default_paper.png",
	groups = { paper = 1 },
})
minetest.register_craftitem("supplemental:paper_orange", {
	description = "Orange Paper",
	inventory_image = "supplemental_paper_orange.png",
	groups = { paper = 1 },
})
minetest.register_craftitem("supplemental:paper_purple", {
	description = "Purple Paper",
	inventory_image = "supplemental_paper_purple.png",
	groups = { paper = 1 },
})
minetest.register_craftitem("supplemental:paper_green", {
	description = "Green Paper",
	inventory_image = "supplemental_paper_green.png",
	groups = { paper = 1 },
})
-- Crafting example #4
minetest.register_craft({
	output = "default:book",
	recipe = {
		{"group:paper"},
		{"group:paper"},
		{"group:paper"}
	}
})


-- 8 viscosity example liquids
for v=0,7 do
	local alpha = 120 + v*15

	minetest.register_node("supplemental:liquid"..v, {
		description = "Flowing Test Liquid "..v,
		inventory_image = minetest.inventorycube("supplemental_testliquid"..v..".png"),
		drawtype = "flowingliquid",
		tiles = {"supplemental_testliquid"..v..".png"},
		special_tiles = {
			{
				image="supplemental_testliquid"..v..".png",
				backface_culling=false,
			},
			{
				image="supplemental_testliquid"..v..".png",
				backface_culling=true,
			},
		},
		alpha = alpha,
		paramtype = "light",
		paramtype2 = "flowingliquid",
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		drop = "",
		drowning = 1,
		liquidtype = "flowing",
		liquid_alternative_flowing = "supplemental:liquid"..v,
		liquid_alternative_source = "supplemental:liquidsource"..v,
		liquid_viscosity = v,
		groups = {not_in_creative_inventory = 1}
	})

	minetest.register_node("supplemental:liquidsource"..v, {
		description = "Test Liquid Source "..v,
		inventory_image = minetest.inventorycube("supplemental_testliquid"..v..".png"),
		drawtype = "liquid",
		tiles = {"supplemental_testliquid"..v..".png"},
		alpha = alpha,
		paramtype = "light",
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		drop = "",
		drowning = 1,
		liquidtype = "source",
		liquid_alternative_flowing = "supplemental:liquid"..v,
		liquid_alternative_source = "supplemental:liquidsource"..v,
		liquid_viscosity = v,
		groups = {},
	})
end
