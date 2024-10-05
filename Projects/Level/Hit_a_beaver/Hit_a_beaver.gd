extends Node2D

@export var count : int
@export var appear_time : float
@export var probability : float

@onready var board = $Board
@onready var hammer = $Hammer
var beaver

func _ready():
	$Beaver_appear_timer.wait_time = appear_time
	$Beaver_appear_timer.start()

func enemy_appear():
	if count > 0:
		var beaver_index = randi_range(0, board.get_child_count() - 1)
		beaver = board.get_child(beaver_index)
		beaver.show()
		count -= 1
	
func _on_beaver_appear_timer_timeout():
	enemy_appear()


func _on_beaver_hidden():
	$Beaver_appear_timer.start()

func _physics_process(delta):
	if Input.is_action_just_pressed("space"):
		hit()
		
func hit():
	if $Hammer.on_beaver:
		beaver.hide()
		print("hit")
