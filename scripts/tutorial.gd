extends Node2D

var pause_menu = preload("res://scenes/pause_menu.tscn")
var pause_menu_instance = null

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()
		
func toggle_pause():
	if get_tree().paused:
		resume_game()
	else:
		pause_game()
		
func pause_game():
	get_tree().paused = true
	pause_menu_instance = pause_menu.instantiate()
	add_child(pause_menu_instance)

func resume_game():
	get_tree().paused = false
	if pause_menu_instance:
		pause_menu_instance.queue_free()
		pause_menu_instance = null
