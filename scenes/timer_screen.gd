extends Node2D
@onready var heart_container: HBoxContainer = $HeartContainer
@onready var heart: TextureRect = $HeartContainer/Heart
@onready var heart_2: TextureRect = $HeartContainer/Heart2
@onready var heart_3: TextureRect = $HeartContainer/Heart3
@onready var heart_4: TextureRect = $HeartContainer/Heart4
@onready var heart_5: TextureRect = $HeartContainer/Heart5
@onready var heart_debug: TextureRect = $HeartContainer/HeartDebug
@onready var heart_none: TextureRect = $HeartContainer/HeartNone
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer
@onready var message: RichTextLabel = $Message

var time

func _ready() -> void:
	
	heart_debug.hide()
	heart_none.hide()
	message.text = str(Global.intermission_message)
	
	if Global.lives == 0:
		heart_none.show()
		await Timer(3.0)
		get_tree().change_scene_to_file("res://scenes/dead_screen.tscn")
		return
	
	await Timer(3.0)
	
	Global.minigames_done = Global.minigames_done +1
	get_tree().change_scene_to_file("res://scenes/minigame_" + str(Global.minigames_done) + ".tscn") 

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
	else:
		heart_debug.show()
	
	if Global.lives>0:
		timer.text = "Starting in " + str(time) 
	else:
		timer.text = ""
	
	level.text = "Level " + str(Global.minigames_done+1) 

func Timer(start_time: float): 
	
	time = start_time
	
	while time > 0.0: 
		await wait(0.1) 
		time -= 0.1
	
	return

func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 
