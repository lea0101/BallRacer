extends Area

onready var platform:=$Lift

func _on_PlatformLift_body_shape_entered(body_id, body, body_shape, area_shape):
	$AnimationPlayer.play("Up")

func _on_PlatformLift_body_exited(body):
	$AnimationPlayer.play("Down")
