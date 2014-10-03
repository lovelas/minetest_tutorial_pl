---------------------------------------------------------------------------------------
-- decoration and building material
---------------------------------------------------------------------------------------
-- * includes a wagon wheel that can be used as decoration on walls or to build (stationary) wagons
-- * dirt road - those are more natural in small old villages than cobble roads
-- * loam - no, old buildings are usually not built out of clay; loam was used
-- * straw - useful material for roofs
-- * glass pane - an improvement compared to fence posts as windows :-)
---------------------------------------------------------------------------------------

-- intllib support
local S
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
else
  S = function ( s ) return s end
end

-- can be used to buid real stationary wagons or attached to walls as decoration
minetest.register_node("cottages:wagon_wheel", {
        description = S("wagon wheel"),
        drawtype = "signlike",
        tiles = {"cottages_wagonwheel.png"}, -- done by VanessaE!
        inventory_image = "cottages_wagonwheel.png",
        wield_image = "cottages_wagonwheel.png",
        paramtype = "light",
        paramtype2 = "wallmounted",

        sunlight_propagates = true,
        walkable = false,
        selection_box = {
                type = "wallmounted",
        },
	groups = {immortal=1, attached_node=1},
        legacy_wallmounted = true,
        sounds = default.node_sound_defaults(),
})
