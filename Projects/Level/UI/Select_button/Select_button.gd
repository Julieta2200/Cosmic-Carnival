class_name Select_button extends Node


var index: int = 0:
	set(s):
		index = clamp(s, 0, buttons.size() - 1)
		highlight_game(index)
		
var buttons: Array

func _process(_delta):
	if Input.is_action_just_pressed("right"):
		index += 1
	elif Input.is_action_just_pressed("left"):
		index -= 1
	elif Input.is_action_just_pressed("enter"):
		open_selected_game()

func highlight_game(new_index: int):
	for i in buttons.size():
		if i == new_index:
			buttons[i].get_child(0).visible = true
		else:
			buttons[i].get_child(0).visible = false

func open_selected_game():
	pass
