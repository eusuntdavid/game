extends CharacterBody2D

@export var speed: float = 150.0

func _physics_process(delta):
	var input_vector := Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)

	input_vector = input_vector.normalized()
	velocity = input_vector * speed
	move_and_slide()

	# ANIMAȚII
	if input_vector.length() > 0:
		$AnimatedSprite2D.play("run")

		# întoarcere stânga / dreapta
		if input_vector.x != 0:
			$AnimatedSprite2D.flip_h = input_vector.x < 0
	else:
		$AnimatedSprite2D.play("idle")
