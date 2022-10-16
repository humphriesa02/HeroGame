function PlayerCollision(){
	var _collision = false;
	var _entityList = ds_list_create();
	
	// Horizontal Tiles
	
	// Check the tileMap 'collisionMap' to see if we are touching it
	// in the x axis
	if (tilemap_get_at_pixel(collisionMap, x + (hSpeed * (TILE_SIZE /4)), y))
	{
		// Swapped from readjusting after going inside the wall
		// To just stopping at the wall's first pixel. May affect gameplay
		// Optional to change
		hSpeed = 0;
		_collision = true;
	}
	
	// Horizontal Entities
	var _entityCount = instance_position_list(x +(hSpeed * (TILE_SIZE /4)), y, pEntity, _entityList, false);
	var _snapX;
	while (_entityCount > 0)
	{
		var _entityCheck = _entityList[| 0];
		// If the entity from the entity list is collidable
		if (_entityCheck.entityCollision == true)
		{
			// Move as close as we can to, i.e. this one readjusts
			if (sign(hSpeed) == -1) _snapX = _entityCheck.bbox_right+ (TILE_SIZE/2);
			else _snapX = _entityCheck.bbox_left-(TILE_SIZE/2);
			x = _snapX;
			hSpeed = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList,0);
		_entityCount--;
	}
	
	
	// Horizontal Move Commit
	x += hSpeed;
	
	// Clear list between axis
	ds_list_clear(_entityList);
	
	// Vertical Tiles
	
	// Check the tileMap 'collisionMap' to see if we are touching it
	// in the y axis
	if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{
		// If so bounce us out to the top
		// This one readjusts
		y -= y mod TILE_SIZE;
		// Or to the bottom
		if (sign(vSpeed) == 1) y += TILE_SIZE - 1;
		vSpeed = 0;
		_collision = true;
	}
	
	// Vertical Entities
	var _entityCount = instance_position_list(x, y + vSpeed, pEntity, _entityList, false);
	var _snapY;
	while (_entityCount > 0)
	{
		var _entityCheck = _entityList[| 0];
		// If the entity from the entity list is collidable
		if (_entityCheck.entityCollision == true)
		{
			// Move as close as we can to
			// This one readjusts
			if (sign(vSpeed) == -1) _snapY = _entityCheck.bbox_bottom+1;
			else _snapY = _entityCheck.bbox_top-1;
			y = _snapY;
			vSpeed = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList,0);
		_entityCount--;
	}
	
	// Vertical Move Commit
	y += vSpeed;
	
	ds_list_destroy(_entityList);

	return _collision;
}