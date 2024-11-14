class_name Monster extends Node

@export var stay_time : float
@onready var disappear_timer = $Disappear_timer
var disappear : bool 

func _ready():
	$Disappear_timer.wait_time = stay_time

func _on_draw():
	disappear = false
	$Disappear_timer.start()
	$appear_animated.visible = true
	$appear_animated.play("appear")


func _on_disappear_timer_timeout():
	disappear = true
	$disappear_animated2.visible = true
	$idle_animated.visible = false
	$disappear_animated2.play("disappear")


func dizzy_animation():
	disappear = true
	disappear_timer.stop()
	$idle_animated.visible = false
	$dizzy_animated.visible = true
	$dizzy_animated.play("dizzy")


func _on_disappear_animated_animation_finished():
	$"../..".monster_delete(self)
	$".".hide()
	$disappear_animated.visible = false


func _on_appear_animated_animation_finished():
	$appear_animated.visible = false
	$idle_animated.visible = true
	$idle_animated.play("idle")


func _on_disappear_animated_2_animation_finished():
	$"../..".monster_delete(self)
	$".".hide()
	$disappear_animated2.visible = false


func _on_dizzy_animated_animation_finished():
	$dizzy_animated.visible = false
	$disappear_animated.visible = true
	$disappear_animated.play("disappear")
