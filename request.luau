function _G.request(params)
	assert(type(params) == "table", "Params must be a table!")
	assert(type(params.Url) == "string", "Url must be a string!")

	local requestParams = {
		Url = params.Url,
		Method = upper(params.Method or "GET"),
		Headers = params.Headers,
		Body = params.Body
	}

	local success, responseData = pcall(function()
		return HttpService:RequestAsync(requestParams)
	end)

	if success then
		if responseData.Success then
			return true, responseData.Body, responseData.Headers, responseData.StatusCode
		else
			return false, responseData.Body or responseData.StatusMessage, responseData.Headers, responseData.StatusCode
		end
	else
		return false, "HttpService:RequestAsync call failed: " .. tostring(responseData), nil, nil
	end
end
