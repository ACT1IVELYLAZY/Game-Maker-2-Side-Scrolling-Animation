if (room == rm_endscreen) {
	if (cooldown > 0) {
		cooldown -= 1;
	} else if (cooldown == 0) {
		game_end();	
	}
	show_debug_message("Cooldown = " + string(cooldown));
}

if (global.winner != 0) {
	room_goto(rm_endscreen);
}

if (room == rm_lobby) {
	obj_screen.image_index = 0;
}