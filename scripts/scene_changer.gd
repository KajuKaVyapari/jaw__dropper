extends CanvasLayer

onready var animator = $animator


func change_scene(path, delay = 0):
	
	if "world" in path:
		get_tree().get_root().get_node("/root/soundtrack").playing = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		if not get_tree().get_root().get_node("/root/soundtrack").playing:
			get_tree().get_root().get_node("/root/soundtrack").playing = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	Engine.time_scale = 1
	global.update_difficulty()
	yield(get_tree().create_timer(delay), "timeout")
	animator.play("scene_change")
	yield(animator, "animation_finished")
	yield(get_tree().create_timer(0.5), "timeout")
	var _error = get_tree().change_scene(path)
	animator.play_backwards("scene_change")
