extends Node2D
class_name MainMenu


func _on_PVPButton_pressed() -> void:
    get_tree().change_scene("res://PVP.tscn")

func _on_Exit_pressed() -> void:
    get_tree().quit()


func _on_KubreWebsiteLink_pressed() -> void:
    OS.shell_open("https://kubre.in")


func _on_GodotWebsiteLink_pressed() -> void:
    OS.shell_open("https://godotengine.org")
