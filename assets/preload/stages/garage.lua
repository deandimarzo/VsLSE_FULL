function onCreate()
	-- background shit

	makeLuaSprite('sunday-garage', 'sunday-garage', -600, -400);
    scaleObject('sunday-garage', 1.2, 1.2);

	addLuaSprite('sunday-garage', false);


	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end