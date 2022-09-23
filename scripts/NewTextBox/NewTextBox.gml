/// @arg Message
/// @arg Background
/// @arg [Responses]

function NewTextBox(){
	var _obj;
	if (instance_exists(oText)) _obj = oTextQueued; else _obj = oText;
	with (instance_create_layer(0,0,"Instances",_obj))
	{
		message = argument[0];
		if (instance_exists(other)) originInstance = other.id else originInstance = noone;
		if (argument_count > 1) background = argument[1]; else background = 1;
		// We have responses
		if (argument_count > 2)
		{
			// Assigning a temp variable to argument 2 (our responses)
			var _array=argument[2];
			// instead of shallow copy, deep copy that temp variable into responses[i]
			for(var _i=0;_i<array_length(_array)  ;_i++) responses[_i]=_array[_i];
			// Trim markers from responses
			for (var i = 0; i < array_length(responses); i++)
			{
				// Find the position of the marker
				var _markerPosition = string_pos(":", responses[i]);
				// Grab the marker only and put it into an array
				responseScripts[i] = string_copy(responses[i], 1, _markerPosition-1);
				responseScripts[i] = real(responseScripts[i]);
				// delete the marker from the original responses array
				responses[i] = string_delete(responses[i], 1, _markerPosition);
			}
		}
		else // If we don't have responses
		{
			responses = [-1];
			responseScripts = [-1];
		}
	}
	
	with (oPlayer)
	{
		if (state != PlayerStateLocked)
		{
			lastState = state;
			state = PlayerStateLocked;
		}
		
	}
}