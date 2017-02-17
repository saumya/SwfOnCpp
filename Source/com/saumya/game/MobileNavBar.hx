
package com.saumya.game;

import openfl.display.Graphics;
import openfl.display.Sprite;

class MobileNavBar extends Sprite {

	private var pWidth:Float;
	private var pHeight:Float;

	private var bHeight:Float;
	private var bColor:UInt;

	public function new(screenWidth:Float,screenHeight:Float) {
		super();
		this.pWidth = screenWidth;
		this.pHeight = screenHeight;
	}
	// Mandatory call form outside 
	public function init(barHeight:Float,barColor:UInt):Void{
		this.bHeight = barHeight;
		this.bColor = barColor;
		this.render();
	}
	private function render():Void{
		var background:Graphics = this.graphics;
		background.clear();
		background.beginFill(this.bColor,1.0);
		background.drawRect(0,0,this.pWidth,this.bHeight);
		background.endFill();
	}
}