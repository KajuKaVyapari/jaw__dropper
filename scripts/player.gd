extends KinematicBody

export var speed = 80
export var acceleration = 15

var direction = Vector3()
var velocity = Vector3()
var hunger = 8 setget set_hunger

var state = "move"
onready var original_y = transform.origin.y
onready var timer = get_parent().get_node("ui/slowmo")


func _ready() -> void:
	global.highscore = global.get_highscore()
	global.score = 0
	set_hunger(hunger)
	
	yield(get_tree().create_timer(5), "timeout")
	$hunger_timer.start()


func _physics_process(delta: float) -> void:
	if state == "move" and not $player_collider.disabled:
		
		if Input.is_action_just_pressed("slow_time"):
			slow_time()
		
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
		if global.control_type == "mobile":
			direction = Input.get_gyroscope()
		if Input.is_action_just_pressed("ui_cancel"):
			get_parent().get_node("pause_manager").pause_game()

		direction = direction.normalized()

		velocity = velocity.linear_interpolate(direction * speed, acceleration)
		velocity = move_and_slide(velocity * delta)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and global.control_type == "mouse":
		direction = Vector3(event.get_relative().x, 0, event.get_relative().y).normalized()


func _on_player_area_body_entered(body: Node) -> void:
	if body.name == "dropper_body":
		global.lose_game()


func _on_hunger_timer_timeout() -> void:
	self.hunger -= 1


func set_hunger(value):
	var old_hunger = hunger
	hunger = value
	get_parent().get_node("ui/hunger").update_hunger(hunger)
	if old_hunger > hunger and hunger == 0:
		global.lose_game()


func slow_time():
	if not timer.is_slowed:
		timer.start_slowmo()
		Engine.time_scale = 0.5
		yield(get_tree().create_timer(2), "timeout")
		Engine.time_scale = 1
