extends Particles


func _ready() -> void:
	
	emitting = true
	transform.origin = get_parent().get_node("player").transform.origin


func _physics_process(_delta: float) -> void:
	transform.origin = get_parent().get_node("player").transform.origin
	if emitting == false:
		queue_free()
