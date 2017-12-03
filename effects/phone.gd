extends Node

var in_view_pos = Vector2(145, 410)
var out_of_view_pos = Vector2(144, 800)
var tween_speed = 0.25
var position_prop = "position"

func move_phone (start_pos, end_pos):
  var tween = get_node("/root/Main/ColorRect/Tween")
  var phone = get_node("/root/Main/ColorRect/Phone")

  tween.interpolate_property(
    phone,
    position_prop,
    start_pos,
    end_pos,
    tween_speed,
    Tween.TRANS_LINEAR,
    Tween.EASE_IN_OUT
  )
  tween.start()

func move_phone_up ():
  move_phone(out_of_view_pos, in_view_pos)

func move_phone_down ():
  move_phone(in_view_pos, out_of_view_pos)

func _ready ():
  print("effects are ready")
