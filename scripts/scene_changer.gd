extends CanvasLayer

onready var animator = $animator


func change_scene(path, delay = 0):
	yield(get_tree().create_timer(delay), "timeout")
	animator.play("scene_change")
	yield(animator, "animation_finished")
	yield(get_tree().create_timer(0.5), "timeout")
	var _error = get_tree().change_scene(path)
	animator.play_backwards("scene_change")

	if "world" in path:
		get_tree().get_root().get_node("/root/soundtrack").playing = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif not get_tree().get_root().get_node("/root/soundtrack").playing:
		get_tree().get_root().get_node("/root/soundtrack").playing = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
