extends Node2D

var timer := 0.0
var building = preload("res://Building.tscn")

func _ready() -> void:
	$"CanvasLayer/Game Over".hide()
	$Timer.start()
	$Timer.timeout.connect(_on_Timer_timeout)
	get_tree().paused = false

func _process(delta: float) -> void:
	$CanvasLayer/Water/Progressbar.value = $Player.water
	$CanvasLayer/Timer/Score.text = str(int(timer))
	$"CanvasLayer/Game Over/Label".text = "Game Over!\nYou survived for " + str(int(timer)) + " seconds."

	if not $Player.alive:
		get_tree().paused = true
		$"CanvasLayer/Game Over".show()
	z_index = int(global_position.y)




	

func _on_Timer_timeout() -> void:
	timer += 1
	

func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()


func _spawn_building(pos) -> void:
	var bld_instance = building.instantiate()
	bld_instance.position = Vector2(pos)
	add_child(bld_instance)

	

func _on_spawntimer_1_timeout() -> void:
	_spawn_building(Vector2(randf_range(563,-170), (randf_range(0,109))))
	print("spawned building")
