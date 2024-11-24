class_name Controller extends Node2D

@export var player_number : String

var player_controller : Dictionary = {"left" : false, "right" : false, "up" : false, "down" : false, "hit" : false}
var computer_controller : Dictionary = {"left" : false, "right" : false, "up" : false, "down" : false, "hit" : false}

func input_action_pressed(controller):
	controller["left"] = Input.is_action_pressed("player_"+ player_number+ "_left")
	controller["right"] = Input.is_action_pressed("player_"+ player_number + "_right")
	controller["up"] = Input.is_action_pressed("player_"+ player_number + "_up")
	controller["down"] = Input.is_action_pressed("player_"+ player_number  + "_down")
	controller["hit"] = Input.is_action_just_pressed("player_"+ player_number + "_hit")

	
