extends Node2D
@onready var player: CharacterBody2D = $"../Player" 
@onready var self_area = self
@onready var player_area = $"../Player/Area2D"

signal got_close_to_clock
signal got_away_from_clock
var entered_area=false

func _process(delta: float) -> void:
	if player_area.overlaps_area(self_area):
		entered_area = true
		emit_signal("got_close_to_clock")
	if entered_area and not player_area.overlaps_area(self_area):
		emit_signal("got_away_from_clock")
		entered_area = false
