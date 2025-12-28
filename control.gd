extends Control

@onready var timer: Timer = $Timer
@onready var label: Label = $Label
# The player is two levels up in the tree: player/Camera2D/timer (this Control)
@onready var player = $"../.."
# Heart sprites
@onready var heart1: Sprite2D = $PixelHeart27794221280
@onready var heart2: Sprite2D = $PixelHeart27794221281
@onready var heart3: Sprite2D = $PixelHeart27794221282

var seconds := 0
var minutes := 0
var Dseconds := 30
var Dminutes := 1


func _ready() -> void:
	Reset_Timer()
	# Make sure the timer is ticking every second and connected to our callback.
	print("control.gd: timer starting at %d:%02d" % [minutes, seconds])
	timer.wait_time = 1.0
	if not timer.timeout.is_connected(_on_Timer_timeout):
		timer.timeout.connect(_on_Timer_timeout)
	timer.start()
	
	# Connect to GameManager hearts signals
	if GameManager:
		if not GameManager.hearts_changed.is_connected(_on_hearts_changed):
			GameManager.hearts_changed.connect(_on_hearts_changed)
		# Update hearts display with initial value
		_update_hearts_display(GameManager.get_hearts())


func _on_Timer_timeout() -> void:
	# If we've already reached 0:0, stop counting down.
	if minutes <= 0 and seconds <= 0:
		print("control.gd: time reached 0:00, stopping timer")
		timer.stop()
		if is_instance_valid(player) and player.has_method("die"):
			print("control.gd: calling player.die()")
			player.die()
		else:
			print("control.gd: WARNING - player is invalid or has no die() method")
		return

	# Borrow a minute when seconds hit 0.
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60

	# Decrease one second for this tick.
	seconds -= 1

	# Update the label text (MM:SS with leading zero on seconds) and log it.
	label.text = "%d:%02d" % [minutes, seconds]
	print("control.gd: timer tick -> %d:%02d" % [minutes, seconds])


func Reset_Timer() -> void:
	seconds = Dseconds
	minutes = Dminutes
	# Show initial value immediately.
	label.text = "%d:%02d" % [minutes, seconds]


func _on_hearts_changed(hearts: int) -> void:
	_update_hearts_display(hearts)


func _update_hearts_display(hearts: int) -> void:
	# Show/hide heart sprites based on current hearts count
	heart1.visible = hearts >= 1
	heart2.visible = hearts >= 2
	heart3.visible = hearts >= 3
