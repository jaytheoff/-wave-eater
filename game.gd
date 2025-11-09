extends Node2D

var timer := 0.0

func _ready() -> void:
	$"CanvasLayer/Game Over".hide()
	$Timer.start()
	$Timer.timeout.connect(_on_Timer_timeout)
	get_tree().paused = false

func _process(delta: float) -> void:
	$CanvasLayer/Water/Progressbar.value = $Player.water
	$CanvasLayer/Timer/Score.text = str(int(timer))

	if not $Player.alive:
		get_tree().paused = true
		$"CanvasLayer/Game Over".visible = true

func _on_Timer_timeout() -> void:
	timer += 1
	


func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()
