extends Node2D

@onready var monster_1 = preload("res://Projects/Level/Whac_a_mole/Wam_monsters/Monster_1/Wam_monster_1.tscn")
@onready var monster_2 = preload("res://Projects/Level/Whac_a_mole/Wam_monsters/Monster_2/Wam_monster_2.tscn")
@onready var monster_3 = preload("res://Projects/Level/Whac_a_mole/Wam_monsters/Monster_3/Wam_monster_3.tscn")

@export var monster_probabilities : Dictionary = {"blue": 0,"orange": 0,"pink": 0}
@export var monster_count : int

var monster_create_time : float
var spawn_points: Array
var monsters: Dictionary

func _ready():
	spawn_points = $Points.get_children()

func _on_countdown_ui_hidden():
	$Monster_create_timer.start()
	%Ui.timer.start()
	
func select_monster():
	var random_number = randf_range(0, 100)
	var cumulative_probability = 0

	for i in monster_probabilities.keys():
		cumulative_probability += monster_probabilities[i]
		if random_number <= cumulative_probability:
			spawn_monster(i)
			break

func spawn_monster(monster_type):
	while monsters.size() < spawn_points.size():
		var i = randi_range(0, spawn_points.size() - 1)
		if !monsters.has(i):
			var monster
			match  monster_type:
				"blue":
					monster = monster_1.instantiate()
				"orange":
					monster = monster_2.instantiate()
				"pink":
					monster = monster_3.instantiate()
			monsters[i] = monster
			monster.position = spawn_points[i].position
			$Monsters.add_child(monster)
			monster.create()
			break

func monster_delete(monster):
	for i in monsters.keys():
		if monsters[i] == monster:
			monsters.erase(i)
			break

func _on_monster_create_timer_timeout():
	monster_create_time = randf_range(0.3,0.8)
	$Monster_create_timer.wait_time = monster_create_time
	if monster_count > 0:
		select_monster()
		monster_count -= 1
	else:
		$Monster_create_timer.stop()

func game_stop():
	$Monster_create_timer.stop()
	for i in monsters.keys():
		monsters[i].disappear()
	monsters.clear()
