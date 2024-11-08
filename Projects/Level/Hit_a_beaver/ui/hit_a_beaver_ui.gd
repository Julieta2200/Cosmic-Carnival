extends Control

var score: int :
	set(s):
		score = s
		if score < 0:
			score += 1
		elif score < 1000 :
			set_number($tables/score/numbers/units,$tables/score/numbers/tens,$tables/score/numbers/hundreds,score)
			
var time: int :
	set(t):
		time = t
		if time < 1000:
			set_number($tables/time/numbers/units,$tables/time/numbers/tens,$tables/time/numbers/hundreds,time)
		

var numbers = ["res://Details/Hit_a_beaver/Numbers/0.png","res://Details/Hit_a_beaver/Numbers/1.png",
				"res://Details/Hit_a_beaver/Numbers/2.png","res://Details/Hit_a_beaver/Numbers/3.png",
				"res://Details/Hit_a_beaver/Numbers/4.png","res://Details/Hit_a_beaver/Numbers/5.png",
				"res://Details/Hit_a_beaver/Numbers/6.png","res://Details/Hit_a_beaver/Numbers/7.png",
				"res://Details/Hit_a_beaver/Numbers/8.png","res://Details/Hit_a_beaver/Numbers/9.png"]


func set_number(units,tens,hundreds,i):
	units.texture = load(numbers[i % 10])
	tens.texture = load(numbers[(i / 10) % 10])
	hundreds.texture = load(numbers[(i / 100) % 10])

func _on_timer_timeout():
	time += 1

