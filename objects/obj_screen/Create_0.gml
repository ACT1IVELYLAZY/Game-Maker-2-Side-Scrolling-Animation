if (room == rm_endscreen && global.winner != 0) {
	if (global.winner == 1) {
		obj_screen.image_index = 1;
	} else {
		obj_screen.image_index = 2;
	} 
}
