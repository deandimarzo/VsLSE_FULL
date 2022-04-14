function onCreate()
	-- background 
    addCharacterToList('lsebf', 'bf');

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

    makeLuaSprite('fade','', 0, 0);
    makeGraphic('fade',1280,720,'310008');
    setProperty('fade.scale.x',2);
    setProperty('fade.scale.y',2);
    setLuaSpriteScrollFactor('flash',0,0);
    setProperty('fade.alpha',0);

    makeLuaSprite('light','spotlight',-370,-580);
    setBlendMode('light','add');
    setProperty('light.alpha',0);

    makeLuaSprite('light2','spotlight',400,-580);
    setBlendMode('light2','add');
    setProperty('light2.flipX', true);
    setProperty('light2.alpha',0);
    addLuaSprite('fade',true);
    
    
    

	addLuaSprite('djent-background', false);
    addLuaSprite('djent-desk', false);
    addLuaSprite('djent-guitars', true);
    addLuaSprite('djent-shelf', true);
    addLuaSprite('djent-foreground', true);
    addLuaSprite('fade',true);
    addLuaSprite('light',true);
    addLuaSprite('light2',true);
    
end