extends StaticBody2D

@onready var self_area = $Area2D
@onready var player_area = $"../Player/Area2D"
@onready var player = $"../Player"
@onready var texture = $TextureRect
@onready var spring_sound = $"../platform_spring"

func _ready() -> void:
	var tween = create_tween().set_loops()
	tween.tween_property(self, "position", position + Vector2(-300, 0), 2.0)
	tween.tween_property(self, "position", position, 2.0)

func _process(delta: float) -> void:
	if player_area.overlaps_area(self_area):
		spring_sound.play()
		player.velocity.y=-1500

func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 
