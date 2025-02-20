extends Control

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://credits_screen.tscn")
	pass # Replace with function body.
	
