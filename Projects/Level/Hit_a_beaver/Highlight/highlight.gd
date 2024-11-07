extends Node2D

signal monster_in_area
var hit : bool 

func _on_area_2d_area_entered(area):
	if area.get_parent().name == "Hammer":
		area.get_parent().selected_circle = self
		visible = true


func _on_area_2d_area_exited(area):
	if area.get_parent().name == "Hammer":
		visible = false

func _on_monster_in_area():
	if visible:
		if $Area2D.get_overlapping_areas() != []:
			var area = $Area2D.get_overlapping_areas()
			for i in area:
				if i.get_parent() is Monster && i.get_parent().visible:
					hit = true
					return
