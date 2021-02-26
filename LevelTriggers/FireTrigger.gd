extends Area

func _on_Fire_body_entered(body):
	$Particles.emitting=true


func _on_Fire_body_exited(body):
	$Particles.emitting=false

