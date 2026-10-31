extends Node2D
@onready var themed_timer: Node2D = $timer
@onready var clock: TextureRect = $Clock
@onready var button: Button = $ClockPickup
@onready var door: Node2D = $door

var timer_end = false
var button_not_yet_pressed = true

func _ready() -> void:
	door.hide()
	button.hide()
	await themed_timer.Timer(10.0)
	timer_end = true

func _process(delta: float) -> void:
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -= 1
		Global.intermission_message = "You really are slow as a turtle!"
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")


func _on_outside_the_box_fallen_out() -> void:
	Global.lives -= 1
	Global.minigames_done -= 1
	Global.intermission_message = "You were so close yet so far away!"
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn")


func _on_clock_pickup_pressed() -> void:
	clock.hide()
	button.hide()
	door.show()
	button_not_yet_pressed = false


func _on_door_entered() -> void:
	Global.intermission_message = "Good work. Almost there. Almost."
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn")


func _on_got_close_to_clock() -> void:
	if button_not_yet_pressed:
		button.show()


func _on_got_away_from_clock() -> void:
	if button_not_yet_pressed:
		button.hide()
