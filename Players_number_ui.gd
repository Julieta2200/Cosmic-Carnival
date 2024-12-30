extends Select_button

var players_count : int
var scene = load("res://Projects/Level/UI/Player_info.tscn")

func _ready():
	buttons = $Players_number.get_children()
	highlight_game(index)

func open_selected_game():
	GameInfo.player_count = index + 1
	get_tree().change_scene_to_packed(scene)
