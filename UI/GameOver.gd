extends Control

signal replay

onready var animation_player = $AnimationPlayer
onready var wave_number_text = $WaveNumber
var ready = false

func show_game_over(wave_number: int):
	wave_number_text.text = "%d" % wave_number
	visible = true
	ready = false
	animation_player.play("Appear")


func _on_AnimationPlayer_animation_finished(_anim_name):
	ready = true

func _input(event):
	if !ready:
		return

	if event.is_action_pressed("ui_accept"):
		emit_signal("replay")
		visible = false
