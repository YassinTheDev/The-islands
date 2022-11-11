extends Area2D

func _on_death_area_entered(area):
	get_tree().change_scene("res://Level1.tscn")
