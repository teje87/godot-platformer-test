extends KinematicBody2D

var velocity = Vector2()

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_right"):
		velocity.x = 30
	
	move_and_slide(velocity)