extends Node2D

@export var count : int
@export var appear_time : float

@onready var monsters_1 = $Monsters_1
@onready var monsters_2 = $Monsters_2
@onready var monsters_3 = $Monsters_3
@onready var hammer = $Hammer

var enemy

func _ready():
	$Appear_timer.start()

func enemy_appear():
	var rand = randf()
	if rand < 0.3:
		enemy_show(monsters_1)
	elif rand < 0.7:
		enemy_show(monsters_2)
	else:
		enemy_show(monsters_3)

func enemy_show(enemies):
	var enemy_index = randi_range(0, enemies.get_child_count() - 1)
	enemy = enemies.get_child(enemy_index)
	enemy.show()

func _physics_process(_delta):
	if Input.is_action_just_pressed("space"):
		hit()

func hit():
	if hammer.on_enemy:
		if hammer.position.x > enemy.position.x:
			hammer.animation.play("hit_left")
		else:
			hammer.animation.play("hit_right")
		if monsters_1.get_children().has(enemy) || monsters_2.get_children().has(enemy):
			enemy.hide()
			$CanvasLayer/hit_a_beaver_ui.set_score(1)
		elif monsters_3.get_children().has(enemy):
			enemy.hide()
			$CanvasLayer/hit_a_beaver_ui.set_score(-1)
		hammer.on_enemy = false
	else: 
		hammer.animation.play("hit")

func _on_appear_timer_timeout():
	$Appear_timer.wait_time = appear_time
	if count > 0:
		enemy_appear()
		count -= 1


func _on_monster_hidden():
	$Appear_timer.start()
