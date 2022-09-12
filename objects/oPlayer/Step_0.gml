// Get Player Input
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right); 
keyUp = keyboard_check(vk_up);
keyDown = keyboard_check(vk_down);
keyActivate = keyboard_check_pressed(vk_space);
keyAttack = keyboard_check_pressed(ord("X"));
keyItem = keyboard_check_pressed(vk_control);

// To prevent faster movement in diagonal directions,
// Get direction we are trying to move, using numerical values
// of keyboard_check (boolean, 1 is true 0 is false).
// In GameMaker, 0 degree angle is facing to the RIGHT,
// angles then move counter-clockwise
inputDirection = point_direction(0,0, keyRight-keyLeft, keyDown-keyUp);
// Will equal true if we want to move in this direction
// False if we don't have a direction to move in
inputMagnitude = (keyRight-keyLeft != 0) or (keyDown-keyUp != 0);

// Movement
// This function is used to get the x and y component of a position
// "len" pixels from the starting point in direction "dir"
hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

x += hSpeed;
y += vSpeed;

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





