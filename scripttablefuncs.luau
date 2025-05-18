local sblemap = setmetatable({}, { __mode = "k"})
function _G.setscriptable(instance, property, value)
	assert(typeof(instance) == "Instance", "Expected an Instance!")
	assert(typeof(property) == "string", "Expected an property name!")
	assert(typeof(value) == "boolean", "Expected an boolean!")

	if not sblemap[instance] then 
		sblemap[instance] = {}
	end

	local wassble = sblemap[instance][property] or false
	sblemap[instance][property] = value
	return wassble
end

function _G.isscriptable(instance, property)
	assert(typeof(instance) == "Instance", "Expected an Instance!")
	assert(typeof(property) == "string", "Expected an property name!")

	if not sblemap[instance] then
		return false
	end

	return sblemap[instance][property] or false
end
