shader_type canvas_item;

uniform float speed = 0.5;

void vertex() {
	UV.x += TIME * speed;
}

void fragment() {
	// Called for every pixel the material is visible on.
}