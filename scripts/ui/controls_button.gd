extends OptionButton


func _ready() -> void:
	
	add_item("Keyboard")
	add_item("Mouse")
	
	if global.control_type == "mouse":
		selected = 1


func _on_controls_button_item_selected(index: int) -> void:
	global.control_type = global.control_dict[selected]
