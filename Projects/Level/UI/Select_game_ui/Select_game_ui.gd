extends Select_button

var scene = load("res://Players_number_ui.tscn")

func _ready():
	buttons = $Games.get_children()
	for game in buttons:
		if game.status:
			game.lock.visible = false
	highlight_game(index)

func open_selected_game():
	var selected_game = buttons[index]
	if selected_game.status:
		get_tree().change_scene_to_packed(scene)
		GameInfo.scene = selected_game.scene

