// Changes all the colors to others 4 of the pallete.
// hexpress4 = { "553840", "9b6859", "bebc6a", "edf8c8" }

extern vec3 color1;
extern vec3 color2;
extern vec3 color3;
extern vec3 color4;

vec4 effect (vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
	vec4 pixel = Texel(texture, texture_coords);
	number average = (pixel.r + pixel.g + pixel.b) / 3;

	if (average < 0.25) {
		pixel.rgb = color1;
	} else if (average < 0.5) {
		pixel.rgb = color2;
	} else if (average < 0.75) {
		pixel.rgb = color3;
	} else {
		pixel.rgb = color4;
	}

	return pixel;
}
