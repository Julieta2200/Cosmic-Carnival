extends Node

var save_file_dir: String = "user://savegame.save"

# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()

func save_game():
	if FileAccess.file_exists(save_file_dir):
		DirAccess.remove_absolute(save_file_dir)
	var save_file = FileAccess.open(save_file_dir, FileAccess.WRITE)
	var data = {
		"tickets": TicketManager.tickets_qty
	}
	save_file.store_line(JSON.stringify(data))

func load_game():
	if not FileAccess.file_exists(save_file_dir):
		print("no save data")
		return
	var save_file = FileAccess.open(save_file_dir, FileAccess.READ)
	var json = JSON.new()
	var data_str = save_file.get_line()
	var parse_result = json.parse(data_str)
	if not parse_result == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", data_str, " at line ", json.get_error_line())
		return

	# Get the data from the JSON object
	var data: Dictionary = json.get_data()
	
	if data.has("tickets"):
		TicketManager.tickets_qty = data.get("tickets")
	
