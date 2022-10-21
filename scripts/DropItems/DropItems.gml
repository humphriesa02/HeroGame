/// @desc DropItems(x, y, [items])
/// @arg x
/// @arg y
/// @arg [items] array of items to drop
function DropItems(_x, _y, _items){
	
	var _itemLength = array_length(_items);
	
	if (_itemLength > 1)
	{
		var _anglePerItem = 360/_itemLength;
		var _angle = random(360);
		for (var i = 0; i  < _itemLength; i++)
		{
			with (instance_create_layer(_x, _y, "Instances", _items[i]))
			{
				direction = _angle;
				spd = 0.5 + (_itemLength * 0.1) + random(0.1);
				
			}
			_angle += _anglePerItem;
		}
		
	} else instance_create_layer(_x,_y,"Instances",_items[0]);
}