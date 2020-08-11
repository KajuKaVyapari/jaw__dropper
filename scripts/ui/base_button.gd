extends Button


export(String, FILE) var scene = ""


func _on_base_button_pressed() -> void:
	get_tree().change_scene(scene)
