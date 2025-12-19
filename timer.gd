extends Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	Reset_Timer()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
var seconds=0
var minutes=0
var Dseconds=30
var Dminutes=1
func _on_timeout():
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60

		else:
			player.die()
			timer.stop()
			return

	$"../Label".text=str(minutes)+":"+str(seconds)
	pass # Replace with function body.
func Reset_Timer():
	seconds=Dseconds
	minutes=Dminutes
	
@onready var player = $"../player"
@onready var label = $"../Label"
@onready var timer: Timer = $Timer

func _on_timer_timeout():
	player.die()
	
	
	
