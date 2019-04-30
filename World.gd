extends Node

var board = [ 
                [ $TextureButton, $TextureButton2, $TextureButton3],
                [ $TextureButton4, $TextureButton5, $TextureButton6],
                [ $TextureButton7, $TextureButton8, $TextureButton9]
            ]

const X = 1
const O = 10

var active_player : = X
var current_round : = 0
var winner : = false

func _ready() -> void:
    for row in board:
        for btn in row:
            btn.connect("im_pressed", self, "onButtonPressed")