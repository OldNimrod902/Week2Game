extends Node2D
@onready var heart_container: HBoxContainer = $HeartContainer
@onready var heart: TextureRect = $HeartContainer/Heart
@onready var heart_2: TextureRect = $HeartContainer/Heart2
@onready var heart_3: TextureRect = $HeartContainer/Heart3
@onready var heart_4: TextureRect = $HeartContainer/Heart4
@onready var heart_5: TextureRect = $HeartContainer/Heart5
@onready var heart_debug: TextureRect = $HeartContainer/HeartDebug
@onready var heart_none: TextureRect = $HeartContainer/HeartNone

@onready var peak_stage_0: TextureRect = $mountain_status/stage_0
@onready var peak_stage_1: TextureRect = $mountain_status/stage_1
@onready var peak_stage_2: TextureRect = $mountain_status/stage_2
@onready var peak_stage_3: TextureRect = $mountain_status/stage_3
@onready var peak_stage_4: TextureRect = $mountain_status/stage_4
@onready var height_text: RichTextLabel = $mountain_status/height_text

@onready var timer: RichTextLabel = $Timer
@onready var message: RichTextLabel = $Message

@onready var spike_sound = $spike_sound
@onready var fall_sound = $fall_sound
@onready var guard_sound = $guard_sound
@onready var time_sound = $time_sound
@onready var spider_sound = $spider_sound
@onready var victory_sound = $victory_sound

var time

func _ready() -> void:
	
	heart_debug.hide()
	heart_none.hide()
	message.text = str(Global.intermission_message)
	
	peak_stage_1.hide()
	peak_stage_2.hide()
	peak_stage_3.hide()
	peak_stage_4.hide()
	
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
		get_tree().change_scene_to_file("res://peak_scenes/dead_screen_peak.tscn")
		return
	
	await Timer(3.0)
	Global.death_cause = "alive"
	if Global.peak_levels_done < 4:
		Global.peak_levels_done = Global.peak_levels_done +1
		get_tree().change_scene_to_file("res://peak_scenes/peak_level_" + str(Global.peak_levels_done) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://peak_scenes/done_screen_peak.tscn") 

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
		
	if Global.peak_levels_done == 1:
		peak_stage_1.show()
	elif Global.peak_levels_done == 2:
		peak_stage_2.show()
	elif Global.peak_levels_done == 3:
		peak_stage_3.show()
	elif Global.peak_levels_done == 4:
		peak_stage_4.show()
		
	height_text.text = str(Global.peak_height) + "m"
	
	if Global.peak_levels_done<3:
		if Global.lives>0:
			timer.text = "Starting in " + str(time) 
		else:
			timer.text = ""
	else:
		timer.text = "Compliment coming in " + str(time)

func Timer(start_time: float): 
	
	time = start_time
	
	while time > 0.0: 
		await wait(0.1) 
		time -= 0.1
	
	return

func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 
