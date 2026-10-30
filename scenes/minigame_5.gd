extends Node2D
@onready var themed_timer: Node2D = $timer

var timer_end = false
var trap_entered = false

func _ready() -> void:
	await themed_timer.Timer(20.0)
	timer_end = true 

func _process(delta: float) -> void:
	if trap_entered:
		Global.lives -= 1
		Global.minigames_done -= 1
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")

func _on_spike_trap_entered() -> void:
	trap_entered = true


func _on_door_entered() -> void:
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn")


func _on_outside_the_box_fallen_out() -> void:
	Global.lives -= 1
	Global.minigames_done-= 1
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
