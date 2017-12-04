var action_types

func add_task ():
  return { "type": action_types.ADD_TASK }

func _init ():
  action_types = preload("res://action_types/game.gd").new()
