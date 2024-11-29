extends Control

var games: Dictionary = {
		0: {"texture": "res://Assets/Details/Select the Game/Game poster.png", "scene": "res://Projects/Level/Whac_a_mole/Wam.tscn","status" : true},
		1: {"texture": "", "scene": "", "status" : false},
		2: {"texture": "", "scene": "", "status" : false}
	} 
	
var index: int = 0
var games_bord : Array

func _ready():
	games_bord = $Games.get_children()
	for i in games:
		if games[i]["status"]:
			games_bord[i].lock.visible = false
			games_bord[i].texture = load(games[i]["texture"])
	highlight_game(index)

func _process(_delta):
	if Input.is_action_just_pressed("right"):
		change_index(index + 1)
	elif Input.is_action_just_pressed("left"):
		change_index(index - 1)
	elif Input.is_action_just_pressed("enter"):
		open_selected_game()

func highlight_game(new_index: int):
	for i in games.keys():
		if i == new_index:
			games_bord[i].frame.visible = true
		else:
			games_bord[i].frame.visible = false

func change_index(new_index: int):
	index = clamp(new_index, 0, games.size() - 1)
	highlight_game(index)

func open_selected_game():
	var selected_game = games[index]
	if selected_game["status"]:
		get_tree().change_scene_to_file(selected_game["scene"])

