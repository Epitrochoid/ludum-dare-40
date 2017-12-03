extends Button

onready var phone_actions = preload("res://actions/phone.gd").new()

func _pressed ():
  var store = get_node('/root/main').get_store()
  var phone_state = store.get_state().phone_state
  if phone_state.open:
    store.dispatch(phone_actions.close_phone())
  else:
    store.dispatch(phone_actions.open_phone())

func _ready ():
  print("button is ready")
