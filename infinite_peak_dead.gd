extends Control
@onready var timer: RichTextLabel = $Elapsed_time
@onready var record_timer: RichTextLabel = $Record_time
@onready var confirmation =  $exitconfirm

func _ready() -> void:
	Global.game_finished=true;
	timer.text="You climbed up " + str(Global.peak_height) + "m"
	if(Global.peak_height>Global.peak_infinite_record):
		Global.peak_infinite_record=Global.peak_height
	record_timer.text="YOUR HIGHEST CLIMB: " + str(Global.peak_infinite_record) +"m"

func _process(delta: float) -> void:
	pass


func _on_main_menu_pressed() -> void:
	Global.intermission_message="Good luck"
	Global.death_cause="none"
	Global.peak_player = false
	Global.peak_height = 0
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

func _on_quit_pressed() -> void:
	confirmation.popup()

func _on_exitconfirm_confirmed() -> void:
	get_tree().quit()


func _on_try_again_pressed() -> void:
	get_tree().change_scene_to_file("res://peak_scenes/infinite_peak.tscn")
