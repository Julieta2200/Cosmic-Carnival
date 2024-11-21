extends Control

var time: int :
	set(t):
		time = t
		if time < 1000:
			set_number($time/number,time)


func set_number(score,i):
	score.get_child(2).text = str(i % 10)
	score.get_child(1).text = str((i / 10) % 10)
	score.get_child(0).text = str((i / 100) % 10)

func _on_timer_timeout():
	time += 1

