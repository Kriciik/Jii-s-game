extends Node2D

var flower01_scene = preload("res://scenes/objects/flowers/flower_basic_1.tscn")
var flower02_scene = preload("res://scenes/objects/flowers/flower_basic_2.tscn")
var flower03_scene = preload("res://scenes/objects/flowers/flower_basic_3.tscn")
var flower04_scene = preload("res://scenes/objects/flowers/flower_basic_4.tscn")
var flower05_scene = preload("res://scenes/objects/flowers/flower_basic_5.tscn")
var flower_extra_01_scene = preload("res://scenes/objects/flowers/flower_extra_1.tscn")
var flower_extra_02_scene = preload("res://scenes/objects/flowers/flower_extra_2.tscn")

var flowers = [flower01_scene,flower02_scene,
flower03_scene,flower04_scene,
flower05_scene,flower_extra_01_scene, 
flower_extra_02_scene]

var new_flower
func _on_timer_timeout():
	var flower = flowers[randi() % flowers.size()]
	new_flower = flower.instantiate()
	new_flower.position.y = -120
	new_flower.position.x = -85 + randi() % 180
	add_child(new_flower)
	
	
	
	
