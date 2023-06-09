vec4 bgcolor= vec4(0.0, 0.0, 0.0, 1.0); // = vec4(0.0, 0.0, 0.0, 1.0)

vec2 ratio2() {
    return vec2(1.0, 1.0 / 1.0);
}

float s() {
    return  pow(2.0 * abs(progress - 0.5), 3.0);
}


vec4 transition(vec2 p) {
    float dist = length((vec2(p) - 0.5) * ratio2());
    return mix(
    progress < 0.5 ? getFromColor(p) : getToColor(p), // branching is ok here as we statically depend on progress uniform (branching won't change over pixels)
    bgcolor,
    step(s(), dist)
    );
}
