extends Area2D

@onready var timer: Timer = $Timer
var damage_processed = false

func _on_body_entered(body):
	# Check if the body is the player
	if body.name == "player" or body.is_in_group("player"):
		# Only process damage once per entry to avoid multiple hits
		if damage_processed:
			return
		
		damage_processed = true
		print("Player hit killzone!") 
		
		# Visual feedback (slow-mo effect)
		Engine.time_scale = 0.5
		
		# Reduce hearts instead of killing immediately
		if GameManager:
			GameManager.reduce_hearts(1)
			print("Hearts reduced. Current hearts: ", GameManager.get_hearts())
		
		# Reset flag after timer to allow future damage
		timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0 
	damage_processed = false
	# Don't reload scene here - let player.die() handle it when hearts reach 0
