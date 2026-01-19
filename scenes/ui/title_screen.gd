extends Control

func _on_start_pressed():
	$AnimationPlayer.play_backwards("show")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_credits_pressed():
	pass # Replace with function body.
