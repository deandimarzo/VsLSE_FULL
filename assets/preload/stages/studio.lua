function onCreate()
	-- background shit

	makeLuaSprite('studio-background', 'studio-background', -620, -880);
	setScrollFactor('studio-background', 0.95, 0.95);
    scaleObject('studio-background', 0.8, 0.8);
    
    makeLuaSprite('studio-desk', 'studio-desk', 320, -230);
	setScrollFactor('studio-desk', 1, 1);
    scaleObject('studio-desk', 0.7, 0.7);
    
    makeLuaSprite('studio-foreground', 'studio-foreground', -660, 140);
	setScrollFactor('studio-foreground', 1.05, 1.05);
    scaleObject('studio-foreground', 0.85, 0.85);

	addLuaSprite('studio-background', false);
    addLuaSprite('studio-desk', false);
    addLuaSprite('studio-foreground', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end