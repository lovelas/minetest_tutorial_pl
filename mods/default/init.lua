-- Minetest 0.4 mod: default
-- See README.txt for licensing and other information.

-- The API documentation in here was moved into doc/lua_api.txt

-- intllib support
local S, F
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
	F = function( s )
		return minetest.formspec_escape(S(s))
	end
else
  S = function ( s ) return s end
  F = function ( s ) return minetest.formspec_escape(s) end
end

WATER_ALPHA = 160
WATER_VISC = 1
LAVA_VISC = 7
LIGHT_MAX = 14

-- Definitions made by this mod that other mods can use too
default = {}

-- GUI related stuff
default.gui_bg = "bgcolor[#080808BB;true]"
default.gui_bg_img = "background[5,5;1,1;gui_formbg.png;true]"
default.gui_slots = "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
default.gui_controls = F("[left click]: take/drop stack;   [right click]: take half / drop 1;   [middle click]: take 10 / drop 10;   [Esc] or [I]: Close")

function default.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
	end
	return out
end

default.gui_suvival_form = "size[8,8.5]"..
			default.gui_bg..
			default.gui_bg_img..
			default.gui_slots..
			"button_exit[-0.1,-0.3;2,1;gotostart;"..F("Back to start").."]"..
			"label[0,3.75;"..F("Player inventory:").."]"..
			"list[current_player;main;0,4.25;8,1;]"..
			"list[current_player;main;0,5.5;8,3;8]"..
			"label[0,8.2;"..default.gui_controls.."]"..
			"label[2.75,-0.1;"..F("Crafting grid:").."]"..
			"list[current_player;craft;2.75,0.5;3,3;]"..
			"label[6.75,0.9;"..F("Output slot:").."]"..
			"list[current_player;craftpreview;6.75,1.5;1,1;]"..
			"image[5.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
			default.get_hotbar_bg(0,4.25)

-- Load files
dofile(minetest.get_modpath("default").."/functions.lua")
dofile(minetest.get_modpath("default").."/nodes.lua")
dofile(minetest.get_modpath("default").."/tools.lua")
dofile(minetest.get_modpath("default").."/craftitems.lua")
dofile(minetest.get_modpath("default").."/crafting.lua")
dofile(minetest.get_modpath("default").."/mapgen.lua")
dofile(minetest.get_modpath("default").."/player.lua")
dofile(minetest.get_modpath("default").."/trees.lua")
