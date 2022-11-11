extends KinematicBody2D

#Variables
var speed = 280
var velocity = Vector2()
var accel = 500
const GRAVITY = 10
const JUMPSPEED = 320
const FLOOR = Vector2(0, -1)
onready var anim_player = $AnimationPlayer
onready var jump = $jump

#Player Movement
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_right"):
		if is_on_floor():
			anim_player.play("walk_r")
		velocity.x += speed
	if Input.is_action_just_released("ui_right"):
		velocity.x = 0
		anim_player.play("idle_r")
	if Input.is_action_just_pressed("ui_left"):
		if is_on_floor():
			anim_player.play("walk_l")
		velocity.x -= speed
	if Input.is_action_just_released("ui_left"):
		anim_player.stop()
		velocity.x = 0
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			anim_player.play("idle_r")
			jump.play()
			velocity.y = -JUMPSPEED
	velocity.y += GRAVITY
	move_and_slide(velocity, FLOOR)




func _on_Area2D_area_entered(area):
	pass # Replace with function body.
