function _G.cloneref(instance)
	assert(typeof(instance) == "Instance", "Expected an Instance")
	local proxy = {}
	setmetatable(proxy, {
		__index = function(_, key)
			return instance[key]
		end,
		__newindex = function(_, key, value)
			instance[key] = value
		end,
		__eq = function(_, other)
			return instance == other
		end
	})
	return proxy
end
