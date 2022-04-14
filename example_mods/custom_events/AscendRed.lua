function onEvent(name,value1,value2)
    if name == 'AscendRed' then
    if value1 > '0.01' then
        flash()
        doTweenAlpha('fadetween', 'fade', 0.7, 0.1, 'linear');
        setProperty('light.alpha',0.4);
        setProperty('light2.alpha',0.4);
        triggerEvent('Change Character','dad','shadow_dean_ascend')
        triggerEvent('Change Character','bf','bf_ascend')
        doTweenColor('a', 'light', 'FF758C', 0.1, 'linear');
        doTweenColor('b', 'light2', 'FF758C', 0.1, 'linear');

    else
        flash()
        doTweenAlpha('fadetween', 'fade', 0, 0.1, 'linear');
        doTweenAlpha('lighttween', 'light', 0, 0.1, 'linear');
        doTweenAlpha('light2tween', 'light2', 0, 0.1, 'linear');
        triggerEvent('Change Character','dad','shadow_dean')
        triggerEvent('Change Character','bf','bf')
        setProperty('light.alpha',0);
        setProperty('light2.alpha',0);
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
    addCharacterToList('shadow_dean_ascend', 'dad');
    addCharacterToList('bf_ascend', 'bf');
end