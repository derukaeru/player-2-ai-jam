extends CharacterBody3D

@export var speed: float = 220
var can_move = true

func _physics_process(delta):
	var direction = Vector3.ZERO
	if can_move:
		if Global.ia("forward"):
			direction.z = .5
		if Global.ia("backward"):
			direction.z = -.5
		if Global.ia("left"):
			direction.x = 1
		if Global.ia("right"):
			direction.x = -1
		
	#if Global.ia("forward") or Global.ia("backward") or Global.ia("left") or Global.ia("right"):
		#$model/AnimationPlayer.play("walk")
	#else:
		#$model/AnimationPlayer.play("RESET")
	
	if direction != Vector3.ZERO:
		direction = direction.normalized() * speed * delta
	
	velocity.x = direction.x
	velocity.z = direction.z

	move_and_slide()
