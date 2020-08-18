extends KinematicBody

var speed = global.speed
var acceleration = global.acceleration
var direction = Vector3.UP
var velocity = Vector3()


func _physics_process(delta: float) -> void:
	speed = global.speed
	acceleration = global.acceleration
	velocity = velocity.linear_interpolate(direction * speed, acceleration)
	velocity = move_and_slide(velocity * delta)
	if transform.origin.y >= 30:
		queue_free() 


func _on_obstacle_area_body_entered(body: Node) -> void:
	if body.name == "player":
		global.lose_game()


func _on_obstacle_area_area_entered(area: Area) -> void:
	if area.name == "obstacle.area":
		area.get_parent().queue_free()
