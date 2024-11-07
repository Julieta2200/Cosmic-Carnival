extends Node2D

@export var count : int
@export var appear_time : float

@onready var monsters_1 = $Monsters_1
@onready var monsters_2 = $Monsters_2
@onready var monsters_3 = $Monsters_3
@onready var hammer = $Hammer

var monster

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
	monster = enemies.get_child(enemy_index)
	monster.show()

func _physics_process(_delta):
	if Input.is_action_just_pressed("space"):
		hit()

func hit():
	if hammer.hit_monster() && monster != null:
		hammer.animation.play("hit")
		if monsters_1.get_children().has(monster) || monsters_2.get_children().has(monster):
			$CanvasLayer/hit_a_beaver_ui.set_score(1)
		elif monsters_3.get_children().has(monster):
			$CanvasLayer/hit_a_beaver_ui.set_score(-1)
		monster.animation()
	hammer.selected_circle.hit = false


func _on_appear_timer_timeout():
	$Appear_timer.wait_time = appear_time
	if count > 0:
		enemy_appear()
		count -= 1


func _on_monster_hidden():
	$Appear_timer.start()
