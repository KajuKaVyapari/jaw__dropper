extends ProgressBar


onready var timer = $timer

var left_to_right = false
var is_slowed = false


func _physics_process(_delta: float) -> void:
	if is_slowed:
		if left_to_right:
			value = timer.wait_time - timer.time_left
		else:
			value = timer.time_left
	else:
		value = timer.wait_time

func start_slowmo():
	timer.start()
	is_slowed = true
	yield(timer, "timeout")
	timer.wait_time *= 2
	max_value *= 2
	left_to_right = true
	timer.start()
	yield(timer, "timeout")
	is_slowed = false
	left_to_right = false
	timer.wait_time /= 2
	max_value /= 2
