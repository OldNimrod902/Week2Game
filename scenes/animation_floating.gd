extends AnimationPlayer

@onready var animation = self

func _ready() -> void:
	animation.play("floating")
