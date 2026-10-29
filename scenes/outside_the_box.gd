extends Node2D
@onready var player: CharacterBody2D = $"../Player" 
@onready var self_area = self
@onready var player_area = $"../Player/Area2D"

signal fallen_out


func _process(delta: float) -> void:
	
	if player_area.overlaps_area(self_area):
		emit_signal("fallen_out")
		
