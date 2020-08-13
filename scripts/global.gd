extends Node


var speed = 100
var acceleration = 20
var score = 0 setget set_score, get_score
var spawners = 0
var spawners_instances = []
var spawners_iter = 0
var coins = 0


func set_score(value):
	score = value
	get_tree().get_root().get_node("world/ui/score").text = str(score)



func get_score():
	return score
