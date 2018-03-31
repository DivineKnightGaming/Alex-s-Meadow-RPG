package;

import flixel.util.FlxSave;
import flixel.tile.FlxTilemap;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.effects.FlxSpriteFilter;
import flixel.group.FlxGroup;


/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	/**
	 * Generic levels Array that can be used for cross-state stuff.
	 * Example usage: Storing the levels of a platformer.
	 */
	public static var levels:Array<Dynamic> = [];
	/**
	 * Generic level variable that can be used for cross-state stuff.
	 * Example usage: Storing the current level number.
	 */
	public static var level:Int = 0;
	/**
	 * Generic scores Array that can be used for cross-state stuff.
	 * Example usage: Storing the scores for level.
	 */
	public static var scores:Array<Dynamic> = [];
	/**
	 * Generic score variable that can be used for cross-state stuff.
	 * Example usage: Storing the current score.
	 */
	public static var score:Int = 0;
	/**
	 * Generic bucket for storing different FlxSaves.
	 * Especially useful for setting up multiple save slots.
	 */
	public static var saves:Array<FlxSave> = [];
	
	public static var text:FlxText;
	public static var sprite:FlxSprite;
	public static var button:FlxButton;
	
	public static var tokenDesc:FlxText;
	
	public static var dkLogo="assets/images/DKGTitleLogo.png";
	public static var dkLogoSp:FlxSprite;
	
	public static var buttonImg = "assets/data/buttondk.png";
	public static var goodbuttonImg = "assets/data/buttondksmall.png";
	public static var goodbutton:FlxButton;
	public static var goodnode:Node;
	public static var badbuttonImg = "assets/data/buttondksmallbad.png";
	public static var badbutton:FlxButton;
	public static var badnode:Node;
	
	public static var pointerImg = "assets/images/pointer.png";
	public static var pointerSp:FlxSprite;
	public static var selectbutton:FlxButton;
	public static var beginbutton:FlxButton;
	
	public static var btnLeftImg = "assets/images/small_arrow_l.png";
	public static var btnRightImg = "assets/images/small_arrow_r.png";
	public static var leftBtn:FlxButton;
	public static var rightBtn:FlxButton;
	
	public static var playerSprite="";
	
	public static var battleSprites:Array<String> = ["assets/images/paladin.png","assets/images/paladin_girl.png","assets/images/priest.png","assets/images/priestess.png"
											 ,"assets/images/thief.png","assets/images/thief_girl.png","assets/images/wizard.png","assets/images/wizard_girl.png"];
	public static var playerSprites:Array<String> = ["assets/images/paladinanim.png","assets/images/paladingirlanim.png","assets/images/priestanim.png","assets/images/priestessanim.png"
											 ,"assets/images/thiefanim.png","assets/images/thiefgirlanim.png","assets/images/wizardanim.png","assets/images/wizardgirlanim.png"];
	
	public static var monsterSprites:Array<String> = ["assets/images/snake.png", "assets/images/slime.png", "assets/images/whelp.png", "assets/images/dragon.png",
											"assets/images/spider.png","assets/images/goblin.png","assets/images/goblin_knight.png","assets/images/royal_goblin.png",
											"assets/images/bat.png","assets/images/ogre.png","assets/images/ogre_mage.png","assets/images/ogre_warrior.png",
											"assets/images/skeleton.png","assets/images/skeleton_mage.png","assets/images/skeleton_knight.png","assets/images/undead_wind_sorceress.png"];
											 
	public static var playerToken:Int;
	public static var pFilter:FlxSpriteFilter;
	public static var playerMaxHealth = 50;
	public static var playerAttack = 6;
	public static var playerHeal = 20;
	
	public static var powImg = "assets/images/pow.png";
	public static var powSprite:FlxSprite;
	
	public static var nodesGood:Array<Dynamic> = [];
	public static var nodesBad:Array<Dynamic> = [];
	public static var nodeGoodImg = "assets/images/node_good.png";
	public static var nodeBadImg = "assets/images/node_bad.png";
	
	public static var dialogWindow = "assets/images/494x200_window.png";
	public static var actionWindow = "assets/images/240x240_window.png";
	public static var speakerWindow = "assets/images/100x120_window.png";
	
	public static var hunter = "assets/images/ranger.png";
	public static var guard = "assets/images/knight.png";
	public static var king = "assets/images/king.png";
	
}
