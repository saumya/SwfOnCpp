/**
 *
 *
 *
 **/

package com.saumya.game;

class MobileNavBar extends Sprite {

	private var pWidth:Float;
	private var pHeight:Float;

	public function new(screenWidth:Float,screenHeight:Float) {
		super();
		this.pWidth = screenWidth;
		this.pHeight = screenHeight;
	}
	// Mandatory call form outside 
	public function init():Void{
		this.render();
	}
	private function render():Void{
		
	}
}