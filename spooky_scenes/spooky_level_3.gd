extends Node2D
@onready var cookie_notice = $"CanvasLayer/CookieNotice"

func _ready() -> void:
	cookie_notice.hide()
	Global.spooky_speed_modifier = 300
	Global.spooky_modified_speed = true

func _process(delta: float) -> void:
	pass

func _on_trap_entered() -> void:
	Global.spooky_levels_done -=1
	Global.lives -=1
	Global.intermission_message = "You press space and you go upwards, understood?"
	Global.death_cause = "spike"
	get_tree().change_scene_to_file("res://spooky_scenes/spooky_intermission.tscn")

func _on_cookie_collected() -> void:
	cookie_notice.show()
	await wait(3)
	Global.spooky_cookies += 1
	Global.intermission_message = "Yummy."
	Global.spooky_speed_modifier = 0
	Global.spooky_modified_speed = false
	get_tree().change_scene_to_file("res://spooky_scenes/spooky_intermission.tscn")

func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 

func _on_outside_the_box_fallen_out() -> void:
	Global.spooky_levels_done -=1
	Global.lives -=1
	Global.intermission_message = "Did you really jump over that cookie?"
	Global.death_cause = "fall"
	get_tree().change_scene_to_file("res://spooky_scenes/spooky_intermission.tscn")
