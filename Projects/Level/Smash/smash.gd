class_name Smash extends Node2D

enum Actions {A, B, X, Y}

var smash_button_scene = preload("res://Projects/Level/Smash/smash_button/smash_button.tscn")
@export var combo_timeout: int

var combo_multiplier: int :
	set(cm):
		combo_multiplier = mini(5, cm)
		%combo_multiplier.text = str(combo_multiplier)
		if cm != 1:
			$combo_timer.wait_time = combo_timeout
			$combo_timer.start()

var score: int :
	set(s):
		score = s
		if score < 0:
			score = 0
		%score.text = str(score)

var button_1: SmashButton : 
	set(b):
		button_1 = b
		button_1.global_position = $"buttons/1".global_position

var button_2: SmashButton : 
	set(b):
		button_2 = b
		button_2.global_position = $"buttons/2".global_position

var button_3: SmashButton : 
	set(b):
		button_3 = b
		button_3.global_position = $"buttons/3".global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var sb: SmashButton = smash_button_scene.instantiate()
	add_child(sb)
	button_1 = sb
	sb = smash_button_scene.instantiate()
	add_child(sb)
	button_2 = sb
	sb = smash_button_scene.instantiate()
	add_child(sb)
	button_3 = sb
	score = 0
	combo_multiplier = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("A"):
		action_pressed(Actions.A)
	elif Input.is_action_just_pressed("B"):
		action_pressed(Actions.B)
	elif Input.is_action_just_pressed("X"):
		action_pressed(Actions.X)
	elif Input.is_action_just_pressed("Y"):
		action_pressed(Actions.Y)

func action_pressed(a: Actions):
	if a == button_1.value:
		add_button()
		score += 10 * combo_multiplier
		combo_multiplier += 1
	else:
		score -= 20
		combo_multiplier = 1

func add_button():
	var sb: SmashButton = smash_button_scene.instantiate()
	add_child(sb)
	button_1.queue_free()
	button_1 = button_2
	button_2 = button_3
	button_3 = sb

func _on_combo_timer_timeout():
	combo_multiplier = 1
