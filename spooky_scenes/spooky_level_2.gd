extends Node2D
@onready var cookie_notice = $"CanvasLayer/CookieNotice"
@onready var themed_timer: Node2D = $"CanvasLayer/timer" 

var timer_end = false

func _ready() -> void:
	cookie_notice.hide()
	await themed_timer.Timer(60.0) 
	timer_end = true 

func _process(delta: float) -> void:
	if timer_end:
		Global.spooky_levels_done -=1
		Global.lives -=1
		Global.intermission_message = "You're not a fast climber, are you?"
		Global.death_cause = "time"
		get_tree().change_scene_to_file("res://spooky_scenes/spooky_intermission.tscn")
	pass


func _on_cookie_collected() -> void:
	cookie_notice.show()
	await wait(3)
	Global.spooky_cookies += 1
	Global.intermission_message = "One more!"
	get_tree().change_scene_to_file("res://spooky_scenes/spooky_intermission.tscn")

func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 


func _on_trap_entered() -> void:
	Global.spooky_levels_done -= 1
	Global.lives -= 1
	Global.intermission_message = "Who placed these here to protect a single cookie?"
	Global.death_cause = "spike"
	get_tree().change_scene_to_file("res://spooky_scenes/spooky_intermission.tscn")


func _on_touched_enemy() -> void:
	Global.spooky_levels_done -= 1
	Global.lives -= 1
	Global.intermission_message = "Avoid the bad guys"
	Global.death_cause = "guard"
	get_tree().change_scene_to_file("res://spooky_scenes/spooky_intermission.tscn")
