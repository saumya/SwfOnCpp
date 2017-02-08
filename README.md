SwfOnCpp
=============

An experiment to run SWF assets produced from FlashIDE on CPP.
 - iOS
 - Android
 - MAC

Works on OpenFL but not NME !          

 `Most probably because of SWF library`

#### Notes

 If running an old project, which used to have SWF assets and updating to latest version of Lime and OpenFL, then follow these.

  - Remove the SWF library dependency from project.xml
  - clean the targert `openfl clean neko` ro `openfl clean mac`
  - build and test `openfl test neko`

Thats all. 

The first one is necessary as the `swf` [library is now merged][1] into Openfl.          








[1]: http://www.openfl.org/blog/2016/12/16/openfl-4-5-and-lime-3-5-are-here/
