function onUpdate()
--dad
if mustHitSection == false then

        if getProperty('dad.animation.curAnim.name') == 'singUP' then
            	triggerEvent('Screen Shake','0.1,0.05','')
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
            	triggerEvent('Screen Shake','0.1,0.09','0.1,0.07')
        end
        if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
            	triggerEvent('Screen Shake','0.1,0.05','')
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
            	triggerEvent('Screen Shake','0.1,0.05','')
        end
        end

if mustHitSection == true then

        if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Screen Shake','0.1,0.05','')
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Screen Shake','0.1,0.09','0.1,0.07')
        end
        if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Screen Shake','0.1,0.05','')
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Screen Shake','0.1,0.05','')
        end
        end
end
