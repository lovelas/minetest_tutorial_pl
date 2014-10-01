

---------------------------------------------------------------------------------------
-- roof parts
---------------------------------------------------------------------------------------
-- a better roof than the normal stairs; can be replaced by stairs:stair_wood


-- create the three basic roof parts plus receipes for them;
cottages.register_roof = function( name, tiles, basic_material, homedecor_alternative )

   minetest.register_node("cottages:roof_"..name, {
		description = "Roof "..name,
		drawtype = "nodebox",
		--tiles = {"default_tree.png","default_wood.png","default_wood.png","default_wood.png","default_wood.png","default_tree.png"},
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = {immortal=1},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		sounds = default.node_sound_wood_defaults()
	})

   -- a better roof than the normal stairs; this one is for usage directly on top of walls (it has the form of a stair)
   minetest.register_node("cottages:roof_connector_"..name, {
		description = "Roof connector "..name,
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		--tiles = {"default_tree.png","default_wood.png","default_tree.png","default_tree.png","default_wood.png","default_tree.png"},
		--tiles = {"darkage_straw.png","default_wood.png","darkage_straw.png","darkage_straw.png","darkage_straw.png","darkage_straw.png"},
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = {immortal=1},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		sounds = default.node_sound_wood_defaults()
	})

   -- this one is the slab version of the above roof
   minetest.register_node("cottages:roof_flat_"..name, {
		description = "Roof (flat) "..name,
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		--tiles = {"default_tree.png","default_wood.png","default_tree.png","default_tree.png","default_wood.png","default_tree.png"},
                -- this one is from all sides - except from the underside - of the given material
		tiles = { tiles[1], tiles[2], tiles[1], tiles[1], tiles[1], tiles[1] };
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = {immortal=1},
		node_box = {
			type = "fixed",
			fixed = {	
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			},
		},
		sounds = default.node_sound_wood_defaults()
	})


end -- of cottages.register_roof( name, tiles, basic_material )




---------------------------------------------------------------------------------------
-- add the diffrent roof types
---------------------------------------------------------------------------------------
cottages.register_roof( 'black',
		{"cottages_homedecor_shingles_asphalt.png","default_wood.png","default_wood.png","default_wood.png","default_wood.png","cottages_homedecor_shingles_asphalt.png"},
		'homedecor:shingles_asphalt', 'default:coal_lump');
cottages.register_roof( 'red',
		{"cottages_homedecor_shingles_terracotta.png","default_wood.png","default_wood.png","default_wood.png","default_wood.png","cottages_homedecor_shingles_terracotta.png"},
		'homedecor:shingles_terracotta', 'default:clay_brick');
