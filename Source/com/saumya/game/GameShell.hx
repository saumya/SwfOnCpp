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

import openfl.events.Event;
import openfl.events.MouseEvent;

import openfl.net.SharedObject;

import motion.Actuate;

import com.saumya.raymp.components.ButtonWithBgColor;
import com.saumya.raymp.components.TextInputWithBgColor;




class GameShell extends Sprite {
	
	private var bg:Sprite;
	private var gWidth:Float;
	private var gHeight:Float;

	private var tUserData:TextInputWithBgColor;

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
		g.beginFill(0xCCAAAA,1.0);
		g.drawRect(0,0,this.gWidth,this.gHeight);
		g.endFill();
	}
	public function init():Void{
		this.drawUI();
	}
	private function drawUI():Void{
		var b1:ButtonWithBgColor = new ButtonWithBgColor("Version number of the Game - 1.0.0",30,0x777777);
		this.addChild(b1);
		b1.x = b1.y = 40;
		//
		var bSave:ButtonWithBgColor = new ButtonWithBgColor("Save Data",50);
		bSave.x = 40;
		bSave.y = 100;
		this.addChild(bSave);
		//
		var bGetSaved:ButtonWithBgColor = new ButtonWithBgColor("Get Data",50);
		bGetSaved.x = 300;
		bGetSaved.y = 100;
		this.addChild(bGetSaved);
		//
		bSave.addEventListener(MouseEvent.CLICK,onSaveClick);
		bGetSaved.addEventListener(MouseEvent.CLICK,onGetSavedDataClick);
		//
		this.tUserData = new TextInputWithBgColor('user data',40,400);
		tUserData.x = 40;
		tUserData.y = 200;
		this.addChild(this.tUserData);

	}

	private function onSaveClick(e:MouseEvent):Void{
		//trace(this.tUserData.getText());

		var so:SharedObject = SharedObject.getLocal("savedData");
		var s:String = this.tUserData.getText();
		//trace('this.resultField.text',s);

		so.setProperty("userData",s);
		so.flush(100);
	}
	private function onGetSavedDataClick(e:MouseEvent):Void{
		//trace(this.tUserData.getText());
		var so:SharedObject = SharedObject.getLocal("savedData");
		trace('so.data.appName',so.data.userData);

		this.tUserData.setText(so.data.userData);
	}
}