extends Node

var action_types
var phone_effects

func middleware (store, action):
  print("middleware func called")
  match action.type:
    action_types.OPEN:
      print("moving up")
      phone_effects.move_phone_up()
    action_types.CLOSE:
      print("moving down")
      phone_effects.move_phone_down()

func _init ():
  action_types = preload("res://action_types/phone.gd").new()
  phone_effects = preload("res://effects/phone.gd").new()
  add_child(phone_effects)
