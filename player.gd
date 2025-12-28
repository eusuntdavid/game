extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -305.0 

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0: 
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()


func die() -> void:
	# Simple death behaviour: restart the current level.
	get_tree().reload_current_scene()


func _ready() -> void:
	# Reset hearts when player is ready (on level load/reload)
	if GameManager:
		GameManager.reset_hearts()
		# Connect to GameManager to handle hearts depletion
		if not GameManager.hearts_depleted.is_connected(_on_hearts_depleted):
			GameManager.hearts_depleted.connect(_on_hearts_depleted)


func _on_hearts_depleted() -> void:
	# When hearts reach 0, the player dies
	die()
