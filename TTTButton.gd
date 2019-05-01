# TTTButton        
extends TextureButton
class_name TTTButton

const xmark = preload("res://Assets/xmark.png")
const omark = preload("res://Assets/omark.png")

var value: int
export (int) var row = -1
export (int) var col = -1

signal im_pressed(button)

func _ready() -> void:
    reset()

func set_x(val = 1) -> void:
    value = val
    texture_normal = xmark

func set_o(val = 10) -> void:
    value = val
    texture_normal = omark

func reset() -> void:
    value = 0
    texture_normal = null

func _on_Button_Pressed() -> void:
    emit_signal("im_pressed", self)