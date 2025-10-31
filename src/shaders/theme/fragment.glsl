uniform sampler2D uDayMap;
uniform sampler2D uNightMap;
uniform float uMixRatio;   // 0 = day, 1 = night

varying vec2 vUv;

void main() {
    vec3 dayColor   = texture2D(uDayMap,   vUv).rgb;
    vec3 nightColor = texture2D(uNightMap, vUv).rgb;
    vec3 finalColor = mix(dayColor, nightColor, uMixRatio);

    // gamma (if you’re not using three’s colorspace chunk)
    finalColor = pow(finalColor, vec3(1.0 / 2.2));
    gl_FragColor = vec4(finalColor, 1.0);

    // If you prefer three.js tonemapping/colorspace:
    // #include <tonemapping_fragment>
    // #include <colorspace_fragment>
}