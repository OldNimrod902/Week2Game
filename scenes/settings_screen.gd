extends Node2D

@onready var lives: RichTextLabel = $descriptor_lives
@onready var time: RichTextLabel = $descriptor_time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lives.text="You start with " + str(Global.lives) + " lives"
	if Global.time_adjustment < 0:
		time.text="Each level starts with " + str(abs(Global.time_adjustment)) + " seconds less time"
	else:
		time.text="Each level starts with " + str(Global.time_adjustment) + " seconds more time"

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")


# difficulty settings
func _on_easy_pressed() -> void:
	Global.lives=5
	Global.time_adjustment=2


func _on_normal_pressed() -> void:
	Global.lives=4
	Global.time_adjustment=0

func _on_hard_pressed() -> void:
	Global.lives=3
	Global.time_adjustment=-2

func _on_harder_pressed() -> void:
	Global.lives=1
	Global.time_adjustment=-2


func _on_debug_pressed() -> void:
	Global.lives=10000
	Global.time_adjustment=0
