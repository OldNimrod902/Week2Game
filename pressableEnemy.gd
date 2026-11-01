extends TextureButton
@onready var parent = $".."
@onready var hit_sound = $"../guard_hit"

func _on_pressed() -> void:
	if self.visible:
		hit_sound.play()
		hide()
		parent.buttons_pressed += 1
