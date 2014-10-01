---------------------------------------------------------------------------------------
-- straw - a very basic material
---------------------------------------------------------------------------------------
--  * straw mat - for animals and very poor NPC; also basis for other straw things
--  * straw bale - well, just a good source for building and decoration


-- an even simpler from of bed - usually for animals 
-- it is a nodebox and not wallmounted because that makes it easier to replace beds with straw mats
minetest.register_node("cottages:straw_mat", {
        description = "layer of straw",
        drawtype = 'nodebox',
        tiles = { 'cottages_darkage_straw.png' }, -- done by VanessaE
        wield_image = 'cottages_darkage_straw.png',
        inventory_image = 'cottages_darkage_straw.png',
        sunlight_propagates = true,
        paramtype = 'light',
        paramtype2 = "facedir",
        is_ground_content = true,
        walkable = false,
	groups = {immortal=1},
        sounds = default.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
					{-0.48, -0.5,-0.48,  0.48, -0.45, 0.48},
			}
	},
	selection_box = {
		type = "fixed",
		fixed = {
					{-0.48, -0.5,-0.48,  0.48, -0.25, 0.48},
			}
	}
})
