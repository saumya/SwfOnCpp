SwfOnCpp
=============

An experiment to run SWF assets produced from FlashIDE on CPP.
 - iOS
 - Android
 - MAC

It uses `raymp` + `stablexUI` + `SWF assets` 

Works on OpenFL but not NME !          

 `Most probably because of SWF library`

#### Findings
 - SWF assets are rendering properly on Android and CPP targets
 - The `SharedObject` is working fine on Android ( This is for storing data locally )
 - Not sure why this drains the battery life !
 - Does work on HTML5 ! If tt throws an error saying `Type not found : format.swf.lite.MovieClip` then please do a `clean` build and everything is fine. `haxelib run openfl test html5 -clean`
 

#### Notes

 If running an old project, which used to have SWF assets and updating to latest version of Lime and OpenFL, then follow these.

  - Remove the SWF library dependency from project.xml
  - clean the targert `openfl clean neko` ro `openfl clean mac`
  - build and test `openfl test neko`

Thats all. 

 - The first one is necessary as the `swf` [library is now merged][1] into Openfl.          








[1]: http://www.openfl.org/blog/2016/12/16/openfl-4-5-and-lime-3-5-are-here/
