extends Spatial


onready var obstacle = load("res://scenes/obstacle.tscn")
onready var spawner = load("res://scenes/obstacle_spawner.tscn")
var obstacles = []
var i = 0


func _ready() -> void:
	randomize()


func _on_obstacle_timer_timeout() -> void:
	obstacles.push_back(obstacle.instance())
	obstacles[i].name = "obstacle_" + str(i)
	obstacles[i].rotate_y(deg2rad(randi() % 181))
	obstacles[i].transform.origin.y = get_parent().transform.origin.y + randi() % 10 - randi() % 20
	obstacles[i].transform.origin.x  += randi() % 5 - randi() % 10 
	obstacles[i].transform.origin.z  += randi() % 5 - randi() % 10 
	get_parent().get_parent().add_child(obstacles[i])
#	obstacles[i]
	i += 1


func _on_self_spawn_timer_timeout() -> void:

	get_parent().add_child(spawner.instance())


func _on_increase_speed_timer_timeout() -> void:
	global.speed *= 1.01
	global.acceleration *= 1.01
	clamp(global.speed, 0, 250)
	clamp(global.acceleration, 0, 50)
