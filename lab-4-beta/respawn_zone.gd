extends Area2D

@export var respawn_position: Vector2  # Set respawn position in the Inspector

func _on_area_entered(body):
	if body is CharacterBody2D:  # Check if it's the player
		body.respawn(respawn_position)
