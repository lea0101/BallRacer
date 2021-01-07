extends RigidBody
export var speed:=.05
var velocity:Vector3

func _physics_process(delta):
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	apply_central_impulse(velocity.normalized() * speed)


