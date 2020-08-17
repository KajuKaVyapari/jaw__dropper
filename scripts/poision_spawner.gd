extends Spatial

onready var poison = preload("res://scenes/poison_food.tscn")
var spawner = load("res://scenes/poison_spawner.tscn")
var i = 0
var poisons = []


func _on_poison_timer_timeout() -> void:
	poisons.push_back(poison.instance())
	poisons[i].transform.origin.y = get_parent().transform.origin.y
	poisons[i].transform.origin.x += randi() % 8 - randi() % 16
	poisons[i].transform.origin.z += randi() % 8 - randi() % 16
	get_parent().get_parent().add_child(poisons[i])
	i += 1


func _on_self_spawn_timer_timeout() -> void:
	if global.poisons < 5:
		get_parent().add_child(spawner.instance())
		global.poisons += 1
