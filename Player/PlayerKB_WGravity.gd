extends KinematicBody

export var movement_speed:= 10
export var rotation_speed:=.01
export var jump_power:=12

var jumping:=false

var gravity:=-24.0
var velocity:=Vector3.ZERO

func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _physics_process(delta):
	var vy = velocity.y
	get_input()
	
	velocity.y = vy + gravity * delta
	
	velocity = move_and_slide(velocity, Vector3.UP)
	
	if jumping and is_on_floor():
		velocity.y = jump_power
	
	$MeshInstance.rotate_x(velocity.x)
	

func get_input():
	velocity = Vector3.ZERO
	
	var z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity+=z*movement_speed *transform.basis.z
	
	var x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity+=x*movement_speed *transform.basis.x

	jumping = Input.is_action_pressed("ui_select")
	
	if(Input.is_action_pressed("rightbutton")):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-lerp(0, rotation_speed, event.relative.x))

func jumpBoost():
	if($BoostTimer.is_stopped()):
		jump_power=30
		$BoostTimer.start()


func _on_BoostTimer_timeout():
	jump_power=12
	
func apply_force(dir:Vector3):
	velocity+=dir
	
	
	
	
