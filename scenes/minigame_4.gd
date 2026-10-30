extends Node2D
@onready var themed_timer: Node2D = $timer

var buttons_pressed := 0
var timer_end = false

func _ready() -> void:
	await themed_timer.Timer(4.0)
	timer_end = true 


func _process(delta: float) -> void:
	if buttons_pressed == 5:
		Global.intermission_message = "That happened quickly"
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		Global.intermission_message = "They noticed you. You weren't fast enough."
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
