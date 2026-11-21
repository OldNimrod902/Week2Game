extends Node2D
@onready var confirmation = $exitconfirm
@onready var record_time = $TimeLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	record_time.hide()
	if Global.record_time != 100000:
		record_time.show()
		record_time.text = "SHORTEST TIME: " + str(snapped(Global.record_time, 0.1)) + "s"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/story_start.tscn")


func _on_quit_pressed() -> void:
	confirmation.popup()


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings_screen.tscn")

func _on_challenges_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/challenges_ui.tscn")


func _on_exitconfirm_confirmed() -> void:
	get_tree().quit()
