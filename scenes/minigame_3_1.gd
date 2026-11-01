extends Node2D
@onready var themed_timer: Node2D = $timer 
@onready var collect_sound = $AudioCollect

var door_entered = false
var timer_end = false

func _ready() -> void:
	collect_sound.play()
	await themed_timer.Timer(8.0) 
	timer_end = true 

func _process(delta: float) -> void: 
	
	if door_entered:
		Global.intermission_message = "Beware the dangers awaiting thee"
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
	
	if timer_end: 
		Global.minigames_done -=1 
		Global.lives -= 1
		Global.intermission_message = "I'm speechless."
		Global.death_cause = "time"
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")

func _on_door_touched_door() -> void:
	door_entered = true
