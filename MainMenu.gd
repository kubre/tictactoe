extends Node2D
class_name MainMenu


func _on_PVPButton_pressed() -> void:
    get_tree().change_scene("res://PVP.tscn")


func _on_Exit_pressed() -> void:
    get_tree().quit()
