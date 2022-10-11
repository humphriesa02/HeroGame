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

	// Player roll logic
	if (keyRoll)
	{
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;
	}
	
	// Attack key logic
	if (keyAttack)
	{
		state = PlayerStateAttack;
		stateAttack = AttackSlash;
	}
	// Activate key logic
	if (keyActivate)
	{
		// 1. Check for an entity to activate
		var _activateX = lengthdir_x(15, direction);
		var _activateY = lengthdir_y(15, direction);
		activate = instance_position(x + _activateX, y + _activateY, pEntity);
		
		// 2. If there is something and it has a script - activate
		if (activate != noone && activate.entityActivateScript != -1)
		{
			ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);	
			
		// 3. If the thing we activate is an NPC, make it face towards us
			if (activate.entityNPC)
			{
				with (activate)
				{
					direction = point_direction(x,y,other.x,other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}
		
		
	}
}