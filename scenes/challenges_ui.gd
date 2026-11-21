extends Control
@onready var spooky_record = $Spookie/TimeData
@onready var peak_record = $Peak/TimeData
@onready var peak_infinite_record = $Peak_infinite/TimeData

func _ready() -> void:
	if Global.spooky_record_time != 100000:
		spooky_record.text = str(snapped(Global.spooky_record_time, 0.1))
	if Global.peak_record_time !=100000:
		peak_record.text = str(snapped(Global.peak_record_time, 0.1))
	if Global.peak_infinite_record != 0:
		peak_infinite_record.text = str(snapped(Global.peak_infinite_record, 0.1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")


func _on_spookie_pressed() -> void:
	get_tree().change_scene_to_file("res://spooky_scenes/spooky_story.tscn")


func _on_peak_pressed() -> void:
	get_tree().change_scene_to_file("res://peak_scenes/peak_story.tscn")


func _on_peak_infinite_pressed() -> void:
	pass # Replace with function body.


func _on_peak_2_pressed() -> void:
	Global.peak_levels_done=2
	get_tree().change_scene_to_file("res://peak_scenes/peak_level_2.tscn")

func _on_peak_3_pressed() -> void:
	Global.peak_levels_done=3
	get_tree().change_scene_to_file("res://peak_scenes/peak_level_3.tscn")
