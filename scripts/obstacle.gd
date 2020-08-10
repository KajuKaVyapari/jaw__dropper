extends KinematicBody

var speed = 75
var acceleration = 12
var direction = Vector3.UP
var velocity = Vector3()

func _physics_process(delta: float) -> void:
	velocity = velocity.linear_interpolate(direction * speed, acceleration)
	velocity = move_and_slide(velocity * delta)
	if transform.origin.y >= 30:
		queue_free()


func _on_obstacle_area_body_entered(body: Node) -> void:
	if body.name == "player":
		body.queue_free() # Replace with lose_game()
