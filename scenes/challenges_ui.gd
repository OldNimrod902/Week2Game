extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")


func _on_spookie_pressed() -> void:
	get_tree().change_scene_to_file("res://spooky_scenes/spooky_story.tscn")


func _on_peak_pressed() -> void:
	get_tree().change_scene_to_file("res://peak_scenes/peak_story.tscn")
