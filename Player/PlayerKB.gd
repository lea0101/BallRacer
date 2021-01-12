extends KinematicBody

export var speed:=4
var velocity:Vector3

func _process(delta):
	get_input()

func _physics_process(delta):
	var norm = velocity.normalized() * speed
	rotate_x(norm.z * delta)
	rotate_z(-norm.x * delta)
	move_and_slide(norm)

func get_input():
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

