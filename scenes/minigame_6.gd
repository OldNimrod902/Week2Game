extends Node2D

@onready var lock = $Lock_button
@onready var spider = $Spider_button
@onready var themed_timer: Node2D = $timer
@onready var lock_hit_sound = $lock_sound

var lock_pressed = 0
var timer_end = false
var time

func _ready() -> void:
	spider.hide()
	await themed_timer.Timer(10.0)
	timer_end = true

func _process(delta: float) -> void:	
	if lock_pressed == 20:
		Global.intermission_message = "You almost squashed him!"
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
	if timer_end:
		Global.intermission_message = "They catched you. Embarassingly slow."
		Global.lives -= 1
		Global.minigames_done -= 1
		Global.death_cause = "time"
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")

func _on_poor_little_thing_obliterated() -> void:
	Global.intermission_message = "You have woken up Peter Parker"
	Global.lives -= 1
	Global.minigames_done -= 1
	Global.death_cause = "spider"
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn")

func _on_lock_button_pressed() -> void:
	lock_pressed += 1
	lock_hit_sound.play()
	if lock_pressed == 15:
		lock.hide()
		spider.show()
		await Timer(3)
		lock.show()
		spider.hide()

func Timer(start_time: float): 
	
	time = start_time
	
	while time > 0.0: 
		await wait(0.1) 
		time -= 0.1
	
	return

func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 
