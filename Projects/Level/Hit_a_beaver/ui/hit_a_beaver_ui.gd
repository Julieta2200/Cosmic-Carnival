extends Control

var hammer: String

var time: int :
	set(t):
		time = t
		if time < 1000:
			set_number($time/numbers/units,$time/numbers/tens,$time/numbers/hundreds,time)

var score: int :
	set(s):
		score = s
		if score < 0:
			score += 1
		elif score < 1000 :
			if hammer == "1":
				set_number($"hammers/1/scores/units",$"hammers/1/scores/tens",$"hammers/1/scores/hundreds",score)
			elif hammer == "2":
				set_number($"hammers/2/scores/units",$"hammers/2/scores/tens",$"hammers/2/scores/hundreds",score)
			elif hammer == "3":
				set_number($"hammers/3/scores/units",$"hammers/3/scores/tens",$"hammers/3/scores/hundreds",score)
			elif hammer == "4":
				set_number($"hammers/4/scores/units",$"hammers/4/scores/tens",$"hammers/4/scores/hundreds",score)


func set_number(units,tens,hundreds,i):
	units.text = str(i % 10)
	tens.text = str((i / 10) % 10)
	hundreds.text = str((i / 100) % 10)

func _on_timer_timeout():
	time += 1

