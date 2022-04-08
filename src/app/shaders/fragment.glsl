uniform float uOpacity;
uniform float uDeepPurple;
 
varying float vDistortion;

vec3 cosPalette(float t, vec3 a, vec3 b, vec3 c, vec3 d) {
  return a + b * cos(6.28318 * (c * t + d));
  
}     
 
void main() {
  float distort = vDistortion * 3.;

  vec3 brightness = vec3(.1, .1, .1);
  vec3 contrast = vec3(.1, .1, .1);
  vec3 oscilation = vec3(.1, .1, .1);
  vec3 phase = vec3(.1, .1, .1);
 
  vec3 color = cosPalette(distort, brightness, contrast, oscilation, phase);
  
  gl_FragColor = vec4(color, vDistortion);
  gl_FragColor += vec4(max(uDeepPurple, 2.0), 0.0, 0.0, min(uOpacity, 1.));
}
