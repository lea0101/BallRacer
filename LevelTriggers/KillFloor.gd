extends Area


func _on_KillFloor_body_entered(body):
	if body.collision_layer==2:
		body.translation = $SpawnPoint1.translation
