% Variables

type ID :
    record
	Name : array 1 .. 50 of string
	Team : array 1 .. 50 of int % 1 = Main,2 = Help,3=Foe
	Real : array 1 .. 50 of boolean
	Avatar : array 1 .. 50 of int
	Picture : array 1 .. 50 of int
	Class : array 1 .. 50 of string
	Race : array 1 .. 50 of string
	Hp : array 1 .. 50 of real
	THp : array 1 .. 50 of real
	Mana : array 1 .. 50 of real
	TMana : array 1 .. 50 of real
	Attack : array 1 .. 50 of real
	M_Attack : array 1 .. 50 of real
	Defense : array 1 .. 50 of real
	M_Defense : array 1 .. 50 of real
	Speed : array 1 .. 50 of int
	Resistance : array 1 .. 50 of real
	Luck : array 1 .. 50 of real
	Burst : array 1 .. 50 of int
	Accuracy : array 1 .. 50 of int
	Evasion : array 1 .. 50 of int
	Block : array 1 .. 50 of int
	Pierce : array 1 .. 50 of int
	StoredHp : array 1 .. 50 of real
	StoredTHp : array 1 .. 50 of real
	StoredMana : array 1 .. 50 of real
	StoredTMana : array 1 .. 50 of real
	StoredAttack : array 1 .. 50 of real
	StoredM_Attack : array 1 .. 50 of real
	StoredDefense : array 1 .. 50 of real
	StoredM_Defense : array 1 .. 50 of real
	StoredSpeed : array 1 .. 50 of int
	StoredResistance : array 1 .. 50 of real
	StoredLuck : array 1 .. 50 of real
	StoredBurst : array 1 .. 50 of int
	StoredAccuracy : array 1 .. 50 of int
	StoredEvasion : array 1 .. 50 of int
	StoredBlock : array 1 .. 50 of int
	StoredPierce : array 1 .. 50 of int
	Transform : array 1 .. 50, 1 .. 10 of int
	Money : array 1 .. 50 of int
	XC : array 1 .. 50 of int
	YC : array 1 .. 50 of int
	Turn : array 1 .. 50 of int
	Level : array 1 .. 50 of int
	Magic : array 1 .. 50, 1 .. 50 of int
	Skills : array 1 .. 50, 1 .. 50 of int
	Unseal : array 1 .. 50 of int
    end record

type Guild :
    record
	Size : array 1 .. 50 of int
	GMoney : array 1 .. 50 of int
	Level : array 1 .. 50 of int
    end record

% Main variables
var Files : array 0 .. 3 of string
var Filex : string := "Data\\Save1.txt"
var stream : int
var Blue : int := 1
var Sky : int := 2
var Brown : int := 3
var BlazeBlue : int := 4 
var Slate : int := 5
var DarkPurple : int := 6
var HardBlue : int := 7
var Mx, My, Mb : int
var Hitting, Riffle : int := 0
var WithinRange : boolean := false
var Hp : real := 50
var Mana : real := 50
var Luck : real := 30
var Money : int := 1000
var Tis : int
var StatString : array 1 .. 9 of string
var Moved, Action, MovingInAction, StartMenu, InBattle : boolean := false
var Pressed : array char of boolean
var Advant : array 1 .. 2 of int
var FirstNo, Order : boolean := false
var FightSize, Tiz : int := 0
var Exiting, Flee, Pause, StartOption, Fighting : boolean := false
var SkillRange : array 1 .. 50 of string
var Fight : boolean := false
var SMGUI : array 1 .. 3 of string
var Bx, By, RandomX, RandomY : array 1 .. 12 of int
var Coleur : int := 54
var FlipSide, Cancel : boolean := false
var MainS : array 1 .. 3 of int
var GenericInt, PLS, CurT : int := 1
var SongPlaying : int := 3
var BattleBlock : array 1 .. 40, 1 .. 30 of int
var Inventory : array 1 .. 12, 1 .. 50 of int
var SMString : array 1 .. 10 of string
var PosX, Dx, Dx2,PosY, Dy, Dy2 : int := 0
var ClickedChar, MoveScr, MapSelect : boolean := false
var Win, Lose : boolean := true
var SelectChar, PercentHit : int := 0
var DamageHit : real := 0
var CS, SelectSkill : int := 1
var Descriptions, DesY, DesX : array 1 .. 20 of int
var Des : array 1 .. 20 of string
var Acted, Burst, Rest,Attack, Magic, Skills, Unseal, Item : boolean := false
var AMSUI : array 1 .. 5 of boolean
var AMSUIString : array 1 .. 5 of string
var Attacks, Rotation, DisplayRotations, SkillRangeInt, MagicRangeInt : array 1 .. 50 of int
var MapTile : array 1 .. 20 of int
var Attackstring, Magicstring, Skillstring, Itemstring : array 1 .. 50 of string
var Unsealstring : array 1 .. 10 of string
var Actions : array 1 .. 5 of boolean
var Item_Class : array 1 .. 10, 1 .. 50 of int
var OptString : array 1 .. 4 of string
var SongName, SongDes : array 1 .. 25 of string
var TC : array 1 .. 25 of int
var WeaponList : array 1 .. 10 of string
var WorldList : array 1 .. 4 of string
var SoundList : int := 0
var SoundTrack : boolean := false

% Fonts
var Font1 := Font.New ("Garamond:16")
var Font2 := Font.New ("Complex:30")
var Font3 := Font.New ("Garamond:12")
var Font4 := Font.New ("AR DESTINE:30")
var Font5 := Font.New ("AR DESTINE:15")
var Font6 := Font.New ("AR DESTINE:13")
var Font7 := Font.New ("AR DESTINE:24")

% GUI
var SpeechBack := Pic.FileNew ("Pictures\\SpeechBack.bmp")
% Areas
var IntroPic := Pic.FileNew ("Pictures\\LirfenIntroPic.bmp")
var Intro2Pic := Pic.FileNew ("Pictures\\BlackIntroPic.bmp")
var Intro3Pic := Pic.FileNew ("Pictures\\BlackIntroPic2.bmp")
var Intro4Pic := Pic.FileNew ("Pictures\\BlackIntroPic3.bmp")
var MainMenu := Pic.FileNew ("Pictures\\MainMenu.bmp")
var WorldMap := Pic.FileNew ("Pictures\\WorldMap.bmp")
var WorldMapExit := Pic.FileNew ("Pictures\\WorldMapExit.bmp")
var Rastas_Bar_Pic := Pic.FileNew ("Pictures\\Rastas_Bar_Pic.bmp")
var PartyScreen := Pic.FileNew ("Pictures\\PartyScreen.bmp")
var SettingsScreen := Pic.FileNew ("Pictures\\SettingsScreen.bmp")
% Avatars
var LirfenAva : int := Pic.FileNew ("Pictures\\LirfenAva.bmp")
var ShanaAva : int := Pic.FileNew ("Pictures\\ShanaAva.bmp")
var NoraAva : int := Pic.FileNew ("Pictures\\NoraAva.bmp")
var HiyoriAva : int := Pic.FileNew ("Pictures\\HiyoriAva.bmp")
var MinstAva : int := Pic.FileNew ("Pictures\\MinstAva.bmp")
var RadShuanAva : int := Pic.FileNew ("Pictures\\RadShuanAva.bmp")
var WurbulAva : int := Pic.FileNew ("Pictures\\WurbulAva.bmp")
var GnollAva : int := Pic.FileNew ("Pictures\\GnollAva.bmp")
var WolframAva : int := Pic.FileNew ("Pictures\\GnollAva.bmp")
var GobassassinAva : int := Pic.FileNew ("Pictures\\GobassassinAva.bmp")
var KarlanAva : int := Pic.FileNew ("Pictures\\KarlanAva.bmp")
var OrlanAva : int := Pic.FileNew ("Pictures\\Orlan.bmp")
% People
var LirfenPic : int := Pic.FileNew ("Pictures\\Lirfen.bmp")
var ShanaPic : int := Pic.FileNew ("Pictures\\Shana.bmp")
var FallPic : int := Pic.FileNew ("Pictures\\Fall.bmp")
var HiyoriPic : int := Pic.FileNew ("Pictures\\Hiyori.bmp")
var NoraPic : int := Pic.FileNew ("Pictures\\Nora.bmp")
var NoraRealPic : int := Pic.FileNew ("Pictures\\Nora2.bmp")
var SeylaPic : int := Pic.FileNew ("Pictures\\Seyla.bmp")
var NaLongPic : int := Pic.FileNew ("Pictures\\Na-Long.bmp")
% Enemies
var WurbulPic : int := Pic.FileNew ("Pictures\\Wurbul.bmp")
var GnollPic : int := Pic.FileNew ("Pictures\\Gnoll.bmp")
var GobassassinPic : int := Pic.FileNew ("Pictures\\Gobassassin.bmp")
var OrlanPic : int := Pic.FileNew ("Pictures\\Orlan.bmp")
var MinstPic : int := Pic.FileNew ("Pictures\\Minst.bmp")
var RadShuanPic : int := Pic.FileNew ("Pictures\\RadShuan.bmp")
var KarlanPic : int := Pic.FileNew ("Pictures\\Karlan.bmp")
var WolframPic : int := Pic.FileNew ("Pictures\\Wolfram.bmp")
% Tiles
var TileGrass : int := Pic.FileNew ("Pictures\\TileGrass.bmp")
var TileGrass2 : int := Pic.FileNew ("Pictures\\TileGrass2.bmp")
var TileBridge : int := Pic.FileNew ("Pictures\\TileBridge.bmp")
var TileFlower : int := Pic.FileNew ("Pictures\\TileFlower.bmp")
var TileTree : int := Pic.FileNew ("Pictures\\TileTree.bmp")
var TileWater : int := Pic.FileNew ("Pictures\\TileWater.bmp")
var TileBarrier : int := Pic.FileNew ("Pictures\\TileBarrier.bmp")
for Pictures : 1 .. 3
    MainS (Pictures) := Pic.FileNew ("Pictures\\MainS" + intstr (Pictures) + ".bmp")
end for
% Barriers
var BarrierCliff : int := Pic.FileNew ("Pictures\\BarrierCliff.bmp")
var BarrierField : int := Pic.FileNew ("Pictures\\BarrierField.bmp")
var BarrierTundra : int := Pic.FileNew ("Pictures\\BarrierTundra.bmp")
var BarrierWater : int := Pic.FileNew ("Pictures\\BarrierWater.bmp")

% Colours
RGB.SetColor (Blue, 0.76, 0.87, 0.9) % (Colour Index / 255 = 0.-)
RGB.SetColor (Sky, 0.51, 0.914, 0.914)
RGB.SetColor (Brown, 0.97647, 0.8549, 0.6941)
RGB.SetColour (BlazeBlue, 0.298, 0.871, 0.988)
RGB.SetColour (Slate, 0.8765, 0.9588, 0.9588)
RGB.SetColour (DarkPurple, 0.0764, 0.0135, 0.1313)
RGB.SetColour (HardBlue, 0.4705, 0.7725, 0.9607)

var Stat : ID
var Party : Guild

