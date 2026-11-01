extends Node

var minigames_done = 0
var lives = 4
var time_adjustment = 0
var intermission_message = "Good luck..."
var total_time = 0
var record_time = 100000
var game_finished = false
var death_cause = "none"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while not game_finished:
		await wait(0.1)
		total_time += 0.1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 
