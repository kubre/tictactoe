# TTTButton        
extends TextureButton
class_name TTTButton

const xmark : = preload("res://Assets/xmark.png")
const omark : = preload("res://Assets/omark.png")

# Value representing player mark
var value: int

# Buttons positions
export (int) var row : = -1
export (int) var col : = -1

signal im_pressed(button)

func _ready() -> void:
    reset()

# Mark me X
func set_x(val : = 1) -> void:
    value = val
    texture_normal = xmark

# Mark me O
func set_o(val : = 10) -> void:
    value = val
    texture_normal = omark

func reset() -> void:
    value = 0
    texture_normal = null

func _on_Button_Pressed() -> void:
    emit_signal("im_pressed", self)