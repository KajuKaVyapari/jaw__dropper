extends KinematicBody

export var speed = 80
export var acceleration = 15

var direction = Vector3()
var velocity = Vector3()

var state = "move"
onready var original_y = transform.origin.y


func _ready() -> void:
	global.highscore = global.get_highscore()
	global.score = 0


func _physics_process(delta: float) -> void:
	if state == "move" and not $player_collider.disabled:
		transform.origin.y = original_y
		if global.control_type == "keyboard":
			direction = Vector3()
			if Input.is_action_pressed("ui_up"):
				direction += Vector3.FORWARD
			if Input.is_action_pressed("ui_down"):
				direction += Vector3.BACK
			if Input.is_action_pressed("ui_right"):
				direction += Vector3.RIGHT
			if Input.is_action_pressed("ui_left"):
				direction += Vector3.LEFT
		if Input.is_action_just_pressed("ui_cancel"):
			get_parent().get_node("pause_manager").pause_game()

		direction = direction.normalized()

		velocity = velocity.linear_interpolate(direction * speed, acceleration)
		velocity = move_and_slide(velocity * delta)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and global.control_type == "mouse":
		direction = Vector3(event.get_relative().x, 0, event.get_relative().y).normalized()
