extends OptionButton


func _ready() -> void:
	add_item("Easy")
	add_item("Medium")
	add_item("Hard")
	
	selected = global.difficulty_list.find(global.difficulty_type)


func _on_difficulty_button_item_selected(_index: int) -> void:
	global.difficulty_type = global.difficulty_list[selected]
