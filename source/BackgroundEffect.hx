package;

class BackgroundEffect extends FlxSprite
{
    public function new(effectType:String) {
        super();
        
        if (effectType == "lightning") {
        frames = Paths.getSparrowAtlas('lightning');
        animation.addByPrefix('STRIKE', 'STRIKE', 24, true);
        animation.play('star', true);
        }
        
    }
    
    override function update(elapsed:Float)
	{
		super.update(elapsed);
    }
}