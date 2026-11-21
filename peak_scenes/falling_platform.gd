extends StaticBody2D

@onready var self_area = $Area2D
@onready var player_area = $"../Player/Area2D"
@onready var texture = $TextureRect
@onready var break_sound = $"../platform_break"

var original_position: Vector2
var has_fallen = false


func _ready() -> void:
	original_position = position

func _process(delta: float) -> void:
	if player_area.overlaps_area(self_area) and not has_fallen:
		texture.texture = load("res://assets/fall_platform_broken.png")
		break_sound.play()
		await wait(0.3)
		fall()

func fall():
	var tween = create_tween()
	tween.tween_property(self, "position", original_position + Vector2(0, 600), 2)

func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 
