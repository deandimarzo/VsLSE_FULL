function onCreate()
	-- background shit

	makeLuaSprite('studio-background', 'studio-background', -1200, -1200);
	setScrollFactor('studio-background', 1, 1);
    
    makeLuaSprite('studio-desk', 'studio-desk', -100, -500);
	setScrollFactor('studio-desk', 1, 1);
    
    makeLuaSprite('studio-foreground', 'studio-foreground', -1200, 20);
	setScrollFactor('studio-foreground', 1, 1);

	addLuaSprite('studio-background', false);
    addLuaSprite('studio-desk', false);
    addLuaSprite('studio-foreground', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end