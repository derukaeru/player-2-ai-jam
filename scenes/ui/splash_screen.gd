extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("show")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://scenes/ui/title_screen.tscn")
	
	
