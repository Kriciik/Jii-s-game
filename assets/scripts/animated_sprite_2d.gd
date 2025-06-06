extends AnimatedSprite2D
@onready var animated_sprite_2d = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.player_points % Global.milestone_points == 0 and Global.player_points != 0:
		animated_sprite_2d.play("on score")
	else:
		animated_sprite_2d.stop()
