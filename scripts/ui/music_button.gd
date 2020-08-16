extends CheckButton


func _on_music_button_toggled(button_pressed: bool) -> void:
	global.music = button_pressed
