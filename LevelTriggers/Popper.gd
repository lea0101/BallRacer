extends Area



func _on_Popper_body_entered(body):
	if body.collision_layer==2:
		$AnimationPlayer.play("Pop")
		body.apply_force(Vector3.UP * 10)

func _on_Popper_body_exited(body):
	if body.collision_layer==2:
		$AnimationPlayer.play_backwards("Pop")
