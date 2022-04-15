function opponentNoteHit(id, direction, noteType, isSustainNote)
	setPropertyFromClass('lime.app.Application', 'current.window.x', getPropertyFromClass('lime.app.Application', 'current.window.x')+20)
	setPropertyFromClass('lime.app.Application', 'current.window.y', getPropertyFromClass('lime.app.Application', 'current.window.y')+20)
	setPropertyFromClass('lime.app.Application', 'current.window.x', getPropertyFromClass('lime.app.Application', 'current.window.x')-20)
	setPropertyFromClass('lime.app.Application', 'current.window.y', getPropertyFromClass('lime.app.Application', 'current.window.y')-20)
	setPropertyFromClass('lime.app.Application', 'current.window.x', getPropertyFromClass('lime.app.Application', 'current.window.x')-20)
	setPropertyFromClass('lime.app.Application', 'current.window.y', getPropertyFromClass('lime.app.Application', 'current.window.y')-20)
	setPropertyFromClass('lime.app.Application', 'current.window.x', getPropertyFromClass('lime.app.Application', 'current.window.x')+20)
	setPropertyFromClass('lime.app.Application', 'current.window.y', getPropertyFromClass('lime.app.Application', 'current.window.y')+20)

	
	if isSustainNote then
	runTimer('clearShader', 0.1)
	else
	addChromaticAbberationEffect('hud', 0.0005);
	addChromaticAbberationEffect('game', 0.0005);
	runTimer('clearShader', 0.1)
	end
end



function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'clearShader' then
		clearEffects('hud')
		clearEffects('game')
	end
end