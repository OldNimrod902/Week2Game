extends Node2D
@onready var timer: RichTextLabel = $Elapsed_time
@onready var record_timer: RichTextLabel = $Record_time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.game_finished=true;
	timer.text="You found the Antique Clock in " + str(snapped(Global.total_time, 0.1)) + " seconds! (aprox., it may depend on your fps I guess)"
	if(Global.total_time<Global.record_time):
		Global.record_time=Global.total_time
	record_timer.text="YOUR SHORTEST TIME: " + str(snapped(Global.record_time, 0.1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
