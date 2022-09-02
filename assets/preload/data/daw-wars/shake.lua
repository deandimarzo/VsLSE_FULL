function onUpdate()
--dad
if mustHitSection == false then

        if getProperty('dad.animation.curAnim.name') == 'singUP' then
            	triggerEvent('Screen Shake','0.1,0.04','')
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
            	triggerEvent('Screen Shake','0.1,0.08','0.1,0.06')
        end
        if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
            	triggerEvent('Screen Shake','0.1,0.04','')
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
            	triggerEvent('Screen Shake','0.1,0.04','')
        end
        end

if mustHitSection == true then

        if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Screen Shake','0.1,0.04','')
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Screen Shake','0.1,0.08','0.1,0.06')
        end
        if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Screen Shake','0.1,0.04','')
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Screen Shake','0.1,0.04','')
        end
        end
end
