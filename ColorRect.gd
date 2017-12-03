extends ColorRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var phone_actions = preload("res://actions/phone.gd").new()

onready var button = get_node("Button")
onready var tween = get_node("Tween")
onready var phone = get_node("Phone")

onready var store = get_node("/root/main").get_store()

var in_view_pos = Vector2(145, 410)
var out_of_view_pos = Vector2(144, 800)

var tween_speed = 0.25
var position_prop = "position"

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


# react to state changes
func on_state_change (state):
  var phone_open = state.phone_state.open
  print("state change", state)
  if phone_open:
    move_phone(out_of_view_pos, in_view_pos)
  else:
    move_phone(in_view_pos, out_of_view_pos)

# Connect the button to the press handler as
# soon as this view is ready
func _ready ():
  store.subscribe(self, "on_state_change")

  var addTaskTimer = Timer.new()
  addTaskTimer.set_wait_time(45)
  addTaskTimer.connect("timeout", self, "_on_add_task_timeout")
  add_child(addTaskTimer)
  addTaskTimer.start()
