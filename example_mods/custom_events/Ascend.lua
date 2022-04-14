function onEvent(name,value1,value2)
    if name == 'Ascend' then
    if value1 > '0.01' then
        flash()
        setProperty('fade.alpha',0.7);
        setProperty('light.alpha',0.8);
        setProperty('light2.alpha',0.8);
        triggerEvent('Change Character','dad','lse_sing_ascend')
        triggerEvent('Change Character','bf','bf_ascend')
    else
        flash()
        setProperty('fade.alpha',0);
        setProperty('light.alpha',0);
        setProperty('light2.alpha',0);
        triggerEvent('Change Character','dad','lse_sing')
        triggerEvent('Change Character','bf','bf')
    end
end
end


function flash()
       makeLuaSprite('flash','', 0, 0);
        makeGraphic('flash',1280,720,'f0ffec')
          addLuaSprite('flash', true);
          setProperty('flash.scale.x',2)
          setProperty('flash.scale.y',2)
          setLuaSpriteScrollFactor('flash',0,0)
        setProperty('flash.alpha',1)
        doTweenAlpha('flTw','flash',0,0.5,'linear')
    end

function onCreate()
    addCharacterToList('lse_sing_ascend', 'dad');
    addCharacterToList('bf_ascend', 'bf');
end