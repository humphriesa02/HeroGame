state = PlayerStateFree; // Set the starting state to 'Free'

collisionMap = layer_tilemap_get_id(layer_get_id("Coll"))

image_speed = 0; // Stops animation from auto starting
hSpeed = 0; // Horizontal speed
vSpeed = 0; // Vertical speed
speedWalk = 2.0;
speedRoll = 3.0; // Speed of the roll
distanceRoll = 52; // How far the roll goes

spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;

localFrame = 0;
