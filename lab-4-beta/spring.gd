extends Area2D

@export var bounce_force: float = 10000.0  # Adjust this to control the strength of the bounce

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body is CharacterBody2D:  # Check if the player touched the spring
		body.velocity.y = -bounce_force  # Apply an upward force
