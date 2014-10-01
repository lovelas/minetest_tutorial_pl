-- mods/default/craftitems.lua

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

minetest.register_craftitem("default:paper", {
	description = S("white paper"),
	inventory_image = "default_paper.png",
})

minetest.register_craftitem("default:book", {
	description = S("book"),
	inventory_image = "default_book.png",
})

minetest.register_craftitem("default:coal_lump", {
	description = S("coal lump"),
	inventory_image = "default_coal_lump.png",
})

minetest.register_craftitem("default:iron_lump", {
	description = S("iron lump"),
	inventory_image = "default_iron_lump.png",
})

minetest.register_craftitem("default:gold_lump", {
	description = S("gold lump"),
	inventory_image = "default_gold_lump.png",
})

minetest.register_craftitem("default:diamond", {
	description = S("diamond"),
	inventory_image = "default_diamond.png",
})

minetest.register_craftitem("default:steel_ingot", {
	description = S("steel ingot"),
	inventory_image = "default_steel_ingot.png",
})

minetest.register_craftitem("default:gold_ingot", {
	description = S("gold ingot"),
	inventory_image = "default_gold_ingot.png"
})
