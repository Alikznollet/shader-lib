shader_type canvas_item;

vec2 tile(float _scale, vec2 _st) {
	_st *= _scale;
	return fract(_st);
}

vec2 rotate2D(vec2 _st, float _angle){
    _st -= 0.5;
    _st =  mat2(vec2(cos(_angle),-sin(_angle)),vec2(sin(_angle),cos(_angle))) * _st;
    _st += 0.5;
    return _st;
}

float circle(vec2 st, vec2 offset, float size) {
	float pct = distance(st, vec2(0.5) + offset);
	pct = step(size, pct);
	pct = 1.0 - pct;
	return pct;
}

float box(vec2 _st, vec2 _size, float _smoothEdges){
    _size = vec2(0.5)-_size*0.5;
    vec2 aa = vec2(_smoothEdges*0.5);
    vec2 uv = smoothstep(_size,_size+aa,_st);
    uv *= smoothstep(_size,_size+aa,vec2(1.0)-_st);
    return uv.x*uv.y;
}

float beating(float size, float amp) {
	return size + abs(sin(TIME*PI) * amp);
}

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 st = UV.xy;

	st = tile(3.0, st);
	st = rotate2D(st, PI*TIME);
	st += cos(sin(TIME))* 0.3;

	vec3 color = vec3(box(st, vec2(0.5,0.5), 0.01));

	COLOR = vec4(color, 1.0);

}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
