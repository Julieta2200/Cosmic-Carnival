extends Controller

var target
const reach_distance: float = 100
const delta: float = 5

func _process(_delta):
	hit = false
	if target != null:
		move_to_target()


func _on_reaction_timer_timeout():
	$reaction_timer.wait_time = randf_range(0.5, 1)
	react()

func react():
	if target != null:
		if target.monster == null || target.monster.delete:
			target = null
		return
	var circles: Array = %Circles.get_children()
	var monster_circles: Array = []
	for circle in circles:
		if circle.monster == null || circle.monster.delete:
			continue
		monster_circles.append(circle)
	
	if monster_circles.size() > 0:
		target = find_closest(monster_circles)


func find_closest(monster_circles):
	var closest = monster_circles[randi_range(0, monster_circles.size() - 1)]
	return closest

func move_to_target():
	if abs(hammer.global_position.x - target.global_position.x) > delta:
		left = hammer.global_position.x > target.global_position.x
		right = hammer.global_position.x < target.global_position.x
	else:
		left = false
		right = false
	
	if abs(hammer.global_position.y - target.global_position.y) > delta:
		up = hammer.global_position.y > target.global_position.y
		down = hammer.global_position.y < target.global_position.y
	else:
		up = false
		down = false
	
	if hammer.global_position.distance_squared_to(target.global_position) < reach_distance:
		hit = true
		target = null
	
