/// @arg id
function ActivateLiftable(_id){
	if (global.iLifted == noone)
	{
		PlayerActOutAnimation(sPlayerLift);
		
		global.iLifted = _id;
		with (global.iLifted)
		{
			lifted = true;
			persistent = true;
		}
	}
}