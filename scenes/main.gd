extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("intro")
	await $AnimationPlayer.animation_finished
	$CameraRig.alley_config()
