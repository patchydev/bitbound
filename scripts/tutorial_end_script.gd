extends Area2D

@onready var completion_label: Label = $"../CompletionLabel"
var triggered: bool = false

func _ready():
	body_entered.connect(_on_body_entered)
	
	if completion_label:
		completion_label.visible = false
		
func _on_body_entered(body):
	if (body.name == "Player") and not triggered:
		triggered = true
		show_completion_message()
		
func show_completion_message():
	if completion_label:
		completion_label.visible = true
		
	await get_tree().create_timer(2.0).timeout
	complete_tutorial()
	
func complete_tutorial():
	SaveManager.set_value("tutorial_completed", true)
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
