extends ViewportContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Viewport.size.x = ProjectSettings.get_setting('display/window/size/width')
	$Viewport.size.y = ProjectSettings.get_setting('display/window/size/height')
	$Crosshair.rect_position.x = ProjectSettings.get_setting('display/window/size/width')/2
	$Crosshair.rect_position.y = ProjectSettings.get_setting('display/window/size/width')/2

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
