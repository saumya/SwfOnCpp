/**
 *
 *	version	:	1.0.0
 *	author	:	saumya
 *
 *	This is used to display the mobile UI as it is shown in default mobile applications.
 *
 **/

package com.saumya.game;

import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.display.Graphics;

import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;

import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Widget;
import ru.stablex.ui.widgets.Scroll;
import ru.stablex.ui.widgets.VBox;

// usage 
// instantiate with width x height
// call init() or initWithTopbar() as per requirement
// add child to this.contentPane, which is actually the scrollable view

class MobilePanel extends Sprite {

	private var pWidth:Float;
	private var pHeight:Float;
	//
	private var isHavingTopBar:Bool;
	private var topBarHeight:Float;
	//
	private var contentPane:VBox;
	private var scrollContainer:Scroll;
	private var title:TextField;

	public function new(panelWidth:Float,panelHeight:Float) {
		super();
		this.pWidth = panelWidth;
		this.pHeight = panelHeight;

		this.isHavingTopBar = false;
		// Conditional compiling
		#if android
			this.topBarHeight = 100;
		#else
			this.topBarHeight = 60;
		#end
	}
	
	// This is called form the container, or whoever is making this panel
	public function init():Void{
		render();
	}

	public function initWithTopbar():Void{
		render(true);
	}

	private function render(shouldDrawTopbar:Bool=false):Void{
		var g1:Graphics = this.graphics;
		//g1.clear(); // Call this if needed
		g1.beginFill(0xCCCCAA,1.0);
		g1.drawRect(0,0,this.pWidth,this.pHeight);
		g1.endFill();
		// Top Bar
		if(shouldDrawTopbar){
			g1.beginFill(0xEEEEEE,1.0);
			g1.drawRect(0,0,this.pWidth,this.topBarHeight);
			g1.endFill();
			this.isHavingTopBar = true;
			//
			this.title = new TextField();
			this.title.autoSize = TextFieldAutoSize.CENTER;
			this.title.text = "Title";

			var my_fmt:TextFormat = new TextFormat(); 
			my_fmt.color = 0x444444; 
			my_fmt.size = 40;

			this.title.defaultTextFormat = my_fmt;
			this.title.x = (this.pWidth-this.title.width)/2;
			this.title.y = 10;

			super.addChild(this.title);

			
		}else{
			// Do Nothing
		}
		//
		createScollView();
	}
	private function createScollView():Void{
		
		//var scrollView = UIBuilder.buildFn('sui/ScrollViewMobilePanel.xml')();
		this.scrollContainer = UIBuilder.buildFn('sui/ScrollViewMobilePanel.xml')();
		//this.addChild( this.scrollContainer );// since this is now overridden
		super.addChild( this.scrollContainer );

		if(this.isHavingTopBar){
			this.scrollContainer.y = this.topBarHeight+2;
			this.scrollContainer.h = this.pHeight-(this.topBarHeight+10);
		}else{
			this.scrollContainer.y = 2;
			this.scrollContainer.h = this.pHeight-4;
		}

		this.scrollContainer.x = 4;
		
		this.scrollContainer.w = this.pWidth-10;
		
		this.contentPane = cast(this.scrollContainer.box,VBox);
		
		//this.addChild(this.scrollContainer);// since this is now overridden
		//super.addChild(this.scrollContainer);
	}

	override public function addChild(child:DisplayObject):DisplayObject{
		trace("DOES NOTHING! Use addObjectToScrollView() or addObjectToTopBar()");
		return child;
	}

	public function addObjectToScrollView(child:DisplayObject):Void{
		//trace('addObjectToScrollView');
		this.contentPane.addChild(child);
	}

	public function addObjectToTopBar(child:DisplayObject):Void{
		//this.addChild(child); // since this is now overridden
		super.addChild(child);
		//this.scrollContainer.refresh();
	}

	// ====================== API =====================

	public function refreshScollContainer():Void{
		this.scrollContainer.refresh();
	}

	public function setTitleText(newTitle:String):Void{
		if(this.isHavingTopBar){

			var my_fmt:TextFormat = new TextFormat(); 
			my_fmt.color = 0x444444; 
			my_fmt.size = 40;

			this.title.text = newTitle;

			this.title.defaultTextFormat = my_fmt;

		}
	}
}