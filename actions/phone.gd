var action_types

func open_phone ():
  return { "type": action_types.OPEN }

func close_phone ():
  return { "type": action_types.CLOSE }

func _init ():
  action_types = preload("res://action_types/phone.gd").new()
