/**
 *
 *	Experiementing with the Flash API
 * 
 *	flash.net.SharedObject : http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/net/SharedObject.html
 *
 **/


package com.saumya.game;

import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.display.Graphics;

import openfl.events.Event;
import openfl.events.MouseEvent;

import openfl.net.SharedObject;

import motion.Actuate;
import motion.easing.Quad;
import motion.easing.Bounce;
import motion.easing.Elastic;
import motion.easing.Linear;

import com.saumya.raymp.components.ButtonWithBgColor;
import com.saumya.raymp.components.TextInputWithBgColor;

import com.saumya.game.MobilePanel;
import com.saumya.game.MobileNavBar;


import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Scroll;
import ru.stablex.ui.widgets.VBox;
import ru.stablex.ui.widgets.Widget;

/*
import gessie.core.Gessie;
import gessie.impl.openfl.OpenflInputAdapter;
import gessie.impl.openfl.OpenflDisplayListAdapter;
import gessie.impl.openfl.OpenflTouchHitTester;
*/



class GameMobileShell extends Sprite {
	
	//private var bg:Sprite;
	private var gWidth:Float;
	private var gHeight:Float;

	private var homeScreen:MobilePanel;
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
		
		var navbarBgColor:UInt = 0x550000;
		var navbarHeight:Float = 60;

		// Conditional compiling
		#if android
			navbarHeight = 100;
		#else
			navbarHeight = 60;
		#end

		this.homeScreen = new MobilePanel(this.gWidth,this.gHeight);
		this.homeScreen.initWithTopbar(navbarBgColor,navbarHeight);

		// NEXT screens
		this.screenNext = new MobilePanel(this.gWidth,this.gHeight);
		this.screenThree = new MobilePanel(this.gWidth,this.gHeight);
		//this.screenNext.init();
		this.screenNext.initWithTopbar(navbarBgColor,navbarHeight);
		this.screenThree.initWithTopbar(navbarBgColor,navbarHeight);
		// position the screen
		this.screenNext.x = this.gWidth;
		this.screenThree.x = this.gWidth;
		//
		var btnBack:ButtonWithBgColor = new ButtonWithBgColor("Back",30,0xCCCCCC);
		btnBack.x = btnBack.y = 6;
		var btnNext:ButtonWithBgColor = new ButtonWithBgColor("Next",30,0xCCCCCC);
		btnNext.x = this.gWidth - (btnNext.width + 6);
		//btnNext.y = 6;
		#if android
			btnBack.y = 26;
			btnNext.y = 26;
		#else
			btnBack.y = 10;
			btnNext.y = 10;
		#end

		btnBack.addEventListener(MouseEvent.CLICK,onBackScreenClick);
		btnNext.addEventListener(MouseEvent.CLICK,onNextScreenClick);

		screenNext.addObjectToTopBar(btnBack);
		screenNext.addObjectToTopBar(btnNext);
		//
		//UIBuilder.init();
	}
	public function init():Void{
		/*
		// gesture
		Gessie.init(this.stage, new OpenflInputAdapter(this.stage, true, true));
    	Gessie.addDisplayListAdapter(DisplayObject, new OpenflDisplayListAdapter());
    	Gessie.addTouchHitTester(new OpenflTouchHitTester(this.stage));
    	*/
    	//
		this.drawUI();
	}
	private function drawUI():Void{
		//trace('drawUI');
		this.addChild(this.homeScreen);
		this.addChild(screenNext);
		this.addChild(screenThree);
		//
		this.homeScreen.setTitleText("Home");
		this.screenNext.setTitleText("Two");
		this.screenThree.setTitleText("Three");
		// Making the screens
		var btnNext:ButtonWithBgColor = new ButtonWithBgColor("Next",30,0xCCCCCC);
		btnNext.x = this.gWidth - (btnNext.width+10);
		#if android
			btnNext.y = 26;
		#else
			btnNext.y = 10;
		#end
		btnNext.addEventListener(MouseEvent.CLICK,onNextScreenClick);
		this.homeScreen.addObjectToTopBar(btnNext);

		var num = 30;
		for (i in 0 ... num) {
			//trace(i);
			var b1:ButtonWithBgColor = new ButtonWithBgColor("Button-"+i,30,0x777777);
			this.homeScreen.addObjectToScrollView(b1);
		}
		this.homeScreen.refreshScollContainer();
		//
		//var navBar:MobileNavBar = new MobileNavBar(this.gWidth,this.gHeight);
		//navBar.init(60,0xAAAA00);
		//this.addChild(navBar);
	}

	private function onNextScreenClick(e:MouseEvent):Void{
		//trace('onNextScreenClick:activeScreenNum:'+activeScreenNum);

		this.activeScreenNum++;
		trace('onNextScreenClick:activeScreenNum:'+activeScreenNum);
		
		if(this.activeScreenNum==2){
			//Actuate.tween (this.homeScreen, 0.6, { alpha: 0.1 }).ease (Quad.easeOut);
			//Actuate.tween (this.screenNext, 0.6, { x: 0, alpha:1.0 }).ease (Quad.easeOut);
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
			//Actuate.tween (this.homeScreen, 0.6, { alpha: 1.0 }).ease (Quad.easeOut);
			//Actuate.tween (this.screenNext, 0.6, { x: this.gWidth, alpha:0.1 }).ease (Quad.easeIn);
			Actuate.tween (this.screenNext, 0.6, { x: this.gWidth }).ease (Quad.easeIn);
		}else if(this.activeScreenNum==2){
			Actuate.tween (this.screenThree, 0.6, { x: this.gWidth }).ease (Quad.easeIn);
		}
		//animate-out this
		//Actuate.tween (this.screenNext, 0.6, { x: this.gWidth }).ease (Quad.easeIn);
	}

	
}