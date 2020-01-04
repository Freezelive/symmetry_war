extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity_enemy = Vector2(0,1)
var speed=10000
var me
var me_visibility
var HP = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	me=self.get_node("enemy_1_kin_body")
	velocity_enemy.normalized()
	#me.position=Vector2(200,200)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
#		
func _process(delta):
	me.move_and_slide(velocity_enemy*delta*speed)
#	print(me.position)
#	print(me_visibility.is_on_screen())
	pass



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	HP -=1
	if HP ==0 :
		queue_free()
	pass # Replace with function body.
