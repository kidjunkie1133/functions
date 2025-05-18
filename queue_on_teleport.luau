function _G.queue_on_teleport(func)
	assert(type(func) == "function", "Expected an function!")
	table.isnert(queued, func)
	return true
end

_G.queueonteleport = _G.queue_on_teleport
