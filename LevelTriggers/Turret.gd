extends Area


var projectile_prefab = preload("res://LevelTriggers/Cannonball.tscn")

export var fire_rate:float=2.0
export var rotation_speed=10.0

onready var turret_base:=$Base
onready var turret_barrel:=$Base/Barrel
onready var projectile_launcher:=$Base/Barrel/Position3D

onready var target = null

func _ready():
	$Timer.wait_time=fire_rate
	$Timer.autostart=false
	$Timer.one_shot=true

func _process(delta):
	if(target!=null):
		aim()
		
func aim():
	turret_base.look_at(target.translation, Vector3.UP)
	
func fire():
	print("Firing at: " + str(target.translation))
	var projectile = projectile_prefab.instance()
	get_parent().add_child(projectile)	
	projectile.translation=projectile_launcher.translation
	projectile.rotation=projectile_launcher.rotation

func _on_Turret_body_entered(body):
	if body.collision_layer==2:
		print("Entering ", body.name)
		target=body
		$Timer.start()

func _on_Turret_body_exited(body):
	if body.collision_layer==2:
		print("Exiting ", body.name)
		target=null

func _on_Timer_timeout():
	if(target!=null):
		fire()
		$Timer.start()
