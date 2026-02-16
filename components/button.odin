package components

import rl "vendor:raylib"

Button :: struct {
	rect:        rl.Rectangle,
	color:       rl.Color,
	hover_color: rl.Color,
	label:       cstring,
}

Button_Draw :: proc(button: ^Button) {
	color := button.color
	if rl.CheckCollisionPointRec(rl.GetMousePosition(), button.rect) {
		color = button.hover_color
	}

	rl.DrawRectangleRec(button.rect, color)
	rl.DrawText(
		button.label,
		i32(button.rect.x + 10),
		i32(button.rect.y + 15),
		20,
		rl.WHITE,
	)
}

Button_IsClicked :: proc(button: ^Button) -> bool {
	return(
		rl.CheckCollisionPointRec(rl.GetMousePosition(), button.rect) &&
		rl.IsMouseButtonPressed(.LEFT) \
	)
}
