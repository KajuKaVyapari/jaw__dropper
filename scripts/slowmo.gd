extends ProgressBar


onready var timer = $timer
onready var sound_effect = $slowmo_audio
onready var player = get_parent().get_parent().get_node("player")
onready var effect = player.get_node("player_animator")

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
	sound_effect.play()
	effect.play("light_effect")
	is_slowed = true
	player.get_node("effect_light").light_energy = 10
	yield(get_tree().create_timer(timer.wait_time - 0.2), "timeout")
	sound_effect.stop()
	effect.play_backwards("light_effect")
	
	yield(timer, "timeout")
	
	timer.wait_time *= 4
	max_value *= 4
	left_to_right = true
	timer.start()
	player.get_node("effect_light").light_energy = 0
	
	yield(timer, "timeout")
	
	is_slowed = false
	left_to_right = false
	timer.wait_time /= 4
	max_value /= 4


func stop_sound():
	sound_effect.stop()
