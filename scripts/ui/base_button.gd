extends Button


export(String, FILE) var scene: String


func _on_base_button_pressed() -> void:
	scene_changer.change_scene(scene)
