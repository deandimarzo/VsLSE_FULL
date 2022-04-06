function onCreate()
	-- background shit

	makeLuaSprite('djent-background', 'djent-background', -750, -880);
	setScrollFactor('djent-background', 0.8, 0.8);
    scaleObject('djent-background', 0.7, 0.7);
    
    makeLuaSprite('djent-desk', 'djent-desk', 240, -200);
	setScrollFactor('djent-desk', 0.9, 0.7);
    scaleObject('djent-desk', 0.6, 0.6);
    
    makeLuaSprite('djent-guitars', 'djent-guitars', 1320, 50);
	setScrollFactor('djent-guitars', 1.05, 1.05);
    scaleObject('djent-guitars', 0.7, 0.7);
    
    makeLuaSprite('djent-shelf', 'djent-shelf', -600, -50);
	setScrollFactor('djent-shelf', 0.9, 0.9);
    scaleObject('djent-shelf', 0.7, 0.7);
    
    makeLuaSprite('djent-foreground', 'djent-foreground', 1220, 320);
	setScrollFactor('djent-foreground', 1.1, 1.1);
    scaleObject('djent-foreground', 0.7, 0.7);
    
    
    

	addLuaSprite('djent-background', false);
    addLuaSprite('djent-desk', false);
    addLuaSprite('djent-guitars', true);
    addLuaSprite('djent-shelf', false);
    addLuaSprite('djent-foreground', true);
    

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end