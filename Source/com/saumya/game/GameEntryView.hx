package com.saumya.game;

import openfl.display.Sprite;
import openfl.display.Graphics;
import openfl.events.Event;
import openfl.events.MouseEvent;



class GameEntryView extends Sprite {
	
	public static var UI_READY:String = "GameUiIsReady";

	private var animRect:AnimRect;
	private var isAnimating:Bool;

	public function new() {
		super();
		this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
	}
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
	public function render():Void{
		trace('render');
		// draw background
		var bg:Graphics = this.graphics;
		bg.clear();
		bg.beginFill(0xCCCCCC,1.0);
		bg.drawRect(0,0,400,500);
		bg.endFill();

		// Use SWF asset library
		this.drawFromSwf();
	}

	private function drawFromSwf():Void{
		trace('drawFromSwf');

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

		// Fix this ! The Event is not getting dispatched
		var ge:Event = new Event(GameEntryView.UI_READY,true);
		this.dispatchEvent(ge);
		
		//
		this.centerTheGameOnStage();
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

	private function centerTheGameOnStage():Void{
		this.x = (this.stage.stageWidth - this.width)/2 ;
		this.y = (this.stage.stageHeight - this.height)/2;
	}
}