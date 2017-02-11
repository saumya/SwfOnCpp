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

import openfl.text.TextField;

import openfl.net.SharedObject;
//import flash.net.SharedObject;



class GameEntryView extends Sprite {
	
	public static var UI_READY:String = "GameUiIsReady";

	private var animRect:AnimRect;
	private var isAnimating:Bool;

	private var mainRef:Main;
	private var fWidth:Float;
	private var fHeight:Float;

	private var resultField:TextField;

	public function new(mainObj:Main,gameWidth:Float,gameHeight:Float) {
		super();
		
		this.mainRef = mainObj;
		this.fWidth = gameWidth;
		this.fHeight = gameHeight;

		//this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		this.render();
	}
	/*
	private function onAddedToStage(e:Event):Void{
		this.preInit();
	}
	public function preInit():Void{
		trace('preInit');

		this.isAnimating = false;
		this.init();
	}
	public function init():Void{
		trace('init');

		this.render();
	}
	*/
	public function render():Void{
		trace('GameEntryView : render');

		// draw background
		var bg:Graphics = this.graphics;
		bg.clear();
		bg.beginFill(0x440000,1.0);
		bg.drawRect(0,0,this.fWidth,this.fHeight);
		bg.endFill();

		// Use SWF asset library
		this.drawFromSwf();
	}

	private function drawFromSwf():Void{
		trace('GameEntryView : drawFromSwf');
		
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
		this.addChild(btn);
		this.addChild(this.animRect);
		

		/*
		// Fix this ! The Event is not getting dispatched
		var ge:Event = new Event(GameEntryView.UI_READY,true);
		this.dispatchEvent(ge);
		*/

		//Assets for second SWF
		var numItems:Int = 10;
		for (i in 0 ... numItems) {
			var a = new Input1Type();
			this.addChild(a);
			a.x = 10;
			a.y = 240+50*i;

			if (i==0) {
				this.resultField = a.uInput;
			}

			a.addEventListener(MouseEvent.CLICK,onUserClick);
		}

		//
		//this.centerTheGameOnStage();
		//this.mainRef.onGameUiReady();

		var b1:Btn_FormView = new Btn_FormView();
		this.addChild(b1);
		b1.x = 10;
		b1.y = 240+50*10+20;
		b1.addEventListener(MouseEvent.CLICK,onB1Click);
		//
		var b2:Btn_ResultView = new Btn_ResultView();
		this.addChild(b2);
		b2.x = b1.x + b1.width + 50;
		b2.y = b1.y;
		b2.addEventListener(MouseEvent.CLICK,onB2Click);
	}

	private function onB2Click(e:MouseEvent):Void{
		trace('onB2Click');
		var so:SharedObject = SharedObject.getLocal("savedData");
		trace('so.data',so.data);
		trace('so.data.appName',so.data.appName);
		this.resultField.text = so.data.appName;
	}

	private function onB1Click(e:MouseEvent):Void{
		trace('onB1Click');
		var so:SharedObject = SharedObject.getLocal("savedData");
		//trace('so.data',so.data);
		var s:String = this.resultField.text;
		trace('this.resultField.text',s);

		so.setProperty("appName",s);
	}

	private function onUserClick(e:MouseEvent):Void{
		// trace(e.target);
		// trace(e.currentTarget);

		// Ref: http://stackoverflow.com/questions/1904778/placing-cursor-blinking-caret-into-input-textfield-for-user-input-in-as3

		var it1:Input1Type = cast(e.currentTarget);
		//it1.uInput.text = "Hello";

		this.stage.focus = it1.uInput;
		
		if(it1.uInput.text == ""){
			it1.uInput.text = "type";
			//it1.uInput.text = "";
			it1.uInput.setSelection(0,it1.uInput.text.length);
		}
		
		//Selection.setFocus(it1.uInput);
		//it1.tabEnabled = false;

		//it1.uInput.setSelection(it1.uInput.text.length,it1.uInput.text.length);
		//it1.uInput.setSelection(0,it1.uInput.text.length);
		//it1.uInput.caretIndex = 0;

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
	/*
	// Anyway not working for the events
	private function centerTheGameOnStage():Void{
		trace('centerTheGameOnStage');

		this.x = (this.stage.stageWidth - this.width)/2 ;
		this.y = (this.stage.stageHeight - this.height)/2;
	}
	*/
	public function onStageResize():Void{
		trace('onStageResize');

		//this.width = this.stage.stageWidth  ;
		//this.height = this.stage.stageHeight ;
		this.fWidth = this.stage.stageWidth;
		this.fHeight = this.stage.stageHeight;

		this.render();

	}
}