extends CharacterBody2D


var SPEED = 300.0
var JUMP_VELOCITY = -600.0
@onready var body = $AnimatedSprite2D
@onready var jump_sound = $jump_sound
@onready var walking_sound = $walking_sound

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()

	var direction := Input.get_axis("move_left", "move_right")
	
	if direction and not Global.spooky_modified_speed:
		body.flip_h = direction < 0
		velocity.x = direction * SPEED
	elif Global.spooky_modified_speed:
		body.flip_h = direction < 0
		velocity.x = Global.spooky_speed_modifier
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if not is_on_floor():
		walking_sound.stop()
		body.play("jumping")
	elif direction:
		if not walking_sound.playing:
			walking_sound.play()
		body.play("moving")
	elif Global.spooky_modified_speed:
		if not walking_sound.playing:
			walking_sound.play()
		body.play("moving")
	else:
		walking_sound.stop()
		body.play("idle")
	
	move_and_slide()
