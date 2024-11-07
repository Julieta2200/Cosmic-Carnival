class_name Monster extends Node

@export var stay_time : float


func _on_draw():
	$Disappear_timer.wait_time = stay_time
	$AnimatedSprite2D.play("idle")
	$Disappear_timer.start()
	$Area2D.get_node("CollisionShape2D").disabled = false
	

func _on_disappear_timer_timeout():
	$".".hide()

func animation():
	$AnimatedSprite2D.play("hit")

func _on_animated_sprite_2d_animation_finished():
	$".".hide()
