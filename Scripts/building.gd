extends Area2D

var _has_been_stepped_on = false

func _ready() -> void:
	$AnimatedSprite2D.play("Rise")
	# Start the 5 second timer when the platform appears
	await get_tree().create_timer(1.5).timeout
	if not _has_been_stepped_on:
		_sink()

func _sink():
	_has_been_stepped_on = true
	$AnimatedSprite2D.play("Sink")
	# Disable collision immediately so player falls through
	
	$CollisionShape2D.set_deferred("disabled", true)
	print("Building sinking")


	await $AnimatedSprite2D.animation_finished  # Wait for animation to complete
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		_sink()