extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("Rise")
	await get_tree().create_timer(5).timeout
	_sink()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _sink():
	$AnimatedSprite2D.play("Sink")
	await get_tree().create_timer(1).timeout
	queue_free()




func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		_sink()
