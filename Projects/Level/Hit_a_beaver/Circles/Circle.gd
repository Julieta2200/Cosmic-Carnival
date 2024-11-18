class_name Circle extends Node2D

var monster : Monster

func _on_area_2d_area_entered(area):
	if area.get_parent() is Hammer:
		$Highlight.visible = true
	elif  area.get_parent() is Monster:
		monster = area.get_parent()

func _on_area_2d_area_exited(area):
	if area.get_parent() is Hammer:
		$Highlight.visible = false
	elif  area.get_parent() is Monster:
		monster == null
