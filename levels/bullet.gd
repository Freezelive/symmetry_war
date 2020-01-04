extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var speed = 10000
var velocity_bullet = Vector2(0,-2)
var me
var me_visibility
# Called when the node enters the scene tree for the first time.
func _ready():
	me=self.get_node("Bullet_kin_body")
	velocity_bullet.normalized()
	#me.position=Vector2(200,200)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
#		
func _process(delta):
	me.move_and_slide(velocity_bullet*delta*speed)
#	print(me.position)
#	print(me_visibility.is_on_screen())
	pass


func _on_bullet_visibility_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	print (area)
	queue_free()
	pass # Replace with function body.
