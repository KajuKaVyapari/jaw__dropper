extends Spatial


onready var obstacle = load("res://scenes/obstacle.tscn")
var obstacles = []
var i = 0


func _ready() -> void:
	randomize()


func _on_obstacle_timer_timeout() -> void:
	obstacles.push_back(obstacle.instance())
	obstacles[i].name = "obstacle_" + str(i)
	obstacles[i].rotate_y(deg2rad(randi() % 181))
	obstacles[i].transform.origin.y = transform.origin.y
	get_parent().add_child(obstacles[i])
#	obstacles[i]
	i += 1
