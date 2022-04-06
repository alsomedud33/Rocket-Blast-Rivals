extends KinematicBody

var frame = 0 
var duration = 5
export var speed:int = 10
var velocity = Vector3()
var bounce
onready var explosion = preload("res://Assets/Hitboxes/Explosion_Hitbox.tscn")#: PackedScene
#onready var decal = preload('res://assets/Textures/Bullet Decal.tscn')
onready var main = get_tree().current_scene

#onready var explosion_instance = explosion.instance()

func _ready():
	Globals.proj_counter += 1
	set_as_toplevel(true)
	$Timer.start(duration)


func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector3.UP,false, 4, PI/4, false)
	bounce = move_and_collide(velocity * delta)
	for index in get_slide_count():
		if index == 0:
			var collision = get_slide_collision(index)
			var explosion_instance = explosion.instance()
			
#			var decal_instance = decal.instance()
#			main.add_child(decal_instance)
#			#$RayCast.get_collider().add_child(decal_instance)
#			#collision.get_collider().add_child(decal_instance)
#			decal_instance.transform.origin = $RayCast.get_collision_point()#collision.get_position()
#			print ($RayCast.get_collision_point())
#			decal_instance.look_at($RayCast.get_collision_point() + $RayCast.get_collision_normal(), Vector3.UP)#(collision.get_position() + collision.get_normal()*2, Vector3.UP)
#
			explosion_instance.y_explode_ratio = 1
			main.add_child(explosion_instance)
			explosion_instance.global_transform.origin = collision.get_position()
			
			queue_free()
		#collision.normal
	#velocity = move_and_collide(velocity * delta)

func _on_Area_area_entered(area):
	if area.name !=("Portal"):
		print("bye")
		queue_free()


func _on_Timer_timeout():
	queue_free()

