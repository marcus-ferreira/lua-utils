test1 = "553840"
test2 = "9b6859"
test3 = "bebc6a"
test4 = "edf8c8"

local function hexToRGB(hex)
	local newHex = tostring(hex)
	local rgb = {}

	for i = 1, #newHex, 2 do
		local firstDigit = newHex:sub(i, i)
		firstDigit = firstDigit:gsub("a", 10)
		firstDigit = firstDigit:gsub("b", 11)
		firstDigit = firstDigit:gsub("c", 12)
		firstDigit = firstDigit:gsub("d", 13)
		firstDigit = firstDigit:gsub("e", 14)
		firstDigit = firstDigit:gsub("f", 15)

		local secondDigit = newHex:sub(i + 1, i + 1)
		secondDigit = secondDigit:gsub("a", 10)
		secondDigit = secondDigit:gsub("b", 11)
		secondDigit = secondDigit:gsub("c", 12)
		secondDigit = secondDigit:gsub("d", 13)
		secondDigit = secondDigit:gsub("e", 14)
		secondDigit = secondDigit:gsub("f", 15)

		rgb[math.ceil(i / 2)] = (firstDigit * 16) + secondDigit
	end

	-- for i, v in ipairs(rgb) do
	-- 	io.write(v .. (i == #rgb and "" or ", "))
	-- end
	return rgb
end
