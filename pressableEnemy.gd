extends TextureButton
@onready var parent = $".."

func _on_pressed() -> void:
	if self.visible:
		hide()
		parent.buttons_pressed += 1
