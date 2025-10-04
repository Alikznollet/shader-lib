shader_type canvas_item;

uniform vec2 offset = vec2(0.25, 0.25); // rectangle position in UV space
uniform vec2 size = vec2(0.5, 0.5);     // rectangle width and height
uniform float thickness = 0.02;         // outline thickness
uniform vec4 color : source_color = vec4(1.0, 1.0, 1.0, 1.0);

void fragment() {
	vec2 st = UV;

	// Rectangle edges
	float inside_x = step(offset.x, st.x) * step(st.x, offset.x + size.x);
	float inside_y = step(offset.y, st.y) * step(st.y, offset.y + size.y);
	float inside = inside_x * inside_y;

	// Inner rectangle (shrunk by thickness)
	float inner_x = step(offset.x + thickness, st.x) * step(st.x, offset.x + size.x - thickness);
	float inner_y = step(offset.y + thickness, st.y) * step(st.y, offset.y + size.y - thickness);
	float inner = inner_x * inner_y;

	// Outline = difference between outer and inner
	float outline = inside - inner;

	COLOR = vec4(color.rgb * outline, color.a);
}
