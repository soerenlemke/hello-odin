package main

import "components"
import rl "vendor:raylib"

window_width :: 1280
window_height :: 720

main :: proc() {
	rl.InitWindow(window_width, window_height, "Hellope")

	my_button := components.Button {
		rect        = {100, 100, 250, 50},
		color       = rl.BLACK,
		hover_color = rl.LIGHTGRAY,
		label       = "Click me!",
	}

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.GRAY)

		components.Button_Draw(&my_button)

		if components.Button_IsClicked(&my_button) {
			return
		}

		rl.EndDrawing()
	}

	rl.CloseWindow()
}
