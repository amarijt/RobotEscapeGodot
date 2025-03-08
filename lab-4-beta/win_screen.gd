extends Control



func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://title_screen.tscn")
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
