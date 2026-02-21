package application

import component "ui"
import rl "vendor:raylib"

Application :: struct {
	window:     Application_Window,
	fps:        i32,
	components: [dynamic]component.Component,
}

Application_Window :: struct {
	width:    i32,
	height:   i32,
	title:    cstring,
	bg_color: rl.Color,
}

setup :: proc(app: ^Application) {
	rl.InitWindow(app.window.width, app.window.height, app.window.title)

	if app.fps == 0 {
		rl.SetTargetFPS(60)
	}
	rl.SetTargetFPS(app.fps)
}

// `close` frees all the underlying data of the apps components and closes the window
close :: proc(app: ^Application) {
	delete(app.components)
	rl.CloseWindow()
}
