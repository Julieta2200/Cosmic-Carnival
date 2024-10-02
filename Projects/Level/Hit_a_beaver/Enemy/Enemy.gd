extends Node2D

@export var stay_time : float

func _on_timer_timeout():
	hide()

func _on_draw():
	$Disappear_timer.wait_time = stay_time
	$Disappear_timer.start()

