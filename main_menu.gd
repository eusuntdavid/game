extends Control

@onready var main_buttons: VBoxContainer = $"main buttons"
@onready var options: Panel = $Options


func _ready():
	main_buttons.visible = true
	options.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_options_pressed():
	print("Options pressed")
	main_buttons.visible = false
	options.visible = true

func _on_exit_pressed():
	get_tree().quit()


func _on_back_options_pressed() -> void:
	_ready()
