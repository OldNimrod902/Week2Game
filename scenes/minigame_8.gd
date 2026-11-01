extends Node2D
@onready var themed_timer: Node2D = $timer
@onready var player = $Player

var timer_end = false
var button_not_yet_pressed = true

func _ready() -> void:
	player.SPEED = 300
	player.JUMP_VELOCITY = -500
	await themed_timer.Timer(25.0)
	timer_end = true

func _process(delta: float) -> void:
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -= 1
		Global.intermission_message = "I get that you're slower but c'mon"
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")


func _on_outside_the_box_fallen_out() -> void:
	Global.lives -= 1
	Global.minigames_done -= 1
	Global.intermission_message = "Stumbled in the finish line"
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn")


func _on_spike_trap_entered() -> void:
	Global.lives -= 1
	Global.minigames_done -= 1
	Global.intermission_message = "Ouch"
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn")


func _on_enemy_1_touched_enemy() -> void:
	Global.lives -= 1
	Global.minigames_done -= 1
	Global.intermission_message = "You're supposed to jump over the guard, not run into him"
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn")


func _on_enemy_2_touched_enemy() -> void:
	Global.lives -= 1
	Global.minigames_done -= 1
	Global.intermission_message = "Guess this one was harder to miss"
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn")


func _on_door_entered() -> void:
	Global.intermission_message = "You did it."
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
