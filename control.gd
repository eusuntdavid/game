extends Control

@onready var timer: Timer = $Timer
@onready var label: Label = $Label
# The player is at the scene root: CanvasLayer/Control/TopBar/timer -> ../../../../player
@onready var player = $"../../../../player"

var seconds := 0
var minutes := 0
var Dseconds := 30
var Dminutes := 1


func _ready() -> void:
	Reset_Timer()
	timer.wait_time = 1.0
	if not timer.timeout.is_connected(_on_Timer_timeout):
		timer.timeout.connect(_on_Timer_timeout)
	timer.start()


func _on_Timer_timeout() -> void:
	if minutes <= 0 and seconds <= 0:
		timer.stop()
		print('died22222')
		if is_instance_valid(player) and player.has_method("die"):
			player.die()
			print('died')
		return

	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60

	seconds -= 1
	label.text = "%d:%02d" % [minutes, seconds]


func Reset_Timer() -> void:
	seconds = Dseconds
	minutes = Dminutes
	label.text = "%d:%02d" % [minutes, seconds]
