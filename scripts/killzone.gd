extends Area2D

func _on_body_entered(body):
	if body.name == "player" or body.is_in_group("player"):
		if body.has_method("die"):
			body.call_deferred("die")
