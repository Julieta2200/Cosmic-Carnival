extends Node2D

var active : bool
var monster : Monster

func _on_area_2d_area_entered(area):
	if area.get_parent() is Hammer:
		active = true
		$Highlight.visible = true
	elif  area.get_parent() is Monster:
		monster = area.get_parent()

func _on_area_2d_area_exited(area):
	if area.get_parent() is Hammer:
		active = false
		$Highlight.visible = false
	elif  area.get_parent() is Monster:
		monster == null
