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
import motion.easing.Quad;

import com.saumya.raymp.components.ButtonWithBgColor;
import com.saumya.raymp.components.TextInputWithBgColor;

import com.saumya.game.MobilePanel;


import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Scroll;
import ru.stablex.ui.widgets.VBox;
import ru.stablex.ui.widgets.Widget;




class GameMobileShell extends Sprite {
	
	private var bg:Sprite;
	private var gWidth:Float;
	private var gHeight:Float;

	private var screenNext:MobilePanel;
	private var screenThree:MobilePanel;
	private var activeScreenNum:Int;

	

	public function new(gameWidth:Float,gameHeight:Float) {
		super();
		//
		this.gWidth = gameWidth;
		this.gHeight = gameHeight;
		//
		this.activeScreenNum = 1;
		//
		this.preInit();
	}
	private function preInit():Void{
		// StablexUI
		UIBuilder.init();
		// drawBg
		this.bg = new Sprite();
		this.addChild(bg);
		//
		var g:Graphics = this.bg.graphics;
		g.beginFill(0xCCAAAA,1.0);
		g.drawRect(0,0,this.gWidth,this.gHeight);
		g.endFill();
		// NEXT screen
		this.screenNext = new MobilePanel(this.gWidth,this.gHeight);
		this.screenThree = new MobilePanel(this.gWidth,this.gHeight);
		//this.screenNext.init();
		this.screenNext.initWithTopbar();
		this.screenThree.initWithTopbar();
		// position the screen
		this.screenNext.x = this.gWidth;
		this.screenThree.x = this.gWidth;
		var btnBack:ButtonWithBgColor = new ButtonWithBgColor("Back",30,0xCCCCCC);
		//screenNext.addChild(btnBack);
		btnBack.x = btnBack.y = 6;
		//screenNext.addObjectToTopBar(btnBack);
		//btnNext.x = this.gWidth - (btnNext.width+10);
		//btnBack.addEventListener(MouseEvent.CLICK,onBackScreenClick);
		//move to last rendering
		//this.addChild(screenNext);

		var btnNext:ButtonWithBgColor = new ButtonWithBgColor("Next",30,0xCCCCCC);
		//this.addChild(btnNext);
		btnNext.x = this.gWidth - (btnNext.width + 6);
		btnNext.y = 6;

		btnBack.addEventListener(MouseEvent.CLICK,onBackScreenClick);
		btnNext.addEventListener(MouseEvent.CLICK,onNextScreenClick);

		screenNext.addObjectToTopBar(btnBack);
		screenNext.addObjectToTopBar(btnNext);
		//
		//UIBuilder.init();
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
		
		var num = 30;
		for (i in 0 ... num) {
			//trace(i);
			var b1:ButtonWithBgColor = new ButtonWithBgColor("Button-"+i,30,0x777777);
			vBox.addChild(b1);
			//vBox.y = i*10;
		}

		//vBox.refresh();
		scrollView.refresh();
		//NEXT screen
		this.addChild(screenNext);
		this.addChild(screenThree);
	}

	private function onNextScreenClick(e:MouseEvent):Void{
		//trace('onNextScreenClick:activeScreenNum:'+activeScreenNum);

		this.activeScreenNum++;
		trace('onNextScreenClick:activeScreenNum:'+activeScreenNum);
		
		if(this.activeScreenNum==2){
			Actuate.tween (this.screenNext, 0.6, { x: 0 }).ease (Quad.easeOut);
		}else if(this.activeScreenNum==3){
			Actuate.tween (this.screenThree, 0.6, { x: 0 }).ease (Quad.easeOut);
		}
		//animate-in this
		//Actuate.tween (this.screenNext, 0.6, { x: 0 }).ease (Quad.easeOut);
	}

	private function onBackScreenClick(e:MouseEvent):Void{
		//trace('onBackScreenClick:activeScreenNum:'+activeScreenNum);
		
		this.activeScreenNum--;
		trace('onBackScreenClick:activeScreenNum:'+activeScreenNum);

		if(this.activeScreenNum==1){
			Actuate.tween (this.screenNext, 0.6, { x: this.gWidth }).ease (Quad.easeIn);
		}else if(this.activeScreenNum==2){
			Actuate.tween (this.screenThree, 0.6, { x: this.gWidth }).ease (Quad.easeIn);
		}
		//animate-out this
		//Actuate.tween (this.screenNext, 0.6, { x: this.gWidth }).ease (Quad.easeIn);
	}

	
}