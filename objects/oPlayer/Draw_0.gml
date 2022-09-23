/// @description Draw the player with specific constraints
draw_sprite(sShadow, 0, floor(x), floor(y));


// Draw our sprite using the variables we already set,
// with the z modification
draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y-z),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
);