extends KinematicBody


var poisons = [preload("res://scenes/burger.tscn")]

var speed = global.speed * 0.6
var acceleration = global.acceleration * 0.6
var direction = Vector3.UP
var velocity = Vector3()


func _physics_process(delta: float) -> void:
	speed = global.speed
	acceleration = global.acceleration
	velocity = velocity.linear_interpolate(direction * speed, acceleration)
	velocity = move_and_slide(velocity * delta)
	if transform.origin.y >= 30:
		queue_free()


func _ready() -> void:
	get_node("poi_food").add_child(poisons[randi() % poisons.size()].instance())


func _on_poison_area_body_entered(body: Node) -> void:
	if body.name == "dropper_body":
		queue_free()
	if body.name == "player":
		global.lose_game()
