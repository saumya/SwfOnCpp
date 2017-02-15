/**
 *
 *	Experiementing with the Flash API
 * 
 *	flash.net.SharedObject : http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/net/SharedObject.html
 *
 **/


package com.saumya.game;

import openfl.display.Sprite;
import openfl.display.Graphics;

import motion.Actuate;

import com.saumya.raymp.components.ButtonWithBgColor;




class GameShell extends Sprite {
	
	private var bg:Sprite;
	private var gWidth:Float;
	private var gHeight:Float;

	public function new(gameWidth:Float,gameHeight:Float) {
		super();
		//
		this.gWidth = gameWidth;
		this.gHeight = gameHeight;
		//
		this.preInit();
	}
	private function preInit():Void{
		this.bg = new Sprite();
		this.addChild(bg);
		//
		var g:Graphics = this.bg.graphics;
		g.beginFill(0xAAAAAA,1.0);
		g.drawRect(0,0,this.gWidth,this.gHeight);
		g.endFill();
	}
	public function init():Void{
		var b1:ButtonWithBgColor = new ButtonWithBgColor("Version number of the Game",20,0x777777);
		this.addChild(b1);
		b1.x = b1.y = 10;
	}
}