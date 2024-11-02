extends Control

var time: int = 0
var score: int = 0

var numbers = ["res://Details/Hit_a_beaver/Numbers/0.png","res://Details/Hit_a_beaver/Numbers/1.png",
				"res://Details/Hit_a_beaver/Numbers/2.png","res://Details/Hit_a_beaver/Numbers/3.png",
				"res://Details/Hit_a_beaver/Numbers/4.png","res://Details/Hit_a_beaver/Numbers/5.png",
				"res://Details/Hit_a_beaver/Numbers/6.png","res://Details/Hit_a_beaver/Numbers/7.png",
				"res://Details/Hit_a_beaver/Numbers/8.png","res://Details/Hit_a_beaver/Numbers/9.png"]


func set_time():
	if time < 1000:
		time += 1
		set_number($tables/time/numbers/units,$tables/time/numbers/tens,$tables/time/numbers/hundreds,time)

func set_score(count):
	if count < 0 && score == 0:
		return
	if score < 1000 :
		score += count
		set_number($tables/score/numbers/units,$tables/score/numbers/tens,$tables/score/numbers/hundreds,score)

func set_number(units,tens,hundreds,i):
	units.texture = load(numbers[i % 10])
	tens.texture = load(numbers[(i / 10) % 10])
	hundreds.texture = load(numbers[(i / 100) % 10])

func _on_timer_timeout():
	set_time()


	
