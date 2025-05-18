local GC = {}
table.insert(GC, function() print("Hello from getgc function!") end)
table.insert(GC, { a = 1, b = 2})
table.insert(GC, setmetatable({}, {}))

function _G.getgc(includeinternals)
	assert(includeinternals == nil or type(includeinternals) == "boolean", "Invalid argument to getgc!")
	return GC
end
