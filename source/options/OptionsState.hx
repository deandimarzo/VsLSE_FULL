package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxGroup;
import Controls;

using StringTools;

class OptionsState extends MusicBeatState
{
	var options:Array<String> = ['Note Colors', 'Controls', 'Adjust Delay and Combo', 'Graphics', 'Visuals and UI', 'Gameplay'];
	private var grpOptions:FlxTypedGroup<FlxText>;
	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;
	

	function openSelectedSubstate(label:String) {
		switch(label) {
			case 'Note Colors':
				openSubState(new options.NotesSubState());
			case 'Controls':
				openSubState(new options.ControlsSubState());
			case 'Graphics':
				openSubState(new options.GraphicsSettingsSubState());
			case 'Visuals and UI':
				openSubState(new options.VisualsUISubState());
			case 'Gameplay':
				openSubState(new options.GameplaySettingsSubState());
			case 'Adjust Delay and Combo':
				LoadingState.loadAndSwitchState(new options.NoteOffsetState());
		}
	}

	var selectorLeft:Alphabet;
	var selectorRight:Alphabet;

	override function create() {
		#if desktop
		DiscordClient.changePresence("Options Menu", null);
		#end

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.color = 0xFFea71fd;
		bg.setGraphicSize(Std.int(bg.width * 1.1*scaleRatio));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		grpOptions = new FlxTypedGroup<FlxText>();
		add(grpOptions);

		for (i in 0...options.length)
		{

			var coolText:FlxText = new FlxText(0, 0, FlxG.width, options[i]);
				coolText.setFormat(Paths.font("Gameplay.ttf"), 64, FlxColor.fromRGB(255, 255, 255), CENTER);
				coolText.screenCenter();
				coolText.setBorderStyle(OUTLINE, FlxColor.BLACK, 3, 1);
				coolText.y += (100 * (i - (options.length / 2))) + 50;
				grpOptions.add(coolText);




			// var daOptionsTxt:FlxText = new FlxText(0, 0, FlxG.width, options[i]);
			// //var optionText:Alphabet = new Alphabet(0, 0, options[i], true, false);
			// daOptionsTxt.setFormat("Friday Night Funkin Regular", 64, FlxColor.fromRGB(255, 255, 255), CENTER);
			// daOptionsTxt.screenCenter();
			// daOptionsTxt.y += (100 * (i - (options.length / 2))) + 50;
			// grpOptions.add(daOptionsTxt);
		}

		selectorLeft = new Alphabet(0, 0, '>', true, false);
		add(selectorLeft);
		selectorRight = new Alphabet(0, 0, '<', true, false);
		add(selectorRight);

		changeSelection();
		ClientPrefs.saveSettings();

		super.create();
	}

	override function closeSubState() {
		super.closeSubState();
		ClientPrefs.saveSettings();
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (controls.UI_UP_P) {
			changeSelection(-1);
		}
		if (controls.UI_DOWN_P) {
			changeSelection(1);
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}

		if (controls.ACCEPT) {
			openSelectedSubstate(options[curSelected]);
		}
	}
	
	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members) {
			var selected:Int = 0;
			selected = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (selected == 0) {
				item.alpha = 1;
			}
				selectorLeft.x = item.x - 63;
				selectorLeft.y = item.y;
				selectorRight.x = item.x + item.width + 15;
				selectorRight.y = item.y;
			
		}
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}
}