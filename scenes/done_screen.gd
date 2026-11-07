extends Node2D
@onready var timer: RichTextLabel = $Elapsed_time
@onready var record_timer: RichTextLabel = $Record_time
@onready var victory_audio = $AudioVictory

func _ready() -> void:
	Global.game_finished=true;
	victory_audio.play()
	timer.text="You found the Antique Clock in " + str(snapped(Global.total_time, 0.1)) + " seconds! (aprox., it may depend on your fps I guess)"
	if(Global.total_time<Global.record_time):
		Global.record_time=Global.total_time
	record_timer.text="YOUR SHORTEST TIME: " + str(snapped(Global.record_time, 0.1))

func _process(delta: float) -> void:
	pass


func _on_main_menu_pressed() -> void:
	Global.minigames_done=0
	Global.intermission_message="I see you're trying for a better time"
	Global.death_cause="none"
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
