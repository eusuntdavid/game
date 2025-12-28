extends Node

# Score management
var score = 0

# Hearts management
var max_hearts: int = 3
var current_hearts: int = 3

signal hearts_changed(hearts: int)
signal hearts_depleted

@onready var score_label: Label = $"score label"


func _ready() -> void:
	# Initialize hearts
	reset_hearts()


func add_point():
	score += 1
	if score_label:
		score_label.text = "you collected " + str(score) + " coins."


func reset_hearts() -> void:
	current_hearts = max_hearts
	hearts_changed.emit(current_hearts)


func reduce_hearts(amount: int = 1) -> void:
	current_hearts = max(0, current_hearts - amount)
	hearts_changed.emit(current_hearts)
	
	if current_hearts <= 0:
		hearts_depleted.emit()


func get_hearts() -> int:
	return current_hearts


func get_max_hearts() -> int:
	return max_hearts
