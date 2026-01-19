extends Node3D

@export var target: Node3D
@export var follow_x := true
@export var follow_y := false
@export var follow_z := false

var limit_left = 4.9
var limit_right = -3.9

func _ready():
	alley_config()

func _process(delta):
	if not target:
		return
	
	var pos = global_position
	var target_pos = target.global_position
	
	if follow_x:
		pos.x = lerp(pos.x, target_pos.x, 4.4 * delta)
	if follow_y:
		pos.y = lerp(pos.x, target_pos.y, 4.4 * delta)
	if follow_z:
		pos.z = lerp(pos.x, target_pos.y, 4.4 * delta)
	
	pos.x = clamp(pos.x, limit_right, limit_left)
	global_position = pos

func room_config():
	position = Vector3(0, 1.431, -3.959)
	$Camera3D.rotation_degrees = Vector3(-1, -180, 0)
	limit_left = 2.5
	limit_right = -2.5
	#$Camera3D.set_orthogonal(3.78, 0.05, 4000.0)
	$Camera3D.set_perspective(53.5, 0.05, 4000.0)

func hallway_config():
	position = Vector3(0, 1.431, -3.959)
	$Camera3D.rotation_degrees = Vector3(-1, -180, 0)
	limit_left = 5.5
	limit_right = -5.5
	#$Camera3D.set_orthogonal(3.78, 0.05, 4000.0)
	$Camera3D.set_perspective(53.5, 0.05, 4000.0)

func alley_config():
	position = Vector3(0, 3.4, -6.892)
	$Camera3D.rotation_degrees = Vector3(-12.0, -180, 0)
	limit_left = 8
	limit_right = -9
	$Camera3D.set_perspective(53.5, 0.05, 4000.0)
	#$Camera3D.set_orthogonal(6.918, 0.05, 4000.0)
