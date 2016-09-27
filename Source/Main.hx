package;


import openfl.display.Sprite;

import openfl.events.Event;
import openfl.events.MouseEvent;

import com.saumya.game.GameEntryView;



class Main extends Sprite {

	private var gameView:GameEntryView;
	
	public function new () {
		super ();
		this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
	}
	private function onAddedToStage(e:Event):Void{
		trace('onAddedToStage',this.stage.stageWidth,this.stage.stageHeight);

		this.stage.addEventListener(Event.RESIZE,onStageResize);

		// Conditional compilation
		// ref: haxe 	: https://haxe.org/manual/lf-condition-compilation.html
		// ref: Openfl 	: http://www.openfl.org/learn/docs/command-line-tools/basic-commands/
		#if ios
			this.gameView = new GameEntryView(this,1242,2208); // 1242,2208
		#else
			this.gameView = new GameEntryView(this,400,500);
		#end

		this.addChild(this.gameView);

		//this.gameView.addEventListener(GameEntryView.UI_READY,onGameUiReady);
	}
	/*
	// Does not work ?!
	private function onGameUiReady(e:Event):Void{
		trace('onGameUiReady');
		this.centerTheGameOnStage();
	}
	*/
	// Called from the Game object as a callback
	public function onGameUiReady():Void{
		trace('onGameUiReady');

		this.centerTheGameOnStage();
	}
	private function centerTheGameOnStage():Void{
		trace('centerTheGameOnStage:',this.gameView.width,this.gameView.height);

		this.gameView.x = (this.stage.stageWidth - this.gameView.width)/2 ;
		this.gameView.y = (this.stage.stageHeight - this.gameView.height)/2;
	}

	private function onStageResize(e:Event):Void{
		trace('onStageResize',this.stage.stageWidth,this.stage.stageHeight);

		this.centerTheGameOnStage();
		this.gameView.onStageResize();
	}
	
}