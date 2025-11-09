extends CharacterBody2D
signal water_depleted

var speed := 200.0
@export var water:float = 65.0
var alive:bool = true

func _process(delta: float) -> void:
	if water > 0:
		water -= delta * 5
		$AnimatedSprite2D.play("idle")
	else:
		water = 0
		speed = 0
		$AnimatedSprite2D.play("drown")
		await get_tree().create_timer(1).timeout
		hide()
		alive = false
		


func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
		$AnimatedSprite2D.flip_h = true

	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.flip_h = false
		input_vector.x -= 1	
		
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	input_vector = input_vector.normalized()
	velocity.x = input_vector.x * speed
	velocity.y = input_vector.y * speed

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	water += 12
	if water > 65:
		water = 65
