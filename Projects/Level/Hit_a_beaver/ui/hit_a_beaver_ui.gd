extends Control

var selected_score :Control

var time: int :
	set(t):
		time = t
		if time < 1000:
			set_number($time/number/units,$time/number/tens,$time/number/hundreds,time)

var score: int :
	set(s):
		score = s
		if score < 0:
			score += 1
		elif score < 1000 :
			set_number(selected_score.get_child(2),selected_score.get_child(1),selected_score.get_child(0),score)


func set_number(units,tens,hundreds,i):
	units.text = str(i % 10)
	tens.text = str((i / 10) % 10)
	hundreds.text = str((i / 100) % 10)

func _on_timer_timeout():
	time += 1

