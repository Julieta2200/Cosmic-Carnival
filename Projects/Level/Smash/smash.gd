class_name Smash extends Node2D

enum Actions {A, B, X, Y}

var smash_button_scene = preload("res://Projects/Level/Smash/smash_button/smash_button.tscn")

var button_queue: Array[SmashButton]
@onready var button_placeholders: Array[Marker2D] = [
	$"buttons/1", $"buttons/2", $"buttons/3"
]
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

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	add_button()
	add_button()
	add_button()
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
	if a == button_queue[0].value:
		remove_button()
		score += 10 * combo_multiplier
		combo_multiplier += 1
	else:
		score -= 20
		combo_multiplier = 1

func remove_button():
	var btn = button_queue[0]
	button_queue.remove_at(0)
	btn.queue_free()
	add_button()

func add_button():
	var sb: SmashButton = smash_button_scene.instantiate()
	button_queue.append(sb)
	place_buttons()

func place_buttons():
	for i in 3:
		if button_queue.size() > i:
			button_queue[i].global_position = button_placeholders[i].global_position
			if button_queue[i].get_parent() == null:
				add_child(button_queue[i])


func _on_combo_timer_timeout():
	combo_multiplier = 1
