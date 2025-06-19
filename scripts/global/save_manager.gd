extends Node

const SAVE_FILE = "user://save.dat"

var data = {}

func _ready():
	load_data()
	
func save_data():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()
	
func load_data():
	if FileAccess.file_exists(SAVE_FILE):
		var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
		var json = JSON.new()
		json.parse(file.get_as_text())
		data = json.data
		file.close()

func set_value(key: String, value):
	data[key] = value
	save_data()
	
func get_value(key: String, default_value = null):
	return data.get(key, default_value)
	
func has_key(key: String) -> bool:
	return key in data
