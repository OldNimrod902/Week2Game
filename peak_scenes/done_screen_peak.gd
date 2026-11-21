extends Control
@onready var timer: RichTextLabel = $Elapsed_time
@onready var record_timer: RichTextLabel = $Record_time
@onready var victory_audio = $AudioVictory
@onready var confirmation =  $exitconfirm

func _ready() -> void:
	Global.game_finished=true;
	victory_audio.play()
	timer.text="You climbed the mountain in " + str(snapped(Global.total_time, 0.1)) + " seconds! (aprox., it may depend on your fps I guess)"
	if(Global.total_time<Global.peak_record_time):
		Global.peak_record_time=Global.total_time
	record_timer.text="YOUR SHORTEST TIME: " + str(snapped(Global.peak_record_time, 0.1))

func _process(delta: float) -> void:
	pass


func _on_main_menu_pressed() -> void:
	Global.peak_levels_done=0
	Global.intermission_message="I see you're trying for a better time"
	Global.death_cause="none"
	Global.lives=Global.lives_selected
	Global.peak_player = false
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

func _on_quit_pressed() -> void:
	confirmation.popup()

func _on_exitconfirm_confirmed() -> void:
	get_tree().quit()
