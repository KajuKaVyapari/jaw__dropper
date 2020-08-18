extends KinematicBody

onready var chew_particles = preload("res://scenes/chew_particles.tscn")

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
		body.hunger = 8
		body.get_node("chew_effect").playing = true
		global.score += 1
		body.get_node("player_animator").play("rotate")
		var t = Timer.new()
		t.set_wait_time(.1)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		body.get_parent().add_child(chew_particles.instance())
		yield(t, "timeout")
		queue_free()
		t.queue_free()
	elif body.get_parent().name == "dropper":
		queue_free()
