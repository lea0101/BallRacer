extends Area

func _on_Spring_body_entered(body):
	if body.collision_layer==2 and body.has_method("jumpBoost"):
		body.jumpBoost()
