extends CanvasLayer

func update_life():
	get_node("life").set_value(global.life)
	return global.life
func update_score():
	get_node("score").set_text(str(global.score))
	return global.score