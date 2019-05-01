# Player vs Player Mode
extends Node
class_name PVP

# This array represents board
onready var board = [
                [ $TTTButton1, $TTTButton2, $TTTButton3],
                [ $TTTButton4, $TTTButton5, $TTTButton6],
                [ $TTTButton7, $TTTButton8, $TTTButton9]
            ]
# Player Constants
const X = 1
const O = 10

# Some game starting stuff
var active_player : = X
var current_round : = 0
var winner : = false

func _ready() -> void:
    # Attaches onButtonPressed to all buttons on board
    for row in board:
        for btn in row:
            btn.connect("im_pressed", self, "on_position_marked")

func on_position_marked(btn: TTTButton) -> void:
    # Handles entire round from marking place to checking win condition
    if not place_mark(btn, active_player):
        return

    # Increase Round
    current_round += 1

    # If all places are marked then declare draw and reset the game
    if(check_win(active_player)):
        var winner = ""
        if active_player == X:
            winner = "X"
            $XScore.text = String(int($XScore.text) + 1)
        else:
            winner = "O"
            $OScore.text = String(int($OScore.text) + 1)
        msgbox("Win", "Player %s won the match" % winner, "reset")
        return

    if current_round == 9:
        msgbox("Draw", "Draw game! both played well, Click ok to reset game", "reset")

    # Switch active player
    active_player = O if active_player == X else X

func place_mark(btn: TTTButton, player: int) -> bool:
    # Actullay places marks board
    if btn.value != 0:
        return false
    btn.set_x(X) if player == X else btn.set_o(O)
    return true

func reset() -> void:
    # Resets the Game
    active_player = X
    current_round = 0
    for row in board:
        for btn in row:
            btn.reset()

func check_win(player: int) -> bool:
    var win_no = player*3
    var sums = [sum_col(0), sum_col(1), sum_col(2),
                sum_row(0), sum_row(1), sum_row(2),
                sum_diag_1(), sum_diag_2()]

    return sums.has(win_no)

func sum_col(index: int) -> int:
    # sum the column of index
    return board[0][index].value + board[1][index].value + board[2][index].value

func sum_row(index: int) -> int:
    # sum the row of index
    return board[index][0].value + board[index][1].value + board[index][2].value

func sum_diag_1() -> int:
    # sum of the 00, 11, 22 on board
    return board[0][0].value + board[1][1].value + board[2][2].value

func sum_diag_2() -> int:
    # sum of the 02, 11, 20 on board
    return board[0][2].value + board[1][1].value + board[2][0].value

func msgbox(title: String, message: String, ok_method: String) -> void:
    # This is method just helps to display Message Box
    $Dialog.window_title = title
    $Dialog.dialog_text = message
    $Dialog.connect("confirmed", self, ok_method)
    $Dialog.popup_centered_minsize()


func _on_MenuButton_pressed() -> void:
    # Exit to Main Menu
    get_tree().change_scene("res://MainMenu.tscn")
