extends Node2D
@onready var themed_timer: Node2D = $timer 

var piece_collected = 0 
var timer_end = false 

func _ready() -> void:

	await themed_timer.Timer(12.0) 
	timer_end = true 

func _process(delta: float) -> void: 
	
	if piece_collected == 3: 
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn") 
		else:
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn") 
	
	if timer_end: # if the timer does end...
		Global.minigames_done -=1 #go back a minigame
		Global.lives -= 1 # lose ur lives
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn") # back to intermission
		

func piece_collect() -> void:
	piece_collected = piece_collected +1
	return


func _on_player_fallen_out() -> void:
	Global.minigames_done -=1
	Global.lives -=1
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
	
func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout
