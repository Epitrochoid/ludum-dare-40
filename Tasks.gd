extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
#
func _on_add_task_timeout():
  var test_label = Label.new()
  test_label.set_text("Test")
  test_label.set_pos(Vector2(100, 100))
  test_label.set_size(Vector2(100, 100))
  add_child(test_label)
  print("Timeout hit")