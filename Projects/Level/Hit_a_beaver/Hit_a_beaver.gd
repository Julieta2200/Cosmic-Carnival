extends Node2D

@export var count : int
@export var appear_time : float
@export var probability : float

@onready var board = $Board
@onready var hammer = $Hammer


func _ready():
	$Enemy_appear_timer.wait_time = appear_time
	$Enemy_appear_timer.start()

func enemy_appear():
	if count > 0:
		var enemy_index = randi_range(0, board.get_child_count() - 1)
		var enemy = board.get_child(enemy_index)
		enemy.show()
		count -= 1
	
func _on_timer_timeout():
	enemy_appear()


func _on_enemy_hidden():
	$Enemy_appear_timer.start()
