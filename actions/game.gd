var action_types

func add_task (task):
  return { "type": action_types.ADD_TASK, "task": task }

func set_current_task (task):
  return { "type": action_types.SET_CURRENT_TASK, "task": task }

func submit_step (step):
  return { "type": action_types.SUBMIT_STEP, "step": step }

func _init ():
  action_types = preload("res://action_types/game.gd").new()
