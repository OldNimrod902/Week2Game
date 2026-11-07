extends Node2D
@onready var themed_timer: Node2D = $"CanvasLayer/timer" 
@onready var coin_counter = $"CanvasLayer/CoinCounter"
@onready var coin_icon = $"CanvasLayer/CoinIcon"
@onready var cookie_notice = $"CanvasLayer/CookieNotice"
@onready var button = $CookieButton

var button_not_yet_pressed = true

func _ready() -> void:
	cookie_notice.hide()
	button.hide()

func _process(delta: float) -> void:
	coin_counter.text=str(Global.spooky_coins) + "/5"

func _on_got_close_to_vending_machine() -> void:
	if button_not_yet_pressed:
		button.show()

func _on_got_away_from_vending_machine() -> void:
	if button_not_yet_pressed:
		button.hide()
func _on_cookie_button_pressed() -> void:
	button_not_yet_pressed=false
	button.hide()
	coin_counter.hide()
	coin_icon.hide()
	Global.spooky_coins=0
	cookie_notice.show()
	await wait(3.0)
	Global.spooky_cookies += 1
	Global.intermission_message = "That's an expensive one"
	get_tree().change_scene_to_file("res://spooky_scenes/spooky_intermission.tscn")
	
func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 
