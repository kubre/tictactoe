extends Node

onready var board = [ 
                [ $TTTButton1, $TTTButton2, $TTTButton3],
                [ $TTTButton4, $TTTButton5, $TTTButton6],
                [ $TTTButton7, $TTTButton8, $TTTButton9]
            ]

const X = 1
const O = 10

var active_player : = X
var current_round : = 0
var winner : = false

func _ready() -> void:
    # Attaches onButtonPressed to all buttons on board
    for row in board:
        for btn in row:
            btn.connect("im_pressed", self, "onButtonPressed")
  
func onButtonPressed(btn: TTTButton) -> void:
    # Handles entire round from marking place to checking win condition
    place_mark(btn, active_player)

    # Increase Round    
    current_round += 1
    
    # If all places are marked then declare draw and reset the game 
    if current_round == 9:
        msgbox("Draw", "Draw game! both played well, Click ok to reset game", "reset")
    
func place_mark(btn: TTTButton, player: int) -> void:
    # Actullay places marks board
    if player == X:
        btn.set_x(X)
        active_player = O
    else:
        btn.set_o(O)
        active_player = X
        
    print(btn.row, btn.col, btn.value)
 
func reset() -> void:
    # Resets the Game
    active_player = X
    current_round = 0
    for row in board:
        for btn in row:
            btn.reset()
 

func msgbox(title: String, message: String, ok_method: String) -> void:
    # This is method just helps to display Message Box
    $Dialog.window_title = title
    $Dialog.dialog_text = message
    $Dialog.connect("confirmed", self, ok_method)
    $Dialog.popup_centered_minsize()
