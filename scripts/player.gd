extends KinematicBody


export var speed = 60
export var acceleration = 15

var direction = Vector3()
var velocity = Vector3()


func _physics_process(delta: float) -> void:
	
	direction = Vector3()
	if Input.is_action_pressed("ui_up"):
		direction += Vector3.FORWARD
	if Input.is_action_pressed("ui_down"):
		direction += Vector3.BACK
	if Input.is_action_pressed("ui_right"):
		direction += Vector3.RIGHT
	if Input.is_action_pressed("ui_left"):
		direction += Vector3.LEFT
	direction = direction.normalized()
	
	velocity = velocity.linear_interpolate(direction * speed, acceleration)
	velocity = move_and_slide(velocity * delta)
