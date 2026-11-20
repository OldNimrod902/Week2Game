extends Node2D
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.peak_player = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_died() -> void:
	Global.lives -= 1
	Global.peak_levels_done-= 1
	Global.intermission_message = "You fell and broke your ankle"
	Global.death_cause = "fall"
	get_tree().change_scene_to_file("res://peak_scenes/peak_intermission.tscn")
