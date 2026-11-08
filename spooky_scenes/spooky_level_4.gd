extends Node2D
@onready var button = $CookieButton
@onready var thank_you_notice = $"CanvasLayer/thanks_notice"
@onready var animation = $"Ghost/AnimationPlayer"

var button_not_yet_pressed = true

func _ready() -> void:
	thank_you_notice.hide()
	button.hide()

func _process(delta: float) -> void:
	pass

func _on_got_close_to_ghost() -> void:
	if button_not_yet_pressed:
		button.show()
func _on_got_away_from_ghost() -> void:
	if button_not_yet_pressed:
		button.hide()

func _on_cookie_button_pressed() -> void:
	button_not_yet_pressed = false
	button.hide()
	thank_you_notice.show()
	animation.play("flyaway")
	await wait(3)
	get_tree().change_scene_to_file("res://spooky_scenes/spooky_intermission.tscn")

func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 
