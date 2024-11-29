extends TextureRect

@onready var frame = $Frame
@onready var lock = $Lock

@export var game_name: String:
	set(s):
		$Name.text = s
	
