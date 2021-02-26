extends Area


onready var animator:=$AnimationPlayer

func _on_Trigger_body_entered(body):
	animator.play("OpenDoor")
		


func _on_Trigger_body_exited(body):
	animator.play_backwards("OpenDoor")
