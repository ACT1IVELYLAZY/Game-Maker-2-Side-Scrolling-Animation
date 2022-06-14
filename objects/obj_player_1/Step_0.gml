var bbox_side, bbox_plane;
var bottom_offset = bbox_bottom - y;
var top_offset = bbox_top - y;

key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_up = keyboard_check_pressed(ord("W"));

hsp = (key_right - key_left) * x_speed;
if (key_up != 0 && jump_count < 2) {
	vsp = -key_up * jump_impulse + grv;
	jump_count++;
	audio_play_sound(snd_jump, 1, 0);
} else {
	vsp += grv;
}
// vsp = ((key_down - key_up) * jump_impulse) + grv;

//Horizontal Collision
if (hsp > 0) {
	bbox_side = bbox_right;
} else {
	bbox_side = bbox_left;
}

if ((tilemap_get_at_pixel(collision_map, bbox_side + hsp, bbox_top) != 0) 
|| (tilemap_get_at_pixel(collision_map, bbox_side + hsp, bbox_bottom) != 0)) {
	hsp = 0;
}

//Vertical Collision
if (vsp > 0) {
	bbox_plane = bbox_bottom;
} else {
	bbox_plane = bbox_top;
}

if ((tilemap_get_at_pixel(collision_map, bbox_left, bbox_plane + vsp) != 0) 
|| (tilemap_get_at_pixel(collision_map, bbox_right, bbox_plane + vsp) != 0)) {
	if (vsp > 0) {
		y = y - (y % 64) + 63 - bottom_offset; //Snaps the player to a 64 x 64 grid
	} else {
		y = y - (y % 64) - top_offset;
	}
	vsp = 0;
	jump_count = 0;
}

x += hsp;
y += vsp;

if (hp <= 0) {
	global.winner = -1;
}