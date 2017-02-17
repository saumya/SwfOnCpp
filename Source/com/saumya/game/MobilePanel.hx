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
			g1.drawRect(0,0,this.pWidth,this.topBarHeight);
			g1.endFill();
			this.isHavingTopBar = true;
		}else{
			// Do Nothing
		}
		//
		createScollView();
	}
	private function createScollView():Void{
		
		var scrollView = UIBuilder.buildFn('sui/ScrollViewMobilePanel.xml')();
		this.addChild( scrollView );

		if(this.isHavingTopBar){
			scrollView.y = this.topBarHeight+2;
			scrollView.h = this.pHeight-(this.topBarHeight+10);
		}else{
			scrollView.y = 2;
			scrollView.h = this.pHeight-4;
		}

		scrollView.x = 4;
		
		scrollView.w = this.pWidth-10;
		
		this.contentPane = cast(scrollView.box,VBox);
		
		this.addChild(scrollView);
	}

	override public function addChild(child:DisplayObject):DisplayObject{
		trace("DOES NOTHING! Use addObjectToScrollView() or addObjectToTopBar()");
		return child;
	}

	public function addObjectToScrollView(child:DisplayObject):Void{
		this.contentPane.addChild(child);
	}

	public function addObjectToTopBar(child:DisplayObject):Void{
		//this.addChild(child); // since this is now overridden
		super.addChild(child);
	}
}