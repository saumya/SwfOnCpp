package;


import openfl.display.Sprite;


class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		
		drawFromSwf();
		
	}

	private function drawFromSwf():Void{
		var clip = new BlueRect ();
		addChild(clip);

		clip.x = 10;
		clip.y = 10;

		//clip.width = 50;
		//clip.height = 25;
		clip.scaleX = clip.scaleY = 0.5;
	}
	
	
}