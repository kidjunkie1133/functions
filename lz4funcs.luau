function _G.lz4compress(input)
	assert(type(input) == "string","[lz4compress] Input must be a string!")

	local output = {}
	local i = 1

	while i <= input do
		local bestlen = 0
		local bestoffset = 0

		for offset = 1, math.min(i - 1, 255) do
			local matchlen = 0
			while matchlen < 15 and i + matchlen <= #input and input:sub(i - offset + matchlen, i - offset + matchlen) do
				matchlen += 1
			end
			if matchlen > bestlen then
				bestlen = matchlen
				bestoffset = offset
			end
		end

		if bestlen >= 3 then
			table.insert(output, string.char(0xF0 + bestlen))
			table.insert(output, string.char(bestoffset))
		else
			table.insert(output, input:sub(i, i))
			i += 1
		end
	end
	return table.concat(output)
end

function _G.lz4decompress(compressed, originalL)
	assert(type(compressed) == "string", "[lz4decompress] Input must be a string!")
	assert(type(originalL) == "number", "[lz4decompress] originalL must be a number!")

	local output = {}
	local i = 1

	while i <= compressed do 
		local byte = string.byte(compressed, i)
		if byte >= 0xF0 then
			local matchlen = byte - 0xF0
			local offset = string.byte(compressed, i + 1)
			local startp = #output - offset + 1
			for j = 0, matchlen - 1 do
				table.insert(output, output[startp + j])
			end
			i += 2
		else
			table.insert(output, compressed:sub(i, i))
			i += 1
		end
	end
	local result = table.concat(output)
	assert(#result == originalL, "[lz4decompress] Length mismatch!")
end
