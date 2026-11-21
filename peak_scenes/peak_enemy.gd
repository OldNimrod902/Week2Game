extends Node2D
@onready var player: CharacterBody2D = $"../Player" # grabs the parent node
@onready var self_area = $Area2D
@onready var player_area = $"../Player/Area2D"
@onready var texture = $enemypic

signal touched_enemy

func _ready() -> void:
	var tween = create_tween().set_loops()
	tween.tween_property(self, "position", position + Vector2(-300, 0), 2.0)
	tween.tween_callback(flip)
	tween.tween_property(self, "position", position, 2.0)
	tween.tween_callback(flip)
	
func _process(delta: float) -> void:
	if player_area.overlaps_area(self_area):
		if self.visible:
			emit_signal("touched_enemy") 
		
func flip():
	texture.flip_h = !texture.flip_h
