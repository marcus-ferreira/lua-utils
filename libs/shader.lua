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

	return rgb
end

Shader = {
	-- lighting
	[[
		extern number targetX;
		extern number targetY;
		extern number radius;
	
		vec4 effect (vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
			vec4 pixel = Texel(texture, texture_coords);
	
			number distX = (targetX - screen_coords.x) * (targetX - screen_coords.x);
			number distY = (targetY - screen_coords.y) * (targetY - screen_coords.y);
			number distance = sqrt(distX + distY) / radius;
	
			pixel.r = pixel.r - distance;
			pixel.g = pixel.g - distance;
			pixel.b = pixel.b - distance;
	
			return pixel;
		}
	]],
	-- grayscale
	[[
		vec4 effect (vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
			vec4 pixel = Texel(texture, texture_coords);
	
			number average = (pixel.r + pixel.g + pixel.b) / 3;
	
			pixel.r = average * 1;
			pixel.g = average * 1;
			pixel.b = average * 1;
			
			return pixel;
		}
	]],
	-- gameboy
	[[
		vec4 effect (vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
			vec4 pixel = Texel(texture, texture_coords);
	
			number average = (pixel.r + pixel.g + pixel.b) / 3;
	
			pixel.r = average * 0.5;
			pixel.g = average;
			pixel.b = average * 0.5;
			
			return pixel;
		}
	]],
	-- hexpress4
	[[
		vec4 effect (vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
			vec4 pixel = Texel(texture, texture_coords);
	
			number average = (pixel.r + pixel.g + pixel.b) / 3;
	
			if (average < 0.25) {
				pixel.r = 0.33;
				pixel.g = 0.21;
				pixel.b = 0.25;
			} else if (average < 0.5) {
				pixel.r = 0.6;
				pixel.g = 0.4;
				pixel.b = 0.34;
			} else if (average < 0.75) {
				pixel.r = 0.74;
				pixel.g = 0.73;
				pixel.b = 0.41;
			} else {
				pixel.r = 0.92;
				pixel.g = 0.97;
				pixel.b = 0.78;
			}
	
			return pixel;
		}
	]]
}
