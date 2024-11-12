extends Node2D

@export var count : int

@onready var monsters_1 = $Monsters_1
@onready var monsters_2 = $Monsters_2
@onready var monsters_3 = $Monsters_3
@onready var circles = $Circles_highlight
@onready var hammer = $Hammer

var appear_time : float
var monsters: Dictionary 

func _ready():
	$Appear_timer.start()

func _physics_process(_delta):
	if Input.is_action_just_pressed("space"):
		hit()
		
func enemy_appear():
	var rand = randf()
	if rand < 0.3:
		enemy_show(monsters_1)
	elif rand < 0.7:
		enemy_show(monsters_2)
	else:
		enemy_show(monsters_3)

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
				if j == i:
					var monster = monsters[j]
					monsters.erase(j)
					hammer.animation.play("hit")
					if monsters_1.get_children().has(monster):
						$CanvasLayer/hit_a_beaver_ui.score += 1
					elif monsters_2.get_children().has(monster):
						$CanvasLayer/hit_a_beaver_ui.score += 3
					elif monsters_3.get_children().has(monster):
						$CanvasLayer/hit_a_beaver_ui.score -= 1
					monster.animation()
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
