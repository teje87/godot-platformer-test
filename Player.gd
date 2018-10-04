extends KinematicBody2D

onready  var sprite = get_node("Sprite")

var velocity = Vector2()
var anim = "move" 



#Speed
var move_speed = 30
var dash_speed = 40

var speed = move_speed


    
		

func _input(event):
	
	if(event.is_action_pressed("ui_right")):
		velocity.x = speed
		if get_node("Timer").is_stopped() == false : 
			speed = dash_speed
			
			print("doble tap")
		else: get_node("Timer").start()


func _physics_process(delta):
	
	
	 
	
       
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		if get_node("Timer").is_processing():
            double_tap_left()
		else: get_node("Timer").start()
        
		
		
	if Input.is_action_just_released("ui_right"):
		velocity.x = 0
		speed = move_speed
	if Input.is_action_just_released("ui_left"):
		velocity.x = 0
		speed = move_speed
	
	
	move_and_slide(velocity)
	
	if velocity.x == 0:
		anim = "idle"
	elif velocity.x == 30:
		anim = "move"
	elif velocity.x == -30:
		anim = "move"
	elif velocity.x == 40:
		anim = "dash"
	elif velocity.x == -40:
		anim = "dash"
		
	if velocity.x > 0:
		sprite.set_flip_h(false)
	elif velocity.x < 0:
		sprite.set_flip_h(true)
		
	
	
	
	sprite.play(anim)
	

	
	
	
		