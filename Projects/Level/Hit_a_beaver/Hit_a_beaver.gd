extends Node2D

@export var count : int
@export var appear_time : float
@export var probability : float

@onready var beavers = $Board/Beavers
@onready var bombs = $Board/Bombs
@onready var hammer = $Hammer
var enemy

func _ready():
	$Appear_timer.wait_time = appear_time
	$Appear_timer.start()

func enemy_appear():
	var rand = randf()
	if rand > (probability / 100):
		enemy_show(beavers)
	else:
		enemy_show(bombs)
	
func enemy_show(enemies):
	var enemy_index = randi_range(0, enemies.get_child_count() - 1)
	enemy = enemies.get_child(enemy_index)
	enemy.show()
	
func _on_enemy_hidden():
	$Appear_timer.start()

func _physics_process(delta):
	if Input.is_action_just_pressed("space"):
		hit()
		
func hit():
	if hammer.on_enemy:
		if enemy is Beaver:
			enemy.hide()
			print("beaver")
		elif enemy is Bomb:
			print("bomb")
		hammer.on_enemy = false

func _on_appear_timer_timeout():
	if count > 0:
		enemy_appear()
		count -= 1
