extends OptionButton


func _ready() -> void:
	add_item("Keyboard")
	add_item("Mouse")

	selected = global.control_list.find(global.control_type)


func _on_controls_button_item_selected(index: int) -> void:
	global.control_type = global.control_list[selected]
