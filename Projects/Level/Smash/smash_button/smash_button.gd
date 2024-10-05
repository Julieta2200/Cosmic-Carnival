class_name SmashButton extends Node2D

var value: Smash.Actions

var textures: Dictionary = {
	Smash.Actions.A: "res://Details/a.png",
	Smash.Actions.B: "res://Details/b.png",
	Smash.Actions.X: "res://Details/x.png",
	Smash.Actions.Y: "res://Details/y.png",
}

# Called when the node enters the scene tree for the first time.
func _ready():
	var i: int = randi_range(0, textures.size()-1)
	value = i as Smash.Actions
	$sprite.texture = load(textures[i])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
