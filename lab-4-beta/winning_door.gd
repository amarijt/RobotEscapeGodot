extends Area2D

var player_near = false

func _ready():
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)

func _process(delta):
	if player_near and Input.is_action_just_pressed("interact"):
		win_game()

func _on_body_entered(body):
	if body.name == "Player":  # Make sure the Player node is named "Player"
		player_near = true

func _on_body_exited(body):
	if body.name == "Player":
		player_near = false

func win_game():
	print("You Win!")  # Debug message
	get_tree().change_scene_to_file("res://WinScene.tscn")  # Change to win scene
	# get_tree().quit()  # Uncomment this to quit the game instead
