extends Area2D

@export var respawn_position: Vector2  # Set respawn position in the Inspector

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body is CharacterBody2D:  # Check if the player touches the spikes
		body.respawn()
