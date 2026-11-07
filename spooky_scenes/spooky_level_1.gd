extends Node2D
@onready var themed_timer: Node2D = $"CanvasLayer/timer" 
@onready var coin_counter = $"CanvasLayer/CoinCounter"
@onready var coin_collect_audio = $AudioCollect
@onready var poor_warning = $"CanvasLayer/PoorWarning"
@onready var heart_message = $"CanvasLayer/HeartMessage"

var timer_end = false

func _ready() -> void:
	poor_warning.hide()
	heart_message.hide()
	await themed_timer.Timer(80.0) 
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
	if Global.spooky_coins == 5:
		get_tree().change_scene_to_file("res://spooky_scenes/spooky_level_1_shop.tscn")
	else:
		poor_warning.show()
		await wait(3)
		poor_warning.hide()

func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 

func _on_heart_collected() -> void:
	Global.lives += 1
	heart_message.text="YOU FOUND A HEART!\nYOU NOW HAVE " + str(Global.lives) + " LIVES"
	heart_message.show()
	await wait(3)
	heart_message.hide()
	
