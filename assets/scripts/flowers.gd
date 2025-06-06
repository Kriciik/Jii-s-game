extends Node2D
@export var point_value : int = 2
var random_rotation
var is_negative = randi() % 2
@onready var audio_stream_player_2d = $"../AudioStreamPlayer2D"
var audio_playlist = preload("res://SFX/new_audio_stream_playlist.tres")


func _ready():
	
	if is_negative == 0:
		random_rotation = randf_range(0.005, 0.04)
	else:
		random_rotation = randf_range(-0.005, -0.04)
		
func _process(delta):
	if self.is_in_group("extra"):
		self.translate(Vector2(0,0.4))
	elif self.is_in_group("basic"):
		self.translate(Vector2(0,0.2))
		
	self.rotate(random_rotation)
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		if self.is_in_group("extra"):
			audio_stream_player_2d.pitch_scale = 1.5
		elif self.is_in_group("basic"):
			audio_stream_player_2d.pitch_scale = 1.0
		
		audio_stream_player_2d.stream = audio_playlist.get_list_stream(0)
		audio_stream_player_2d.play()
		Global.player_points += point_value
		self.queue_free()
	if body.is_in_group("ground") and self.is_in_group("basic"):
		Global.player_points = 0
		audio_stream_player_2d.stream = audio_playlist.get_list_stream(1)
		audio_stream_player_2d.play()
		self.queue_free()
	elif body.is_in_group("ground") and self.is_in_group("extra"):
		audio_stream_player_2d.stream = audio_playlist.get_list_stream(1)
		
		audio_stream_player_2d.play()
		self.queue_free()
