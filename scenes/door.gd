extends Node2D
@onready var player: CharacterBody2D = $"../Player" 
@onready var self_area = self
@onready var player_area = $"../Player/Area2D"

signal touched_door


func _process(delta: float) -> void:
	
	if player_area.overlaps_area(self_area):
		if self.visible:
			emit_signal("touched_door")
			self.hide()
		
