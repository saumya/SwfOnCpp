/**
 *
 *	version	:	1.0.0
 *	author	:	saumya
 *
 *	This is used to display the mobile UI as it is shown in default mobile applications.
 *
 **/

package com.saumya.game;

import openfl.display.Sprite;
import openfl.display.Graphics;



class MobilePanel extends Sprite {

	private var pWidth:Float;
	private var pHeight:Float;

	public function new(panelWidth:Float,panelHeight:Float) {
		super();
		this.pWidth = panelWidth;
		this.pHeight = panelHeight;
	}
	
	// This is called form the container, or whoever is making this panel
	public function init():Void{
		drawBg();
	}

	public function initWithTopbar():Void{
		drawBg(true);
	}

	private function drawBg(shouldDrawTopbar:Bool=false):Void{
		var g1:Graphics = this.graphics;
		//g1.clear(); // Call this if needed
		g1.beginFill(0xCCCCAA,1.0);
		g1.drawRect(0,0,this.pWidth,this.pHeight);
		g1.endFill();
		// Top Bar
		if(shouldDrawTopbar){
			g1.beginFill(0x000000,1.0);
			g1.drawRect(0,0,this.pWidth,60);
			g1.endFill();
		}else{
			// Do Nothing
		}
		
	}
}