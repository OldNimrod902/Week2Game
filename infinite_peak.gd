extends Node2D
@onready var player = $Player
@onready var h_text = $CanvasLayer/height_text
var platform = preload("res://peak_scenes/peak_platform.tscn")
var top_y = 0.0
var last_x = 0.0

const left = 50
const right = 1000
const gap_min = 120
const gap_max = 180
const max_side_distance = 400
var h_max = 0.0

func _ready() -> void:
	Global.peak_player = true
	top_y = player.global_position.y + 40
	last_x = player.global_position.x
	_spawn(last_x, top_y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	while top_y > player.global_position.y - 1000:
		top_y -= randf_range(gap_min, gap_max)
		last_x = clampf(last_x + randf_range(-max_side_distance, max_side_distance), left, right)
		_spawn(last_x, top_y)
	if h_max < int(abs(player.global_position.y/100-4)):
		h_max=int(abs(player.global_position.y/100-4))
	h_text.text=str(h_max) + "m"

func _spawn(x: float, y: float) -> void:
	var p = platform.instantiate()
	p.global_position = Vector2(x, y)
	add_child(p)


func _on_player_died() -> void:
	Global.peak_height = h_max
	get_tree().change_scene_to_file("res://peak_scenes/infinite_peak_dead.tscn")
