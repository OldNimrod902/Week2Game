extends Node2D
@onready var themed_timer: Node2D = $timer 

var piece_collected = false
var timer_end = false

func _ready() -> void:

	await themed_timer.Timer(10.0) 
	timer_end = true 

func _process(delta: float) -> void: 
	
	if(piece_collected): 
		get_tree().change_scene_to_file("res://scenes/minigame_3_1.tscn")
	
	if timer_end: 
		Global.minigames_done -=1 
		Global.lives -= 1
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
		

func _on_enemy_1_touched_enemy() -> void:
	Global.minigames_done -=1
	Global.lives -= 1
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn") 


func _on_key_key_collected() -> void:
	piece_collected = true
	return
