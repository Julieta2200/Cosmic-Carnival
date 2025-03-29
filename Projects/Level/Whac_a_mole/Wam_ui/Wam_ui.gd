extends Control

@onready var timer = $Timer

var time: int = 60:
	set(t):
		time = t
		if time >= 0:
			set_number($Time/Number,time)
		else:
			$Timer.stop()
			$"../..".game_stop()

func _ready():
	set_number($Time/Number,time)

func set_number(score,i):
	score.get_child(2).text = str(i % 10)
	score.get_child(1).text = str((i / 10) % 10)
	score.get_child(0).text = str((i / 100) % 10)

func _on_timer_timeout():
	time -= 1

