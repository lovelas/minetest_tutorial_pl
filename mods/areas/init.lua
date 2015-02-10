-- Areas mod by ShadowNinja
-- Based on node_ownership
-- Stripped down for the tutorial
-- License: LGPLv2+

areas = {}

areas.adminPrivs = {areas=true}
areas.startTime = os.clock()

areas.modpath = minetest.get_modpath("areas")
dofile(areas.modpath.."/settings.lua")
dofile(areas.modpath.."/api.lua")
dofile(areas.modpath.."/internal.lua")
dofile(areas.modpath.."/hud.lua")

areas:load()

if minetest.setting_getbool("log_mod") then
	local diffTime = os.clock() - areas.startTime
	minetest.log("action", "Modified areas mod loaded in "..diffTime.."s.")
end

