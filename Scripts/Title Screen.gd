extends Node2D

func _ready():
	_animate_git()
	_ainmate_godot()
	_animate_pfp()
	_animate_water()

# Animation functions
func _animate_git() -> void:
	# Create the tween once
	var tween = create_tween()
	
	# Set loop mode BEFORE adding properties
	tween.set_loops(-1)  # -1 for infinite loops
	tween.set_trans(Tween.TRANS_SINE)  # Optional: makes movement smoother
	tween.set_ease(Tween.EASE_IN_OUT)  # Optional: eases in and out
	
	# Sequence of movements
	tween.tween_property($CanvasLayer/Menu/Github, "position", Vector2(0, 503), 9.0)
	tween.tween_property($CanvasLayer/Menu/Github, "position", Vector2(0, 520), 1.0)
func _ainmate_godot() -> void:
	# Create the tween once
	var tween = create_tween()
	
	# Set loop mode BEFORE adding properties
	tween.set_loops(-1)  # -1 for infinite loops
	tween.set_trans(Tween.TRANS_SINE)  # Optional: makes movement smoother
	tween.set_ease(Tween.EASE_IN_OUT)  # Optional: eases in and 
	
	tween.tween_property($CanvasLayer/Menu/Godot, "position", Vector2(147, 505), 4.0)
	tween.tween_property($CanvasLayer/Menu/Godot, "position", Vector2(147, 515), 1.0)
func _animate_pfp() -> void:
	# Create the tween once
	var tween = create_tween()
	
	# Set loop mode BEFORE adding properties
	tween.set_loops(-1)  # -1 for infinite loops
	tween.set_trans(Tween.TRANS_CUBIC)  # Optional: makes movement smoother
	tween.set_ease(Tween.EASE_IN_OUT)  # Optional: eases in and out
	tween.tween_property($CanvasLayer/Menu/PFP, "position", Vector2(1000, 505), 6.0)
	tween.tween_property($CanvasLayer/Menu/PFP, "position", Vector2(1000, 515), 1.0)
func _animate_water() -> void:
	
	var tween = create_tween()
	tween.set_loops(-1)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_IN_OUT)

	tween.tween_property($Water, "position", Vector2(-289, 81), 3.0)
	tween.tween_property($Water, "position", Vector2(-289, -30), 1.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_godot_link_button_down() -> void:
	OS.shell_open("https://godotengine.org")


func _on_pfp_link_button_down() -> void:
	OS.shell_open("https://jaytheoff.github.io/")


func _on_github_button_down() -> void:
	OS.shell_open("https://github.com/jaytheoff/-wave-eater")


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
