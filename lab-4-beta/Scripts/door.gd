extends StaticBody2D

@onready var anim = $AnimatedSprite2D  # Reference to the AnimatedSprite2D node
@onready var player_detector = $player_detector # Reference to the player detector area

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Initialize the door in its closed state (idle animation)
	anim.play("Idle")

# Called every frame
func _process(delta: float) -> void:
	pass

# This function opens the door by playing the "Opening" animation
# Then it switches to the "Opened" animation once finished
func opening_door():
	# Play the opening animation
	anim.play("Opening")
	
	# Wait for the animation to finish (using yield)
	await anim.animation_finished
	
	# Once the opening animation is done, play the "Opened" animation (image of the door open)
	anim.play("Opened")

# Detect player entering the detection area
func _on_player_detector_body_entered(body):
	if body.name == "Player":
		# Allow interaction if the player is near the door
		# Listen for the interact action (e.g., pressing a button)
		if Input.is_action_just_pressed("interact"):
			opening_door()  # Start the door opening process
