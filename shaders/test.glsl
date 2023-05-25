/*

vec4	= x, y, z, w
		= r, g, b, a
		= s, t, p, q

// order from top to bottom
mat4	= x1, x2, x3, x4
		= y1, y2, y3, y4
		= z1, z2, z3, z4
		= w1, w2, w3, w4

*/

extern float time;

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
	vec4 pixel = Texel(texture, texture_coords);

	vec2 value = vec2(screen_coords.x / 1920, screen_coords.y / 1080);

	pixel.r += abs(sin(value.x + time));
	pixel.g += abs(sin(value.y + time));
	pixel.b += abs(sin(value.x + value.y + time));

	return pixel;
}
