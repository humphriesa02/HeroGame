/// @desc RoomTransition(type, targetroom)
/// @arg Type
/// @arg TargetRoom
function RoomTransition(_type, _target){
	if (!instance_exists(oTransition))
	{
		with (instance_create_depth(0,0,-9999,oTransition))
		{	
			type = _type;
			target = _target;
		}
	}
	else show_debug_message("Trying to transition while transition is happening!");
}