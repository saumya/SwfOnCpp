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


import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Scroll;
import ru.stablex.ui.widgets.VBox;
import ru.stablex.ui.widgets.Widget;




class GameMobileShell extends Sprite {
	
	private var bg:Sprite;
	private var gWidth:Float;
	private var gHeight:Float;

	private var screenNext:Sprite;

	

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
		// NEXT screen
		this.screenNext = new Sprite();
		var g1:Graphics = this.screenNext.graphics;
		g1.beginFill(0xCCCCAA,1.0);
		g1.drawRect(0,0,this.gWidth,this.gHeight);
		g1.endFill();
		this.screenNext.x = this.gWidth;
		var btnBack:ButtonWithBgColor = new ButtonWithBgColor("Back",30,0xCCCCCC);
		screenNext.addChild(btnBack);
		//btnNext.x = this.gWidth - (btnNext.width+10);
		btnBack.addEventListener(MouseEvent.CLICK,onBackScreenClick);
		//move to last rendering
		//this.addChild(screenNext);
		//
		UIBuilder.init();
	}
	public function init():Void{
		this.drawUI();
	}
	private function drawUI():Void{
		//
		var btnNext:ButtonWithBgColor = new ButtonWithBgColor("Next",30,0xCCCCCC);
		this.addChild(btnNext);
		btnNext.x = this.gWidth - (btnNext.width+10);
		#if android
			btnNext.y = 6;
		#end

		btnNext.addEventListener(MouseEvent.CLICK,onNextScreenClick);

		//StablexUI
		var scrollView = UIBuilder.buildFn('sui/ScrollView.xml')();
		this.addChild( scrollView );
		//var vBox:VBox = cast UIBuilder.getAs('idVBox', VBox);
		var vBox:Widget = scrollView.box;

		var actionBarHeight = 0;

		// Conditional Compilation
		#if android
			actionBarHeight = 100;
		#else
			actionBarHeight = 50;
		#end

		scrollView.x = 4;
		scrollView.y = actionBarHeight;
		scrollView.w = this.gWidth-10;
		scrollView.h = this.gHeight-(actionBarHeight+6);
		//vBox.left = 20;
		//vBox.top = 20;
		//vBox.w = this.gWidth-10;
		//vBox.h = this.gHeight+300;
		
		//
		//var b1:ButtonWithBgColor = new ButtonWithBgColor("Version number of the Game - 1.0.0",30,0x777777);
		//vBox.addChild(b1);
		
		var num = 30;
		for (i in 0 ... num) {
			//trace(i);
			var b1:ButtonWithBgColor = new ButtonWithBgColor("Button-"+i,30,0x777777);
			vBox.addChild(b1);
			//vBox.y = i*10;
		}
		//var nH = this.gHeight+num*18+10;
		//var nH = this.gHeight+num*18;
		//vBox.h = nH;
		//vBox.w = this.gWidth-10;
		/*
		var b1:ButtonWithBgColor = new ButtonWithBgColor("Button-1",30,0x777777);
		vBox.addChild(b1);
		var b2:ButtonWithBgColor = new ButtonWithBgColor("Button-2",30,0x777777);
		vBox.addChild(b2);
		*/

		//vBox.refresh();
		scrollView.refresh();
		//NEXT screen
		this.addChild(screenNext);
	}

	private function onNextScreenClick(e:MouseEvent):Void{
		trace('onNextScreenClick');
		/*
		var screenNext:Sprite = new Sprite();
		var g:Graphics = screenNext.graphics;
		g.beginFill(0xCCCCAA,1.0);
		g.drawRect(0,0,this.gWidth,this.gHeight);
		g.endFill();
		screenNext.x = this.gWidth;


		var btnBack:ButtonWithBgColor = new ButtonWithBgColor("Back",30,0xCCCCCC);
		screenNext.addChild(btnBack);
		//btnNext.x = this.gWidth - (btnNext.width+10);
		btnBack.addEventListener(MouseEvent.CLICK,onBackScreenClick);
		this.addChild(screenNext);
		*/
		//animate-in this
		Actuate.tween (this.screenNext, 1, { x: 0 });

	}

	private function onBackScreenClick(e:MouseEvent):Void{
		trace('onBackScreenClick');
		Actuate.tween (this.screenNext, 1, { x: this.gWidth });
	}

	
}