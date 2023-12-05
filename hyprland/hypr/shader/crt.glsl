precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    // Sample the texture color
    vec4 color = texture2D(tex, v_texcoord);

    // Apply curvature
    float curvatureAmount = 0.2; // Adjust the amount of curvature
    vec2 centeredCoords = v_texcoord - 0.5;
    float distortion = dot(centeredCoords, centeredCoords) * curvatureAmount;
    vec2 distortedCoords = v_texcoord + distortion * normalize(centeredCoords);

    // Apply scanlines
    float scanlineIntensity = 0.3; // Adjust the intensity of scanlines
    float scanline = mod(gl_FragCoord.y, 2.0) < 1.0 ? 1.0 : 1.0 - scanlineIntensity;
    color.rgb *= scanline;

    // Apply vignette
    float vignetteRadius = 0.6; // Adjust the radius of the vignette
    float vignette = 1.0 - smoothstep(vignetteRadius, 1.0, length(distortedCoords - 0.5));
    color.rgb *= vignette;

    // Output the final color
    gl_FragColor = color;
}

