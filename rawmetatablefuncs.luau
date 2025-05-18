function _G.getrawmetatable(object)
	assert(type(object) == "table" or type(object) == "userdata" or typeof(object) == "Instance", "Argument #1 to 'getrawmetatable' must be a table, userdata, or Instance")

	local success, mt_or_error = pcall(debug.getmetatable, object) 
	if success then
		return mt_or_error
	else 
		error("Failed to get raw metatable: " .. tostring(mt_or_error))
	end
end

function _G.setrawmetatable(object, metatableOrNil)
	assert(type(object) == "table" or type(object) == "userdata" or typeof(object) == "Instance", "Argument #1 to 'setrawmetatable' must be a table, userdata, or Instance.")
	assert(metatableOrNil == nil or type(metatableOrNil) == "table", "Argument #2 to 'setrawmetatable' must be a table or nil")

	local success, err_msg = pcall(debug.setmetatable, object, metatableOrNil)
	if not success then 
		error("Failed to set raw metatable: " .. tostring(err_msg))
	end
	return true
end
