extends ColorRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var button = get_node("Button")
onready var tween = get_node("Tween")
onready var phone = get_node("Phone")

var in_view_pos = Vector2(145, 410)
var out_of_view_pos = Vector2(144, 800)

enum PHONE_POSITION {
  IN_VIEW,
  OUT_OF_VIEW
}

var tween_speed = 0.25
var position_prop = "position"

var is_tweening = false
var current_position = PHONE_POSITION.IN_VIEW

# Simple helper function for moving the phone vertically
func move_phone (start_pos, end_pos):
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

# handles button presses
func on_button_press ():
  print(is_tweening)
  if (!is_tweening):
    if (current_position == PHONE_POSITION.IN_VIEW):
      move_phone(in_view_pos, out_of_view_pos)
      current_position = PHONE_POSITION.OUT_OF_VIEW
    else:
      move_phone(out_of_view_pos, in_view_pos)
      current_position = PHONE_POSITION.IN_VIEW

func on_tween_start ():
  print("tween start")
  is_tweening = true

func on_tween_complete ():
  print("tween complete")
  is_tweening = false

# Connect the button to the press handler as
# soon as this view is ready
func _ready ():
  button.connect("pressed", self, "on_button_press")
  tween.connect("tween_start", self, "on_tween_start")
  tween.connect("tween_complete", self, "on_tween_complete")
