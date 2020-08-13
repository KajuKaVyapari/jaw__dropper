extends Spatial


var foods = [
	preload("res://scenes/burger.tscn"),
	preload("res://scenes/apple.tscn")
]


func _ready() -> void:
	
	add_child(foods[randi() % foods.size()].instance())
