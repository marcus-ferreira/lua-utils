// Changes the color by a factor from 0 to 1.

extern number redFactor;
extern number greenFactor;
extern number blueFactor;

vec4 effect (vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
	vec4 pixel = Texel(texture, texture_coords);
	number average = (pixel.r + pixel.g + pixel.b) / 3;
	pixel.rgb = vec3(average * redFactor, average * greenFactor, average * blueFactor);
	return pixel;
}
