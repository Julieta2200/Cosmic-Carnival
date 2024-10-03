extends Node2D

@export var speed : int

var on_beaver : bool = false

func move():
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	position += direction * speed

func _physics_process(_delta):
	move()

func _on_area_2d_area_entered(area):
	if area.get_parent().visible:
		on_beaver = true

func _on_area_2d_area_exited(area):
	if area.get_parent().visible:
		on_beaver = false
