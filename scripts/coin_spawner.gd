extends Spatial


onready var coin = preload("res://scenes/coin.tscn")
var spawner = load("res://scenes/coin_spawner.tscn")
var i =0
var coins = []



func _on_coin_timer_timeout() -> void:
	coins.push_back(coin.instance())
	coins[i].transform.origin.y = get_parent().transform.origin.y
	coins[i].transform.origin.x += randi() % 8 - randi() % 16
	coins[i].transform.origin.z += randi() % 8 - randi() % 16
	get_parent().get_parent().add_child(coins[i])
	i += 1


func _on_self_spawn_timer_timeout() -> void:
	if global.coins < 15:
		get_parent().add_child(spawner.instance())
		global.coins += 1
