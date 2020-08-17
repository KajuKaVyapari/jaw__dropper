extends Node

var speed = 100
var acceleration = 20
var score = 0 setget set_score, get_score
var spawners = 0
var spawners_instances = []
var spawners_iter = 0
var coins = 0
var poisons = 0

var score_file = "user://highscore.txt"
var highscore = 0 setget set_highscore, get_highscore

# Settings
var music = true setget set_music, get_music

var control_list = ["keyboard", "mouse"]
var control_type = control_list[0]

var difficulty_list = ["easy", "medium", "hard"]
var difficulty_type = difficulty_list[0] setget set_difficulty

var difficulty_converter = {"easy": [100, 20], "medium": [130, 25], "hard": [160, 45]}


func _ready() -> void:
	load_score()
	update_difficulty()


func update_difficulty():
	speed = difficulty_converter[difficulty_type][0]
	acceleration = difficulty_converter[difficulty_type][1]


func load_score():
	var f = File.new()
	if f.file_exists(score_file):
		f.open(score_file, File.READ)
		var content = f.get_as_text()
		highscore = int(content)
		f.close()


func save_score():
	var f = File.new()
	f.open(score_file, File.WRITE)
	f.store_string(str(highscore))
	f.close()


func set_score(value):
	score = value
	if score > highscore:
		self.highscore = score
	get_tree().get_root().get_node("world/ui/score").text = "Score: " + str(score)


func get_score():
	return score


func set_highscore(value):
	highscore = value
	save_score()
	get_tree().get_root().get_node("world/ui/highscore").text = "Highscore: " + str(highscore)


func get_highscore():
	return highscore


func lose_game():
	get_tree().get_root().get_node("world/player").get_node("destroy_particle").emitting = true
	get_tree().get_root().get_node("world/player").get_node("mouth").hide()
	get_tree().get_root().get_node("world/player").get_node("player_collider").disabled = true
	get_tree().get_root().get_node("/root/destroy_effect").play()
	yield(get_tree().create_timer(1), "timeout")
	scene_changer.change_scene("res://scenes/ui/lose_screen.tscn")


func set_music(value):
	music = value
	if music:
		get_node("/root/soundtrack").stream_paused = false
	else:
		get_node("/root/soundtrack").stream_paused = true


func get_music():
	return music


func set_difficulty(value):
	difficulty_type = value
	update_difficulty()
