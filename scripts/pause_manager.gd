extends Spatial

onready var buttons = [$resume_button, $retry_button, $quit_button, $menu_button]

var is_cooldown = false


func _ready() -> void:
	$pause_label.visible = false
	for button in buttons:
		button.visible = false
		button.disabled = true


func _physics_process(_delta: float) -> void:
	if (
		get_parent().get_node("player").state == "wait"
		and Input.is_action_just_pressed("ui_cancel")
	):
		resume_game()


func pause_game():
	if not is_cooldown:
		get_parent().get_node("player").state = "wait"
		get_tree().paused = true
		$pause_label.visible = true
		for button in buttons:
			button.visible = true
			button.disabled = false


func resume_game():
	get_parent().get_node("player").state = "move"
	get_tree().paused = false
	is_cooldown = true
	_ready()
	$pause_timer.start()


func _on_pause_timer_timeout() -> void:
	is_cooldown = false
