package;


import openfl.display.Sprite;
import openfl.events.MouseEvent;



class Main extends Sprite {
	
	private var animRect:AnimRect;
	private var isAnimating:Bool;
	
	public function new () {
		
		super ();
		
		this.isAnimating = false;
		drawFromSwf();
		
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
		addChild(btn);
		addChild(this.animRect);
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