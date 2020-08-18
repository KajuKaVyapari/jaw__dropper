extends Button


func _on_retry_button_pressed() -> void:
	scene_changer.change_scene("res://scenes/world.tscn")
	get_parent().resume_game()
