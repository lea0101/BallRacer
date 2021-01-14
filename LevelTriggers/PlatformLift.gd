extends Area

onready var platform:=$Lift

func _on_PlatformLift_body_shape_entered(body_id, body, body_shape, area_shape):
	print(body.name, " entered")
	if("Player" in body.name):
		#platform.translation.y+=1
		$AnimationPlayer.play("Up")

func _on_PlatformLift_body_exited(body):
	print(body.name, " exited")
	if("Player" in body.name):
		#platform.translation.y-=1
		$AnimationPlayer.play("Down")
