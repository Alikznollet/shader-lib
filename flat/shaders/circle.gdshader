shader_type canvas_item;

uniform vec3 colorA: source_color;

float smooth_circle(vec2 st) {
	float pct = 1.9*distance(st, vec2(0.5));
	pct = smoothstep(0.4, 0.6, pct);
	pct = 1.0 - pct;
	return pct;
}

float circle(vec2 st, vec2 offset, float size) {
	float pct = distance(st, vec2(0.5) + offset);
	pct = step(size, pct);
	pct = 1.0 - pct;
	return pct;
}

float beating(float size, float amp) {
	return size + abs(sin(TIME*PI) * amp);
}

vec2 moving(vec2 offset, vec2 amount) {
	return offset + amount*sin(TIME);
}

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 st = UV;
	float pct = circle(st, moving(vec2(0.0), vec2(0.3)), beating(0.1, 0.2));
	
	pct += circle(st, vec2(0.1), beating(0.05, 0.1));
	pct += circle(st, vec2(-0.2, 0.0), beating(0.2, 0.05));
	
	vec3 color = vec3(pct) * colorA;
	COLOR = vec4(color, 1.0);
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
