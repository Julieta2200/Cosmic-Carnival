extends Node2D


func _on_area_2d_area_entered(area):
	if area.get_parent().name == "Hammer":
		visible = true


func _on_area_2d_area_exited(area):
	if area.get_parent().name == "Hammer":
		visible = false
