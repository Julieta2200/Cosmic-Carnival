extends Control

var time = 0
var score = 0

var numbers = ["res://Details/Hit_a_beaver/Numbers/0.png","res://Details/Hit_a_beaver/Numbers/1.png",
				"res://Details/Hit_a_beaver/Numbers/2.png","res://Details/Hit_a_beaver/Numbers/3.png",
				"res://Details/Hit_a_beaver/Numbers/4.png","res://Details/Hit_a_beaver/Numbers/5.png",
				"res://Details/Hit_a_beaver/Numbers/6.png","res://Details/Hit_a_beaver/Numbers/7.png",
				"res://Details/Hit_a_beaver/Numbers/8.png","res://Details/Hit_a_beaver/Numbers/9.png"]

func get_time():
	if time < 1000:
		time += 1
		$tables/time/numbers/units.texture = load(numbers[time%10])
		$tables/time/numbers/tens.texture = load(numbers[(time/10)%10])
		$tables/time/numbers/hundreds.texture = load(numbers[(time/100)%10])

func _on_timer_timeout():
	get_time()

func get_score(count):
	if count < 0 && score == 0:
		return
	if score < 1000 :
		score += count
		$tables/score/numbers/units.texture = load(numbers[score%10])
		$tables/score/numbers/tens.texture = load(numbers[(score/10)%10])
		$tables/score/numbers/hundreds.texture = load(numbers[(score/100)%10])

