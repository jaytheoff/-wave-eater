extends Area2D

var _has_been_stepped_on = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("Rise")
	# Start the 5 second timer when the platform appears
	await get_tree().create_timer(5).timeout
	if not _has_been_stepped_on:
		_sink()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _sink():
	if _has_been_stepped_on:
		return  # Prevent multiple calls
	_has_been_stepped_on = true
	$AnimatedSprite2D.play("Sink")
	await get_tree().create_timer(0.01).timeout
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		_sink()