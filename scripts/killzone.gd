extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("PLAYER"):
		body.high_score = max(body.high_score, body.score)
		# use global
		print("Set high score to: " + str(body.high_score))
		get_tree().call_deferred("reload_current_scene")
