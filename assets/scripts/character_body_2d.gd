extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -150.0
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		animated_sprite_2d.stop()
		velocity += get_gravity()  * delta / 2
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	if Input.is_action_pressed("move_left"):
		animated_sprite_2d.play("run_left")
		velocity.x = direction * SPEED
	elif Input.is_action_pressed("move_right"):
		animated_sprite_2d.play("run_right")
		velocity.x = direction * SPEED
	else:
		if Input.is_action_just_released("move_left"):
			animated_sprite_2d.play("idle_left")
			velocity.x = move_toward(velocity.x, 0, SPEED)
		elif Input.is_action_just_released("move_right"):
			animated_sprite_2d.play("idle_right")
			velocity.x = move_toward(velocity.x, 0, SPEED)
			

	move_and_slide()
