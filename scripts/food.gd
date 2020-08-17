extends Spatial

var foods = [preload("res://scenes/apple.tscn"), preload("res://scenes/banana.tscn")]


func _ready() -> void:
	add_child(foods[randi() % foods.size()].instance())
