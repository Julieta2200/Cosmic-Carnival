extends Control

var time: int :
	set(t):
		time = t
		if time < 1000:
			set_number($time/number/units,$time/number/tens,$time/number/hundreds,time)


func set_number(units,tens,hundreds,i):
	units.text = str(i % 10)
	tens.text = str((i / 10) % 10)
	hundreds.text = str((i / 100) % 10)

func _on_timer_timeout():
	time += 1

