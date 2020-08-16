extends Spatial

onready var obstacle = load("res://scenes/obstacle.tscn")
onready var spawner = load("res://scenes/obstacle_spawner.tscn")
var obstacles = []
var i = 0
var local_translate


func _ready() -> void:
	randomize()


func _on_obstacle_timer_timeout() -> void:
	obstacles.push_back(obstacle.instance())
	obstacles[i].name = "obstacle_" + str(i)
	obstacles[i].rotate_y(deg2rad(randi() % 181))
	obstacles[i].transform.origin.y = get_parent().transform.origin.y + randi() % 10 - randi() % 20
	local_translate = Vector3(clamp(randi() % 8 - randi() % 16, -8, 8), 0, 0)
	translate(get_transform().basis.xform(local_translate))
	local_translate = Vector3(0, clamp(randi() % 8 - randi() % 16, -8, 8), 0)
	translate(get_transform().basis.xform(local_translate))
	obstacles[i].transform.origin.z += clamp(randi() % 4 - randi() % 8, -4, 4)
	get_parent().get_parent().add_child(obstacles[i])
	i += 1


func _on_self_spawn_timer_timeout() -> void:
	if global.spawners < 8:
		global.spawners_instances.push_back(spawner.instance())
		global.spawners_instances[global.spawners_iter].get_node("obstacle_timer").wait_time += clamp(
			randi() % 3 - randi() % 6, -3, 3
		)
		get_parent().add_child(global.spawners_instances[global.spawners_iter])
		global.spawners_iter += 1
		global.spawners += 1


func _on_increase_speed_timer_timeout() -> void:
	global.speed *= 1.01
	global.acceleration *= 1.01
	global.speed = clamp(global.speed, 0, 250)
	global.acceleration = clamp(global.acceleration, 0, 50)
