extends Node2D
@onready var heart_container: HBoxContainer = $HeartContainer
@onready var heart: TextureRect = $HeartContainer/Heart
@onready var heart_2: TextureRect = $HeartContainer/Heart2
@onready var heart_3: TextureRect = $HeartContainer/Heart3
@onready var heart_4: TextureRect = $HeartContainer/Heart4
@onready var heart_5: TextureRect = $HeartContainer/Heart5
@onready var heart_debug: TextureRect = $HeartContainer/HeartDebug
@onready var heart_none: TextureRect = $HeartContainer/HeartNone
@onready var cookie_1: TextureRect = $"CookieContainer/Cookie1"
@onready var cookie_2: TextureRect = $"CookieContainer/Cookie2"
@onready var cookie_3: TextureRect = $"CookieContainer/Cookie3"
@onready var no_cookie_1: TextureRect = $"CookieContainer/NoCookie1"
@onready var no_cookie_2: TextureRect = $"CookieContainer/NoCookie2"
@onready var no_cookie_3: TextureRect = $"CookieContainer/NoCookie3"

@onready var mouse: TextureRect = $mouse
@onready var keyboard: TextureRect = $keyboard
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer
@onready var message: RichTextLabel = $Message

@onready var spike_sound = $spike_sound
@onready var fall_sound = $fall_sound
@onready var guard_sound = $guard_sound
@onready var time_sound = $time_sound
@onready var spider_sound = $spider_sound
@onready var victory_sound = $victory_sound

var time
var controls = {
	1: 1,
	2: 1,
	3: 2,
	4: 1,
}

func _ready() -> void:
	
	heart_debug.hide()
	heart_none.hide()
	no_cookie_1.hide()
	no_cookie_2.hide()
	no_cookie_3.hide()
	keyboard.hide()
	mouse.hide()
	message.text = str(Global.intermission_message)
	
	if Global.death_cause == "spike":
		spike_sound.play()
	elif Global.death_cause == "fall":
		fall_sound.play()
	elif Global.death_cause == "guard":
		guard_sound.play()
	elif Global.death_cause == "time":
		time_sound.play()
	elif Global.death_cause == "spider":
		spider_sound.play()
	elif Global.death_cause == "alive":
		victory_sound.play()
	
	if Global.lives == 0:
		heart_none.show()
		await Timer(3.0)
		get_tree().change_scene_to_file("res://spooky_scenes/dead_screen_spooky.tscn")
		return
	
	if Global.spooky_levels_done < 8:
		if controls[Global.spooky_levels_done+1]==1:
			keyboard.show()
		else:
			mouse.show()
	
	await Timer(3.0)
	Global.death_cause = "alive"
	if Global.spooky_levels_done < 8:
		Global.spooky_levels_done = Global.spooky_levels_done +1
		get_tree().change_scene_to_file("res://spooky_scenes/spooky_level_" + str(Global.spooky_levels_done) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://spooky_scenes/done_screen_spooky.tscn") 

func _process(delta: float) -> void:
	if Global.lives==4:
		heart.hide()
	elif Global.lives==3:
		heart.hide()
		heart_2.hide()
	elif Global.lives==2:
		heart.hide()
		heart_2.hide()
		heart_3.hide()
	elif Global.lives==1:
		heart.hide()
		heart_2.hide()
		heart_3.hide()
		heart_4.hide()
	elif Global.lives==0:
		heart.hide()
		heart_2.hide()
		heart_3.hide()
		heart_4.hide()
		heart_5.hide()
		heart_none.show()
	elif Global.lives > 5:
		heart_debug.show()
	
	if Global.spooky_cookies == 0:
		cookie_1.hide()
		cookie_2.hide()
		cookie_3.hide()
		no_cookie_1.show()
		no_cookie_2.show()
		no_cookie_3.show()
	elif Global.spooky_cookies == 1:
		cookie_1.hide()
		cookie_2.hide()
		no_cookie_1.show()
		no_cookie_2.show()
	elif Global.spooky_cookies == 2:
		cookie_1.hide()
		no_cookie_1.show()
	
	if Global.minigames_done<4:
		if Global.lives>0:
			timer.text = "Starting in " + str(time) 
		else:
			timer.text = ""
		level.text = "SPOOKIE LEVEL " + str(Global.spooky_levels_done+1) 
	else:
		level.text = " "
		timer.text= "Finish your duty in " + str(time)

func Timer(start_time: float): 
	
	time = start_time
	
	while time > 0.0: 
		await wait(0.1) 
		time -= 0.1
	
	return

func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 
