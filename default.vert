#version 330 core

// Input vertex attributes
// The layout qualifiers specify the location index of each attribute
layout (location = 0) in vec3 aPos;    // Vertex position
layout (location = 1) in vec3 aColor;  // Vertex color
layout (location = 2) in vec2 aTex;    // Vertex texture coordinates
layout (location = 3) in vec3 aNormal;

// Output variables to pass data to the fragment shader
out vec3 color;       // Output color passed to the fragment shader
out vec2 texCoord;    // Output texture coordinates passed to the fragment shader
out vec3 Normal;
out vec3 currentPos;


uniform mat4 camMatrix;
uniform mat4 model;


void main()
{
    
	// calculates current position
	currentPos = vec3(model * vec4(aPos, 1.0f));

	// Outputs the positions/coordinates of all vertices
	gl_Position = camMatrix * vec4(currentPos, 1.0);

	// Assigns the colors from the Vertex Data to "color"
	color = aColor;
	// Assigns the texture coordinates from the Vertex Data to "texCoord"
	texCoord = aTex;
	// Assigns the normal from the Vertex Data to "Normal"
	Normal = aNormal;

}
