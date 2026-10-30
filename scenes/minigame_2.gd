extends Node2D
@onready var themed_timer: Node2D = $timer

var buttons_pressed := 0
var timer_end = false

func _ready() -> void:
	await themed_timer.Timer(7.0)
	#after this is completed...
	timer_end = true 


func _process(delta: float) -> void:
	if buttons_pressed == 4:
		Global.intermission_message = "Now that you have the essentials, let's get going!"
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		Global.intermission_message = "You ran out of time. Could be a little faster."
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
