function _G.getscripts()
	local script = {}

	local function scan(obj)
		for _, child in ipairs(obj:GetChildren()) do
			if child:IsA("ModuleScript") or child:IsA("LocalScript") then
				table.insert(script, child)
			end
			scan(child)
		end
	end

	scan(game)
	return script
end
