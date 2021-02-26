extends RigidBody

export var force:float=10

func _ready():
	apply_central_impulse(Vector3.FORWARD*force)
