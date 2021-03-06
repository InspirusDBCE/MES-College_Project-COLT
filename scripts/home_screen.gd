extends Control

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene()

func _ready():
	Global.current_page = "home_screen"
	Global.header = get_node("header/header_text")
	Global.set_header_text("COLT")
	Global.home_screen = self
	Global.detail_name = $details/VBoxContainer/HBoxContainer/name
	Global.phone = $details/VBoxContainer/HBoxContainer2/phone_number
	Global.like_list_box = $liked_list_panel/liked_list/scroller

var offscreen = Vector2(1200, 0)
var position : Vector2

func detail_tween(dir, page):
	var tween = get_node("Tween")
	if Global.explore_slide == "whats new":
		position = $whats_new.rect_position
		tween.interpolate_property($whats_new, "rect_position",
				position, position + (offscreen * dir), 0.2,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
	else:
		position = $trending.rect_position
		tween.interpolate_property($trending, "rect_position",
				position, position + (offscreen * dir), 0.2,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
	
	match(page):
		1:
			info_slide(dir)
		2:
			like_list_tween(dir)

#func hide_detail_tween():
#	var tween = get_node("Tween")
#	if Global.explore_slide == "whats new":
#		position = $whats_new.rect_position
#		tween.interpolate_property($whats_new, "rect_position",
#				position, position - offscreen, 0.4,
#				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#		tween.start()
#	else:
#		position = $trending.rect_position
#		tween.interpolate_property($trending, "rect_position",
#				position, position - offscreen, 0.4,
#				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#		tween.start()
#	info_slide(-1)

func info_slide(dir):
	var tween = get_node("Tween")
	position = $details.rect_position
	tween.interpolate_property($details, "rect_position",
			position, position + (offscreen * dir), 0.2,
			Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()

func show_trending(dir):
	var tween = get_node("Tween")
	position = $whats_new.rect_position
	tween.interpolate_property($whats_new, "rect_position",
			position, position + (offscreen * dir), 0.2,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	position = $trending.rect_position
	tween.interpolate_property($trending, "rect_position",
			position, position + (offscreen * dir), 0.2,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func like_list_tween(dir):
	var tween = get_node("Tween")
	position = $liked_list_panel.rect_position
	tween.interpolate_property($liked_list_panel, "rect_position",
			position, position + (offscreen * dir), 0.2,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func profile(dir):
	var tween = get_node("Tween")
	position = $profile.rect_position
	tween.interpolate_property($profile, "rect_position",
			position, position + (offscreen * dir), 0.2,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
