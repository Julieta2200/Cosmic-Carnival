extends Control

var scene = load("res://Projects/Level/Whac_a_mole/Wam.tscn")

func _on_play_button_pressed():
	get_tree().change_scene_to_packed(scene)
