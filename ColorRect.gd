extends ColorRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#
var press_count = 0

onready var phone_actions = preload("res://actions/phone.gd").new()

onready var button = get_node("Button")
onready var store = get_node("/root/main").get_store()

func on_button_press ():
  print("ON BUTTON PRESS", store.get_state())
  press_count = press_count + 1
  if store.get_state().phone_state.open:
    print("closing")
    store.dispatch(phone_actions.close_phone())
  else:
    print("opening")
    store.dispatch(phone_actions.open_phone())

# Connect the button to the press handler as
# soon as this view is ready
func _ready ():
  store.subscribe(self, "on_state_change")

  button.connect("pressed", self, "on_button_press")
