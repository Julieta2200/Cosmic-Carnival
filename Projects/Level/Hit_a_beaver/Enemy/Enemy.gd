extends Node2D

@export var stay_time : float
@onready var appear_timer = $"../../Enemy_appear_timer"

func _on_timer_timeout():
	hide()
	appear_timer.start()

func _on_draw():
	$Disappear_timer.wait_time = stay_time
	$Disappear_timer.start()

