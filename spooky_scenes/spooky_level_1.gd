extends Node2D
@onready var themed_timer: Node2D = $"CanvasLayer/timer" 
@onready var coin_counter = $"CanvasLayer/CoinCounter"
@onready var coin_collect_audio = $AudioCollect

var timer_end = false

func _ready() -> void:
	await themed_timer.Timer(100.0) 
	timer_end = true 

func _process(delta: float) -> void:
	coin_counter.text=str(Global.spooky_coins) + "/5"
	if timer_end:
		Global.spooky_levels_done -=1
		Global.lives -=1
		Global.intermission_message = "Slooowww"
		Global.death_cause = "time"
		Global.spooky_coins = 0
		get_tree().change_scene_to_file("res://spooky_scenes/spooky_intermission.tscn")


func _on_outside_the_box_fallen_out() -> void:
	Global.spooky_levels_done -=1
	Global.lives -=1
	Global.intermission_message = "You do know how to jump, right?"
	Global.death_cause = "fall"
	Global.spooky_coins = 0
	get_tree().change_scene_to_file("res://spooky_scenes/spooky_intermission.tscn")


func _on_coin_collected() -> void:
	coin_collect_audio.play()
	Global.spooky_coins +=1


func _on_touched_enemy() -> void:
	Global.spooky_levels_done -=1
	Global.lives -=1
	Global.intermission_message = "Those pumpkins are deadly"
	Global.death_cause = "guard"
	Global.spooky_coins = 0
	get_tree().change_scene_to_file("res://spooky_scenes/spooky_intermission.tscn")


func _on_trap_entered() -> void:
	Global.spooky_levels_done -=1
	Global.lives -=1
	Global.intermission_message = "Pumpkin spiked latte"
	Global.death_cause = "spike"
	Global.spooky_coins = 0
	get_tree().change_scene_to_file("res://spooky_scenes/spooky_intermission.tscn")


func _on_touched_door() -> void:
	pass # Replace with function body.
