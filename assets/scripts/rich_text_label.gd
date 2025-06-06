extends Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = "score: " + str(Global.player_points)
	if Global.player_points % Global.milestone_points == 0 and Global.player_points != 0:
		self.add_theme_color_override("font_color", Color.DARK_RED)
	else:
		self.add_theme_color_override("font_color", Color.WHITE)
