package;


import openfl.display.Sprite;

import openfl.events.Event;
import openfl.events.MouseEvent;



class Main extends Sprite {
	
	private var animRect:AnimRect;
	private var isAnimating:Bool;

	private var gameView:Sprite;
	
	public function new () {
		
		super ();
		
		this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);

		this.gameView = new Sprite();
		addChild(this.gameView);

		this.isAnimating = false;
	}

	private function onAddedToStage(e:Event):Void{
		drawFromSwf();
	}
	private function centerTheGameOnStage():Void{
		//position the game in center
		this.gameView.x = (this.stage.stageWidth - this.gameView.width)/2 ;
		this.gameView.y = (this.stage.stageHeight - this.gameView.height)/2 - 100;
	}

	private function drawFromSwf():Void{
		var btn = new BlueRect ();
		btn.x = 10;
		btn.y = 10;

		//btn.width = 50;
		//btn.height = 25;
		//btn.scaleX = btn.scaleY = 0.5;

		btn.addEventListener(MouseEvent.CLICK,onBtnClick);

		//var animRect = new AnimRect();
		this.animRect = new AnimRect();
		this.animRect.x = 10;
		this.animRect.y = 60;
		
		this.animRect.stop();

		// Add the UI
		this.gameView.addChild(btn);
		this.gameView.addChild(this.animRect);
		//
		this.centerTheGameOnStage();
	}

	private function onBtnClick(e:MouseEvent):Void{
		trace("onBtnClick");
		if (this.isAnimating) {
			this.animRect.stop();
			this.isAnimating = false;
		}else{
			this.animRect.play();
			this.isAnimating = true;
		}
	}
	
	
}