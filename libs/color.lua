---@class color
color = {}

---Converts a hex (given without '#') value to RGB. (output range: 0 - 1)
---@param hex string
---@return table RGB
function color.hexToRGB(hex)
	local function convertHex(digit)
		return digit
			:gsub("a", 10)
			:gsub("b", 11)
			:gsub("c", 12)
			:gsub("d", 13)
			:gsub("e", 14)
			:gsub("f", 15)
	end

	return {
		(convertHex(hex:sub(1, 1)) * 16 + convertHex(hex:sub(2, 2))) / 255,
		(convertHex(hex:sub(3, 3)) * 16 + convertHex(hex:sub(4, 4))) / 255,
		(convertHex(hex:sub(5, 5)) * 16 + convertHex(hex:sub(6, 6))) / 255
	}
end

---Converts HSL to RGB. (input and output range: 0 - 1)
---@param h number # Hue.
---@param s number # Saturation.
---@param l number # Lightness.
---@param a number # Alpha.
---@return table RGBA
function color.HSLToRGB(h, s, l, a)
	if s <= 0 then return { l, l, l, a } end

	h, s, l = h * 6, s, l
	local c = (1 - math.abs(2 * l - 1)) * s
	local x = (1 - math.abs(h % 2 - 1)) * c
	local m, r, g, b = (l - 0.5 * c), 0, 0, 0
	if h < 1 then
		r, g, b = c, x, 0
	elseif h < 2 then
		r, g, b = x, c, 0
	elseif h < 3 then
		r, g, b = 0, c, x
	elseif h < 4 then
		r, g, b = 0, x, c
	elseif h < 5 then
		r, g, b = x, 0, c
	else
		r, g, b = c, 0, x
	end

	return { r + m, g + m, b + m, a }
end

---Converts HSV to RGB. (input and output range: 0 - 1)
---@param h number # Hue.
---@param s number # Saturation.
---@param v number # Value.
---@return table RGB
function color.HSVToRGB(h, s, v)
	if s <= 0 then return { v, v, v } end

	h = h * 6
	local c = v * s
	local x = (1 - math.abs((h % 2) - 1)) * c
	local m, r, g, b = (v - c), 0, 0, 0
	if h < 1 then
		r, g, b = c, x, 0
	elseif h < 2 then
		r, g, b = x, c, 0
	elseif h < 3 then
		r, g, b = 0, c, x
	elseif h < 4 then
		r, g, b = 0, x, c
	elseif h < 5 then
		r, g, b = x, 0, c
	else
		r, g, b = c, 0, x
	end

	return { r + m, g + m, b + m }
end
