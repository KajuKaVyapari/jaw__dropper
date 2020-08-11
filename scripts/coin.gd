extends KinematicBody


var speed = global.speed
var acceleration = global.acceleration
var direction = Vector3.UP
var velocity = Vector3()


func _physics_process(delta: float) -> void:
	
	speed = global.speed * 0.6
	acceleration = global.acceleration * 0.6
	velocity = velocity.linear_interpolate(direction * speed, acceleration)
	velocity = move_and_slide(velocity * delta)
	if transform.origin.y >= 30:
		queue_free()

func _on_coin_area_body_entered(body: Node) -> void:
	if body.name == "player":
		global.score += 1
		queue_free()
