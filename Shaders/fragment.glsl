#version 330 core
out vec4 FragColor;
  
in vec4 vertexColor; // the input variable from the vertex shader (same name and same type)  

uniform float time;

void main()
{
    FragColor = 0.5*sin(time)*vertexColor + 0.5;
}