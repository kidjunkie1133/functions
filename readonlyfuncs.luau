local romap = setmetatable({}, { __mode = "k" })
function _G.setreadonly(tbl, state)
	assert(typeof(tbl) == "table", "Expected an table!")
	assert(typeof(state) == "boolean", "Expected an boolean!")

	if not romap[tbl] then
		local proxy = setmetatable({}, {
			__index = tbl,
			__newindex = function(_, key, value)
				if not romap[tbl] then
					warn("Attempted to modify a read only table!")
				else
					tbl[key] = value
				end
			end,
			__metatable = "Locked"
		})
	end
end


function _G.isreadonly(object)
	assert(type(object) == "table" or type(object) == "userdata" or typeof(object) == "Instance", "Argument #1 to 'isreadonly' must be a table, userdata, or Instance.")
	local mt = _G.getrawmetatable(object)
	return mt and mt.__isreadonly_custom_marker == _G.ALiteralExecutor.ReadOnlyMarker
end
