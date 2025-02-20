extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -560.0
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction > 0:
			animated_sprite.play("Run_Right")  # Running right
			if $AudioStreamPlayer2D.playing == false:
				$AudioStreamPlayer2D.play()
		else:
			animated_sprite.play("Run_Left")   # Running left
			if $AudioStreamPlayer2D.playing == false:
				$AudioStreamPlayer2D.play()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("Idle")
		$AudioStreamPlayer2D.stop()
	move_and_slide()  # <-- This actually moves the character
