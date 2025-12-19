extends Area2D

@export var target_level : PackedScene

func _on_body_entered(body):
	print("finish.gd: body_entered with:", body.name)
	print("finish.gd: target_level is:", target_level)
	if body.name == "player":
		if target_level == null:
			print("finish.gd: ERROR - target_level is null, cannot change scene.")
			return
		print("finish.gd: changing scene to next level.")
		get_tree().change_scene_to_packed(target_level)
