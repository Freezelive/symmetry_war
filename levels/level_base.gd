extends Node2D


onready var player = get_node("player_kin_body")
onready var window_size =OS.get_real_window_size() #get window size to set player at bottom
onready var bullet_object=preload("res://levels/bullet.tscn").instance()
onready var enemy_object=preload("res://enemys/enemy_1.tscn").instance()

var can_i_spawn_enemy = true
var can_i_shoot_enemy = true
#global variables
var velocity = Vector2()
var speed = 20000
var player_position


# Called when the node enters the scene tree for the first time.
func _ready():
	
	print(player.get_children())
	player.position= Vector2(window_size.x/2,window_size.y-90)
	player_position=player.position
	pass # Replace with function body.

func grid_move(var delta):
	velocity = Vector2()
	if Input.is_action_pressed('ui_right') && player.position.x <window_size.x-60:
		velocity.x += 10
	if Input.is_action_pressed('ui_left')  && player.position.x > 30:
		 velocity.x -= 10
#	if Input.is_action_pressed('ui_down'):
#		velocity.y += 1
#	if Input.is_action_pressed('ui_up'):
#		velocity.y -= 1
	velocity = velocity.normalized()
	player_position=player.position
	player.move_and_slide(velocity*delta * speed)
	pass

func shoot_bullet():
	if can_i_shoot_enemy == true:
		can_i_shoot_enemy = false
		var new_bullet =bullet_object.duplicate()
		new_bullet.position=Vector2(player_position.x,player_position.y -45)
		add_child(new_bullet)
	pass

func spawn_enemy():
	if can_i_spawn_enemy ==true:
		can_i_spawn_enemy=false
		var new_enemy=enemy_object.duplicate()
		var mouse = get_viewport().get_mouse_position()
		#print (mouse)
		new_enemy.position=Vector2(149,0)
		add_child(new_enemy)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if player.position.x > window_size.x-20:
	#	out_of_screen_right=true
	if Input.is_action_pressed('z_key'):
		shoot_bullet()
	#if Input.is_action_pressed('q_key'):
	#	spawn_enemy()
	spawn_enemy()
	grid_move(delta)
	yield(VisualServer, 'frame_post_draw')
	pass


func _on_Timer_timeout():
	can_i_spawn_enemy=true
	pass # Replace with function body.


func _on_Timer2_timeout():
	can_i_shoot_enemy = true
	pass # Replace with function body.
