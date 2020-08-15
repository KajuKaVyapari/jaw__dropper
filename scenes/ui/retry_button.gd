extends Button


func _on_retry_button_pressed() -> void:
	get_parent().resume_game()
	scene_changer.change_scene("res://scenes/world.tscn")
