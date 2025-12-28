extends Control

@onready var main_buttons: VBoxContainer = $"Panel2/main buttons"
@onready var options: Panel = $"Panel2/Options"


func _ready():
	main_buttons.visible = true
	options.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_options_pressed():
	print("Options pressed")
	main_buttons.visible = false
	options.visible = true

func _on_exit_pressed():
	get_tree().quit()


func _on_back_options_pressed() -> void:
	_ready()


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")

func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")

func _input(event):
	if event.is_action_pressed("ui_cancel"): # ESC
		get_tree().change_scene_to_file("res://main_menu.tscn")
