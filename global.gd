extends Node

var minigames_done = 0
var lives = 4
var time_adjustment = 0
var intermission_message = "Good luck..."
var total_time = 0
var record_time = 100000
var game_finished = false
var death_cause = "none"

var spooky_coins = 0
var spooky_levels_done = 0

func _ready() -> void:
	while true:
		while not game_finished:
			await wait(0.1)
			total_time += 0.1
		await wait(0.3)

func _process(delta: float) -> void:
	pass

func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 
