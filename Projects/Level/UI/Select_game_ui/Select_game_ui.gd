extends Control

var index: int = 0:
	set(s):
		index = clamp(s, 0, games.size() - 1)
		highlight_game(index)
		
var games: Array

func _ready():
	games = $Games.get_children()
	for game in games:
		if game.status:
			game.lock.visible = false
	highlight_game(index)

func _process(_delta):
	if Input.is_action_just_pressed("right"):
		index += 1
	elif Input.is_action_just_pressed("left"):
		index -= 1
	elif Input.is_action_just_pressed("enter"):
		open_selected_game()

func highlight_game(new_index: int):
	for i in games.size():
		if i == new_index:
			games[i].frame.visible = true
		else:
			games[i].frame.visible = false

func open_selected_game():
	var selected_game = games[index]
	if selected_game.status:
		get_tree().change_scene_to_packed(selected_game.scene)

