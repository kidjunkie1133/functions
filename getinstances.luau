function _G.getinstances()
	local allInstances = {}
	local function scan(parent)
		for _, child in ipairs(parent:GetChildren()) do
			table.insert(allInstances, child)
			scan(child)
		end
	end
	scan(game)
	return allInstances
end
