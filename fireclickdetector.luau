unction _G.fireclickdetector(detector, playerId, eventName)
	assert(typeof(detector) == "Instance" and detector:IsA("ClickDetector"), "The first argument must be a ClickDetector!")
	assert(type(playerId) == "number", "Second argument must be a player ID number!")
	assert(type(eventName) == "string", "Third argument must be an event name string!")

	local player = PlayersService:GetPlayerByUserId(playerId)
	if not player then
		error("Player with the UserId of " .. tostring(playerId) .. " was not found.")
	end

	if eventName == "MouseHoverEnter" then
		detector.MouseHoverEnter:Fire(player)
	elseif eventName == "MouseHoverLeave" then
		detector.MouseHoverLeave:Fire(player)
	elseif eventName == "MouseClick" then
		detector.MouseClick:Fire(player)
	else
		error("Unsupported event name: " .. eventName)
	end
end
