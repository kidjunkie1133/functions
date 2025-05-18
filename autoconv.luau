--[[
Not sure if this is needed, just made it for my own self.
]]
local HttpService = game:GetService("HttpService")

local function tryparsejson(str)
	local success, result = pcall(function()
		return HttpService:JSONDecode(str)
	end)
	return success and result or nil
end

local function tryencodejson(tbl)
	local success, result = pcall(function()
		return HttpService:JSONEncode(tbl)
	end)
	return success and result or nil
end

local function isjsonstring(str)
	if type(str) ~= "string" then return false end
	return tryparsejson(str) ~= nil
end

-- big bang
local function detectformat(input, filename)
	if type(input) == "string" then
		if isjsonstring(input) then
			return "json"
		end
		if input:match("^%s*<[%a_]") then
			return "xml"
		end
		return "text"
	elseif type(input) == "table" then
		return "table"
	elseif filename then
		local ext = filename:match("^.+(%..+)$")
		if ext then
			ext = ext:lower()
			if ext == ".json" then return "json" end
			if ext == ".lua" then return "table" end
			if ext == ".txt" then return "text" end
		end
	end
	return nil
end

function _G.autoconv(input, filename)
	local format = detectformat(input, filename)

	if format == "json" then
		if type(input) == "string" then
			local tbl = tryparsejson(input)
			if tbl then
				return tbl, "table"
			end
		end
	elseif format == "table" then
		local json = tryencodejson(input)
		if json then
			return json, "json"
		end
	elseif format == "text" then
		return input, "text"
	else
		warn("Unknown/unsupported data format!")
	end
end
