function PlayerStateFree(){
	// Movement
	// This function is used to get the x and y component of a position
	// "len" pixels from the starting point in direction "dir"
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	// Handle collision / Move player
	PlayerCollision();

	// Update Sprite Index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0)
	{
		direction = inputDirection
		sprite_index = spriteRun;
	} else sprite_index = spriteIdle;
	if (_oldSprite != sprite_index) localFrame = 0;

	// Update Image Index
	PlayerAnimateSprite();

	// Change State
	if (keyActivate)
	{
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;
	}
}