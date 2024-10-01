extends Node2D

@export var count : int
@export var exit_time : float
@export var stay_time : float
@export var probability : float

@onready var board = $Board
@onready var hammer = $Hammer

var enemy_scene = preload("res://Projects/Level/Hit_a_beaver/Enemy/Enemy.tscn")
var enemy 

func _ready():
	enemy_exit()

func enemy_exit():
	if count != 0:
		count -= 1
		create_timer(exit_time, create_enemy)
	
func create_enemy():
	if enemy == null:
		enemy = enemy_scene.instantiate()
		add_child(enemy)
	var marker_index = randi_range(0, board.get_child_count() - 1)
	enemy.global_position = board.get_child(marker_index).global_position
	enemy.visible = true
	enemy_stay()
	
func enemy_stay():
	create_timer(stay_time,enemy_disappear)

func enemy_disappear():
	enemy.visible = false
	enemy_exit()

func create_timer(wait_time, function):
	var timer = Timer.new()
	timer.wait_time = wait_time
	timer.connect("timeout",function)
	timer.one_shot = true
	add_child(timer)
	timer.start()
	
