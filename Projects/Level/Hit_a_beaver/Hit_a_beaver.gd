extends Node2D

@onready var circles = $Circles
@onready var hammer = $Hammer
@onready var monsters_types : Dictionary = {"blue": $Monsters_1, "orange":$Monsters_2, "pink":$Monsters_3}

@export var monster_probabilities : Dictionary = {"blue": 0,"orange": 0,"pink": 0}
@export var count : int

var appear_time : float
var monsters: Dictionary 

func _ready():
	$Appear_timer.start()

func _physics_process(_delta):
	if Input.is_action_just_pressed("space"):
		hit()
		
func enemy_appear():
	var random_number = randf_range(0, 100)
	var cumulative_probability = 0
	
	for i in monster_probabilities.keys():
		cumulative_probability += monster_probabilities[i]
		if random_number <= cumulative_probability:
			enemy_show(monsters_types[i])
			break

func enemy_show(enemies):
	while monsters.size() < 5:
		var i = randi_range(0, enemies.get_child_count() - 1)
		if !monsters.has(i):
			monsters[i] = enemies.get_child(i)
			monsters[i].show()
			break
			
func monster_delete(monster):
	for i in monsters.keys():
		if monsters[i] == monster:
			monsters.erase(i)
			return

func hit():
	for i in circles.get_child_count():
		if circles.get_child(i).visible:
			for j in monsters.keys():
				if j == i && !monsters[j].disappear:
					$CanvasLayer/hit_a_beaver_ui.hammer = "2"
					var monster = monsters[j]
					if monsters_types["blue"].get_children().has(monster):
						$CanvasLayer/hit_a_beaver_ui.score += 1
					elif monsters_types["orange"].get_children().has(monster):
						$CanvasLayer/hit_a_beaver_ui.score += 3
					elif monsters_types["pink"].get_children().has(monster):
						$CanvasLayer/hit_a_beaver_ui.score -= 1
					monster.dizzy_animation()
					hammer.animation()
					return

func _on_appear_timer_timeout():
	appear_time = randf_range(0.5,1.5)
	$Appear_timer.wait_time = appear_time
	if count > 0:
		enemy_appear()
		count -= 1
	else:
		$Appear_timer.stop()


func _on_monster_hidden():
	pass
