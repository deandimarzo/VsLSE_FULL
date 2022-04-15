sickColor = 'ffffff'
goodColor = 'ffff73'
badColor = '256fb0'
shitColor = 'b500b8'
missColor = '9c0000'

function onCreate()
	-- background shit
textY = 50
    --Judgement Counter
	if getProperty('maniaMode') then
	makeLuaText('JudgementCounterSick', 'hi', 200 , 0, textY)
	addLuaText('JudgementCounterSick')
	makeLuaText('JudgementCounterGood', 'hi', 200 , 0, textY+30)
	addLuaText('JudgementCounterGood')
	makeLuaText('JudgementCounterBad', 'hi', 200 ,-7, textY+60)
	addLuaText('JudgementCounterBad')
	makeLuaText('JudgementCounterShit', 'hi', 200 , 0, textY+90)
	addLuaText('JudgementCounterShit')
	makeLuaText('JudgementCounterMiss', 'hi', 200 , 0, textY+120)
	addLuaText('JudgementCounterMiss')

	setTextSize('JudgementCounterSick', 24)
	setTextSize('JudgementCounterGood', 24)
	setTextSize('JudgementCounterBad', 24)
	setTextSize('JudgementCounterShit', 24)
	setTextSize('JudgementCounterMiss', 24)

	setTextColor('JudgementCounterSick', sickColor)
	setTextColor('JudgementCounterGood', goodColor)
	setTextColor('JudgementCounterBad', badColor)
	setTextColor('JudgementCounterShit', shitColor)
	setTextColor('JudgementCounterMiss', missColor)
	end

end

function onUpdatePost(elapsed)
	if getProperty('maniaMode') then
	setTextString('JudgementCounterSick', 'Sick: ' .. getProperty('sicks'))
	setTextString('JudgementCounterGood', 'Good: ' .. getProperty('goods'))
	setTextString('JudgementCounterBad', 'Bad: ' .. getProperty('bads'))
	setTextString('JudgementCounterShit', 'Shit: ' .. getProperty('shits'))
	setTextString('JudgementCounterMiss', 'Miss: ' .. getProperty('songMisses'))
	end
end