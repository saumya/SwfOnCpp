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
		trace('onAddedToStage');
		this.gameView = new GameEntryView();	
		this.addChild(this.gameView);

		this.gameView.addEventListener(GameEntryView.UI_READY,onGameUiReady);
	}
	private function onGameUiReady(e:Event):Void{
		trace('onGameUiReady');

		this.centerTheGameOnStage();
	}
	private function centerTheGameOnStage():Void{
		trace(this.gameView.width,this.gameView.height);

		this.gameView.x = (this.stage.stageWidth - this.gameView.width)/2 ;
		this.gameView.y = (this.stage.stageHeight - this.gameView.height)/2 - 100;
	}
	
}