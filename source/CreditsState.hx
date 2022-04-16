package;

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
import flixel.tweens.FlxTween;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);

		bg.scale.x = bg.scale.y = scaleRatio;
		bg.screenCenter();
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		//trace("finding mod shit");
		for (folder in Paths.getModDirectories())
		{
			var creditsFile:String = Paths.mods(folder + '/data/credits.txt');
			if (FileSystem.exists(creditsFile))
			{
				var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
				for(i in firstarray)
				{
					var arr:Array<String> = i.replace('\\n', '\n').split("::");
					if(arr.length >= 5) arr.push(folder);
					creditsStuff.push(arr);
				}
				creditsStuff.push(['']);
			}
		};
		var folder = "";
			var creditsFile:String = Paths.mods('data/credits.txt');
			if (FileSystem.exists(creditsFile))
			{
				var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
				for(i in firstarray)
				{
					var arr:Array<String> = i.replace('\\n', '\n').split("::");
					if(arr.length >= 5) arr.push(folder);
					creditsStuff.push(arr);
				}
				creditsStuff.push(['']);
			}
		#end

		var pisspoop:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
            ['Directors'],
			['Sam H',		'samh',		'Director',						'https://twitter.com/Sam_HOfficial',	'00FFFF'],
            ['LongestSoloEver',		'lse',		'Music / Lead Coder / Charts / Menu Design / LSE Voice Actor',						'https://twitter.com/longestsoloever',	'FF6666'],
            [''],
            ['Art'],
            ['Manicies',		'manicies',		'Sprite Artist / Animator',						'https://twitter.com/Manicies',	'6579de'],
            ['MarbleInsanity',		'marble',		'Character Design / Menu Art, Mania Stage Art',						'https://twitter.com/MarbleInsanity',	'd1a125'],
            ['Spacedust',		'spacedust',		'Background Artist',						'',	'a0a0a0'],
            [''],
            ['Music'],
            ['iFlicky',		'iflicky',		'Gain Stage Mania Remix',						'https://www.youtube.com/c/iFlicky',	'c549db'],
            ['Starbreak',		'starbreak',		'Menu Theme',						'https://www.youtube.com/c/StarbreakMusic',	'0d2678'],
            [''],
            ['Charting'],
            ['Cerbera',		'cerbera',		'Charts',						'https://www.youtube.com/c/Cerberaa',	'e434be'],
            ['niffirg',		'niffirg',		'Charts',						'https://www.youtube.com/c/niffirg0',	'8200ff'],
            ['FullCombro',		'combro',		'Mania Mode Charts',						'https://www.youtube.com/FullCombro',	'cac280'],
            ['Polarin', 'polarin', 'Mania Mode Charts', 'https://www.tiktok.com/@polarin_', 'cac280'],
            ['carljoneadams', 'carljoneadams', 'Mania Mode Charts', '', 'cac280'],            
            [''],
            ['Code'],
            ['Serkoid', 'serkoid', 'Coding, Events', 'https://www.youtube.com/c/Serkoid', '3957db'],
            ['BCTIX', 'bctix', 'Coding, Events', 'https://www.youtube.com/channel/UC-iwRp32yGbcc-Pdrkv8X5A', '990099'],
            ['Norbee', 'maverickx', 'Coding', 'https://twitter.com/MaverickZero9/status/1514953027303743488', 'bbbbdd'],
            [''],
            ['Voice Acting'],
            ['Cougar MacDowall',		'cougar',		'BF Voice Actor',						'https://twitter.com/CougarMacDowal1',	'51acbf'],
			['Victoria Rose',		'tori',		'GF Voice Actress',						'https://www.youtube.com/channel/UCpUixLCQIpdbM9MZNnB3S4g',	'ffbbbb'],
			[''],
            ['Playtesters'],
            ['Terceiro Lugar',		'terceiro',		'Playtester',						'https://twitter.com/terceiro_lugar',	'31334a'],
            ['Zerk',		'zerk',		'Playtester',						'https://twitter.com/matthew_berzerk',	'96403b'],
            ['Kerebuu',		'kerebuu',		'Playtester',						'',	'ffd1ff'],
            [''],
            ['Special Thanks'],
            ['bb-panzu',			'bb-panzu',			'Creator of Sunday',				'https://twitter.com/bbsub3',			'389A58'],
            ['kazzyrus',			'kazzyrus',			'Moral Support and Memes',				'https://twitter.com/kazzyrus',			'333333']
                
        ]; 
		
		for(i in pisspoop){
			creditsStuff.push(i);
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			optionText.yAdd -= 70;
			if(isSelectable) {
				optionText.x -= 70;
			}
			optionText.forceX = optionText.x;
			//optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Paths.currentModDirectory = creditsStuff[i][5];
				}

				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
				Paths.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
		}

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		bg.color = getCurrentBGColor();
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			if(colorTween != null) {
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if(controls.ACCEPT) {
			CoolUtil.browserLoad(creditsStuff[curSelected][3]);
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int =  getCurrentBGColor();
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}
		descText.text = creditsStuff[curSelected][2];
	}

	function getCurrentBGColor() {
		var bgColor:String = creditsStuff[curSelected][4];
		if(!bgColor.startsWith('0x')) {
			bgColor = '0xFF' + bgColor;
		}
		return Std.parseInt(bgColor);
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}