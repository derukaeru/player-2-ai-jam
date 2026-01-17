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
	
	global_position = pos
