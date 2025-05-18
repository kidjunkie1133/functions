function _G.gethui()
	local success, CoreGui = pcall(game.GetService, game, "CoreGui")
	if not success then
		error("CoreGui not accessible")
	end

	local hui = CoreGui:FindFirstChild("ILoveCats")

	if not hui then
		hui = Instance.new("ScreenGui")
		hui.Name = "ILoveCats"
		hui.ResetOnSpawn = false
		hui.IgnoreGuiInset = true
		hui.DisplayOrder = 999
		hui.Parent = CoreGui
	end

	assert(typeof(hui) == "Instance", "gethui did not return an Instance")
	return hui
end
