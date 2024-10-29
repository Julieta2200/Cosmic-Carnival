extends Node2D

@export var speed : int
@onready var animation = $AnimationPlayer


var on_enemy : bool = false

func move():
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	position += direction * speed

func _physics_process(_delta):
	move()
	if $Area2D.get_overlapping_areas() != []:
		var area = $Area2D.get_overlapping_areas()
		for i in area:
			if i.get_parent().visible :
				on_enemy = true
				return
#
#func _on_area_2d_area_entered(area):
#	if area.get_parent().visible :
#		on_enemy = true
#
#func _on_area_2d_area_exited(area):
#	if area.get_parent().visible:
#		on_enemy = false
