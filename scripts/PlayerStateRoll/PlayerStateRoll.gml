function PlayerStateRoll(){
	
	// Movement
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);

	// How much remaining distance before roll is complete
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);
	
	var _collided = PlayerCollision();
	
	// Update Sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	// Used to ensure the roll animation fits the distance we want it to go within the
	// animation time
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining / distanceRoll)) * _totalFrames), _totalFrames - 1);
	
	// Change State
	if (moveDistanceRemaining <= 0)
	{
		state = PlayerStateFree;		
	}
}