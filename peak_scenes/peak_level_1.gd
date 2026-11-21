extends Node2D
@onready var player = $Player
@onready var h_text = $CanvasLayer/height_text

var h_max=0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.peak_player = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if h_max < int(abs(player.global_position.y/100-4)):
		h_max=int(abs(player.global_position.y/100-4))
	h_text.text=str(h_max) + "m"


func _on_player_died() -> void:
	Global.lives -= 1
	Global.peak_levels_done-= 1
	Global.intermission_message = "You fell and broke your ankle"
	Global.death_cause = "fall"
	Global.peak_height = h_max
	get_tree().change_scene_to_file("res://peak_scenes/peak_intermission.tscn")
