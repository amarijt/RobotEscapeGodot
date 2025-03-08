extends CharacterBody2D

@export var max_health: int = 100
var current_health: int

@onready var health_bar: ProgressBar = $ProgressBar  # Adjust path if needed
@onready var hitbox: Area2D = $hitbox  # Ensure it's the correct path
@export var respawn_position: Vector2 = Vector2(100, 100)

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
	
	if Input.is_action_just_pressed("interact") and is_on_floor():
		finish_game()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
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

func _ready():
	current_health = max_health
	health_bar.value = current_health
	hitbox.connect("area_entered", Callable(self, "_on_hitbox_area_entered"))
	
func _on_hitbox_area_entered(area: Area2D):
	if area.name == "enemy_hitbox":  # Check if collided with an enemy
		take_damage(10)  # Adjust damage as needed
	if area.name == "RespawnZone":
		respawn()

func take_damage(amount: int):
	current_health = max(0, current_health - amount)  # Prevent negative health
	health_bar.value = current_health
	if current_health <= 0:
		die()

func respawn():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", respawn_position, 0.5).set_trans(Tween.TRANS_SINE)
	velocity = Vector2.ZERO

func die():
	respawn()  # Or trigger a respawn
	health_bar.value = 100
	
func finish_game():
	get_tree().change_scene_to_file("res://win_screen.tscn")
