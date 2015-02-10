
-- Returns a list of areas that include the provided position
function areas:getAreasAtPos(pos)
	local a = {}
	local px, py, pz = pos.x, pos.y, pos.z
	for id, area in pairs(self.areas) do
		local ap1, ap2 = area.pos1, area.pos2
		if px >= ap1.x and px <= ap2.x and
		   py >= ap1.y and py <= ap2.y and
		   pz >= ap1.z and pz <= ap2.z then
			a[id] = area
		end
	end
	return a
end

