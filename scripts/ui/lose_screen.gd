extends Control


func _ready() -> void:
	$score_label.text = "Score: " + str(global.score)
	$highscore_label.text = "Highscore: " + str(global.highscore)
