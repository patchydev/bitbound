extends Button


func _on_pressed() -> void:
	if not SaveManager.has_key("tutorial_completed") or SaveManager.get_value("tutorial_completed") != true:
		get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/initial_game.tscn")
