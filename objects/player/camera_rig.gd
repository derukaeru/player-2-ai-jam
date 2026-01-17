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
		pos.x = lerp(pos.x, target_pos.x, 5.0 * delta)
	if follow_y:
		pos.y = lerp(pos.x, target_pos.y, 5.0 * delta)
	if follow_z:
		pos.z = lerp(pos.x, target_pos.y, 5.0 * delta)
	
	pos.x = clamp(pos.x, limit_right, limit_left)
	global_position = pos

func room_config():
	position = Vector3(0, 2, -3.9)
	$Camera3D.rotation_degrees = Vector3(-3.8, -180, 0)
	limit_left = 2.6
	limit_right = -2.6

func alley_config():
	position = Vector3(0, 3.2, -7.35)
	$Camera3D.rotation_degrees = Vector3(2.5, -180, 0)
	limit_left = 5
	limit_right = -4.8
