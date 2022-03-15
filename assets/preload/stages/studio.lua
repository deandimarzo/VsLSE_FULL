function onCreate()
	-- background shit

	makeLuaSprite('studio-background', 'studio-background', -750, -880);
	setScrollFactor('studio-background', 0.8, 0.8);
    scaleObject('studio-background', 0.7, 0.7);
    
    makeLuaSprite('studio-desk', 'studio-desk', 240, -200);
	setScrollFactor('studio-desk', 0.9, 0.9);
    scaleObject('studio-desk', 0.6, 0.6);
    
    makeLuaSprite('studio-guitars', 'studio-guitars', 1320, 50);
	setScrollFactor('studio-guitars', 1.05, 1.05);
    scaleObject('studio-guitars', 0.7, 0.7);
    
    makeLuaSprite('studio-shelf', 'studio-shelf', -600, -50);
	setScrollFactor('studio-shelf', 0.9, 0.9);
    scaleObject('studio-shelf', 0.7, 0.7);
    
    makeLuaSprite('studio-foreground', 'studio-foreground', 1220, 320);
	setScrollFactor('studio-foreground', 1.1, 1.1);
    scaleObject('studio-foreground', 0.7, 0.7);
    
    
    

	addLuaSprite('studio-background', false);
    addLuaSprite('studio-desk', false);
    addLuaSprite('studio-guitars', true);
    addLuaSprite('studio-shelf', false);
    addLuaSprite('studio-foreground', true);
    

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end