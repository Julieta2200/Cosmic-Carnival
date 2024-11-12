class_name Monster extends Node

@export var stay_time : float


func _on_draw():
	$Disappear_timer.wait_time = stay_time
	$idle_animated.play("idle")
	$Disappear_timer.start()
	$Area2D.get_node("CollisionShape2D").disabled = false
	

func _on_disappear_timer_timeout():
	$"../..".monster_delete(self)
	$".".hide()

func animation():
	$hit_animated.visible = true
	$idle_animated.visible = false
	$hit_animated.play("hit")


func _on_hit_animated_animation_finished():
	$hit_animated.visible = false
	$idle_animated.visible = true
	$".".hide()
