extends Node2D
@onready var player: CharacterBody2D = $"../Player" 
@onready var self_area = $Area2D
@onready var player_area = $"../Player/Area2D"

signal heart_collected

func _ready() -> void:
	self.hide()

func _process(delta: float) -> void:
	if Global.lives < 5:
		self.show()
		if player_area.overlaps_area(self_area):
			if self.visible:
				emit_signal("heart_collected")
				self.hide()
		
