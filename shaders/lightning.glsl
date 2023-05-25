// Creates a circle lighting.
// type: 1 = local lighting, 2 = globe of light.

extern number targetX;
extern number targetY;
extern number radius;
extern number type;

vec4 effect (vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
	vec4 pixel = Texel(texture, texture_coords);

	number distX = pow(targetX - screen_coords.x, 2);
	number distY = pow(targetY - screen_coords.y, 2);
	number dist = sqrt(distX + distY) / radius;

	if (type == 1) {
		pixel.rgb = vec3(pixel.r - dist, pixel.g - dist, pixel.b - dist);
	} else {
		pixel.rgb = vec3(pixel.r / dist, pixel.g / dist, pixel.b / dist);
	}

	return pixel;
}
