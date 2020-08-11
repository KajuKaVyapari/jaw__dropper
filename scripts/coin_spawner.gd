extends Spatial


onready var coin = preload("res://scenes/coin.tscn")
var i =0
var coins = []



func _on_coin_timer_timeout() -> void:
	coins.push_back(coin.instance())
	coins[i].transform.origin.y = get_parent().transform.origin.y
	coins[i].transform.origin.x += randi() % 8 - randi() % 16
	coins[i].transform.origin.z += randi() % 8 - randi() % 16
	get_parent().get_parent().add_child(coins[i])
	i += 1
