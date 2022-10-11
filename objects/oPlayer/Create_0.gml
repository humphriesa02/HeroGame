state = PlayerStateFree; // Set the starting state to 'Free'
stateAttack = AttackSlash;
hitByAttack = -1;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Coll"))

image_speed = 0; // Stops animation from auto starting
hSpeed = 0; // Horizontal speed
vSpeed = 0; // Vertical speed
speedWalk = 2.0;
speedRoll = 3.0; // Speed of the roll
distanceRoll = 52; // How far the roll goes
distanceBonk = 40; // Distance you travel when bonking
distanceBonkHeight = 12; // Height you reach on an imaginary z-axis for the bonk
speedBonk = 1.5; // Speed of bonk
z = 0;

spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;

localFrame = 0;