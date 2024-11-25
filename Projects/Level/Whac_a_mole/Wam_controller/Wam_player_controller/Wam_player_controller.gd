class_name Player_controller extends Controller


func input_action_pressed():
	left = Input.is_action_pressed("player_"+ player_number+ "_left")
	right = Input.is_action_pressed("player_"+ player_number + "_right")
	up = Input.is_action_pressed("player_"+ player_number + "_up")
	down = Input.is_action_pressed("player_"+ player_number  + "_down")
	hit = Input.is_action_just_pressed("player_"+ player_number + "_hit")
