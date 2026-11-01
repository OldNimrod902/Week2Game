extends Node2D
@onready var player: CharacterBody2D = $"../Player" # grabs the parent node
@onready var self_area = $Area2D
@onready var player_area = $"../Player/Area2D"
@onready var anim = $animation

# make a signal
signal touched_enemy

func _ready():
	anim.play("walking")

func _process(delta: float) -> void:
	if player_area.overlaps_area(self_area):
		if self.visible:
			emit_signal("touched_enemy") 
			self.hide()
		
