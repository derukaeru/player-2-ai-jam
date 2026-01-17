extends Node3D

@export var target: Node3D
@export var follow_x := true
@export var follow_y := false
@export var follow_z := false

func _process(delta):
	if not target:
		return
	
	var pos = global_position
	var target_pos = target.global_position
	
	if follow_x:
		pos.x = lerp(pos.x, target_pos.x, 5.0 * delta)
	if follow_y:
		pos.y = lerp(pos.x, target_pos.y, 5.0 * delta)
	if follow_z:
		pos.z = lerp(pos.x, target_pos.y, 5.0 * delta)
	
	pos.x = clamp(pos.x, -3.9, 4.9)
	global_position = pos

func room_config():
	position = Vector3(0, 1.78, -3.9)
	$Camera3D.rotation = Vector3(-13.3, -180, 0)

func alley_config():
	position = Vector3(0, 3.2, -7.35)
	$Camera3D.rotation = Vector3(3.4, -180, 0)
