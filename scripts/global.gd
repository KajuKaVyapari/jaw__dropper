extends Node


var speed = 100
var acceleration = 20
var score = 0 setget set_score, get_score


func set_score(value):
	score = value
	get_tree().get_root().get_node("world/ui/score").text = str(score)



func get_score():
	return score
