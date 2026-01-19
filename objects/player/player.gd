extends CharacterBody3D

@export var speed: float = 110
var can_move = true

var curr_npc:CharacterBody3D
var flip:bool = false

var notebook_open : bool = false

func _physics_process(delta):
	var direction = Vector3.ZERO
	if can_move:
		if Global.ia("forward"):
			direction.z = 1
		if Global.ia("backward"):
			direction.z = -1
		if Global.ia("left"):
			direction.x = 1
			flip = true
		if Global.ia("right"):
			direction.x = -1
			flip = false
		
		if Global.ia("forward") or Global.ia("backward") or Global.ia("left") or Global.ia("right"):
			$AnimatedSprite3D.play("walk")
		else:
			$AnimatedSprite3D.play("idle")
	
	$AnimatedSprite3D.flip_h = flip
	
	if direction != Vector3.ZERO:
		direction = direction.normalized() * speed * delta
	
	velocity.x = direction.x
	velocity.z = direction.z

	move_and_slide()

func text_sent(text):
	curr_npc.get_node("Player2AINPC").chat(text)


func _on_toggle_notebook_pressed():
	var nb_ui = Global.gn("camera_rig").get_node("Camera3D/gui/notebook_ui")
	if notebook_open:
		nb_ui.get_node("AnimationPlayer").play_backwards("move")
		await nb_ui.get_node("AnimationPlayer").animation_finished
		notebook_open = false
	else:
		nb_ui.get_node("AnimationPlayer").play("move")
		await nb_ui.get_node("AnimationPlayer").animation_finished
		notebook_open = true
		
