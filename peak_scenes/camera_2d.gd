extends Camera2D

@onready var player = $"../Player"

var fixed_horizontal
var highest_vertical
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fixed_horizontal = global_position.x
	highest_vertical = global_position.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x = fixed_horizontal
	if player.global_position.y < highest_vertical:
		highest_vertical = player.global_position.y
	global_position.y = highest_vertical
