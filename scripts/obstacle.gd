extends KinematicBody


func _physics_process(delta: float) -> void:
	pass


func _on_obstacle_area_body_entered(body: Node) -> void:
	if body.name == "player":
		body.queue_free() # Replace with lose_game()
