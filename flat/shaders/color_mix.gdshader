shader_type canvas_item;

uniform vec3 colorA: source_color;
uniform vec3 colorB: source_color;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 st = UV.xy;
	vec3 pct = vec3(st.x);
	
	pct.r = pow(st.x, -5);
	pct.g = cos(st.x*PI);
	pct.b = sin(st.x);
	
	vec3 color = mix(colorA, colorB, pct);
	
	COLOR = vec4(color, 1.0);
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
