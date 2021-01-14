extends Area

onready var animator:=$AnimationPlayer



func _on_SlidingDoors_body_entered(body):
	if("Player" in body.name):
		animator.play("OpenDoor")
