extends Area2D

@export var target_level : PackedScene

func _on_body_entered(body):
	if body.name == "player":
		var win_label = get_tree().get_first_node_in_group("win_label")
		if win_label == null:
			var game_node = get_tree().root.get_node_or_null("game")
			if game_node:
				win_label = game_node.get_node_or_null("CanvasLayer/Control/WinLabel")
		
		if win_label:
			win_label.visible = true
			var timer_label = get_tree().root.get_node_or_null("game/CanvasLayer/Control/TimerLabel")
			if timer_label:
				timer_label.visible = true
			var countdown = 3
			print("Win screen countdown: ", countdown)
			if timer_label:
				timer_label.text = str(countdown)
			Engine.time_scale = 0.0
			var start_time = Time.get_ticks_msec()
			var last_second = 0
			while countdown > 0:
				await get_tree().process_frame
				var elapsed_ms = Time.get_ticks_msec() - start_time
				var current_second = int(elapsed_ms / 1000.0)
				if current_second > last_second:
					last_second = current_second
					countdown -= 1
					if timer_label:
						timer_label.text = str(countdown)
					if countdown > 0:
						print("Win screen countdown: ", countdown)
			Engine.time_scale = 1.0
			if target_level != null:
				get_tree().change_scene_to_packed(target_level)
			return
		
		if target_level == null:
			return
		get_tree().change_scene_to_packed(target_level)
