extends Node2D
@onready var game_over_sound = $game_over_sound

func _ready() -> void:
	game_over_sound.play()

func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	Global.lives=4
	Global.minigames_done=0
	Global.death_cause="none"
	Global.intermission_message="This time you'll be better"
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")


func _on_ragequit_pressed() -> void:
	get_tree().quit()
