% World Map Additions

proc WorldReady
    for k : 1 .. 20
	Descriptions (k) := 0
	DesY (k) := 0
	DesX (k) := 0
	MapTile (k) := 0
    end for
    MoveScr := false
    Files (0) := "Data\\Save1.txt"
    Files (1) := "Data\\Save2.txt"
    Files (2) := "Data\\Save3.txt"
    Files (3) := "Data\\Save4.txt"
    WorldList (1) := "Story"
    WorldList (2) := "Fes Report"
    WorldList (3) := "Music"
    WorldList (4) := "Achievements"
    WeaponList (1) := "Weapons"
    WeaponList (2) := "Armor"
    WeaponList (3) := "Items"
    WeaponList (4) := "Magic"
    WeaponList (5) := "Story"
    WeaponList (6) := "Music"
    WeaponList (7) := "Fashion"
    WeaponList (8) := "Avatar"
    WeaponList (9) := "Unseal"
    WeaponList (10) := "Map Archi"
    StatString (1) := "The character's mastery. Certain skills are only for one class."
    StatString (2) := "The heritage of the character. Certain classes have advanced genes in abilities."
    StatString (3) := "Life is the health of the character. 0 Life is incapacitated."
    StatString (4) := "Mana is the energy remaining in the character. "
    StatString (5) := "Attack is the physical ability to cause damage to opponents."
    StatString (6) := "Magical Attack is the usage of magic to inflict pain on enemies."
    StatString (7) := "Defense is the resistance a character has to survive blows."
    StatString (8) := "Magical Defense is the mentality of absorbing magic."
    StatString (9) := "The speed of a character to have his/her next turn quickly."
    MapTile (1) := Pic.FileNew ("Pictures\\RastasBarAva.bmp")
    MapTile (2) := Pic.FileNew ("Pictures\\KeuhiForestAva.bmp")
    MapTile (3) := Pic.FileNew ("Pictures\\DeadWoodAva.bmp")
    MapTile (4) := Pic.FileNew ("Pictures\\RegikhoarPalaceAva.bmp")
    MapTile (5) := Pic.FileNew ("Pictures\\FieldofTitansAva.bmp")
    MapTile (6) := Pic.FileNew ("Pictures\\HeathenWolvesAva.bmp")
    MapTile (7) := Pic.FileNew ("Pictures\\ButterflyIslandAva.bmp")
    MapTile (8) := Pic.FileNew ("Pictures\\GraveyardAva.bmp")
    MapTile (9) := Pic.FileNew ("Pictures\\SakkhanOasisAva.bmp")
    MapTile (10) := Pic.FileNew ("Pictures\\GeneralShermanAva.bmp")
    MapTile (11) := Pic.FileNew ("Pictures\\ShipGraveyardAva.bmp")
    Des (1) := "Rasta's Bar and Grille"
    DesY (1) := 778
    DesX (1) := 390
    Des (2) := "Keushi Forest"
    DesY (2) := 1220
    DesX (2) := 1123
    Des (3) := "Xoarnin Mists"
    DesY (3) := 1040
    DesX (3) := 385
    Des (4) := "Regikhoar Palace"
    DesY (4) := 575
    DesX (4) := 554
    Des (5) := "Field of Titans"
    DesY (5) := 746
    DesX (5) := 873
    Des (6) := "Heathen Wolves"
    DesY (6) := 363
    DesX (6) := 1026
    Des (7) := "Crescent Lake"
    DesY (7) := 149
    DesX (7) := 1330
    Des (8) := "Grave of the Fireflies"
    DesY (8) := 756
    DesX (8) := 1205
    Des (9) := "Sakkhan Oasis"
    DesY (9) := 1393
    DesX (9) := 274
    Des (10) := "General Sherman"
    DesY (10) := 1160
    DesX (10) := 796
    Des (11) := "Ship Graveyard"
    DesY (11) := 147
    DesX (11) := 198
end WorldReady

proc WRestrictions
    if PosX > 0 then
	PosX := 0
    elsif PosX < -800 then
	PosX := -800
    end if
    if PosY > 200 then
	PosY := 200
    elsif PosY < -700 then
	PosY := -700
    end if
    FlipSide := false
end WRestrictions

proc PRestrictions
    if PLS < 0 then
	PLS := 0
    elsif PLS > 3 then
	PLS := 3
    end if
end PRestrictions

proc DrawWorld (PosX, PosY : int)
    Pic.Draw (WorldMap, PosX, PosY, picCopy)     % Surround Bottom
    Draw.Box (1, 200, maxx - 1, maxy - 1, 77)             % Surround Top
    Draw.Box (0, 0, maxx, maxy, 151)
end DrawWorld

proc DrawWorldGUI
    Draw.FillBox (1, 1, maxx - 1, 199, 31)
    Draw.Box (1, 1, maxx - 1, 199, 79)
    Draw.Box (280, 10, 780, 190, 29) % Right side
    for k : 0 .. 3
	Draw.Box (290, 145 - k * 42, 490, 180 - k * 42, 29) % Right side Boxes
    end for
    Font.Draw ("Settings", 95, 18, Font1, 111)             % Text
    Font.Draw ("Combination", 75, 58, Font1, 104)             % ^
    Font.Draw (" Unseal ", 93, 98, Font1, 107)             % ^
    Font.Draw (" Party ", 98, 138, Font1, 122)             % ^     % 7
    Draw.Box (10, 10, 260, 40, 27)             % Left Bottom boxes
    Draw.Box (10, 50, 260, 80, 27)
    Draw.Box (10, 90, 260, 120, 27)
    Draw.Box (10, 130, 260, 160, 27)
    Draw.Box (12, 12, 258, 38, 25)             % Left Bottom boxes
    Draw.Box (12, 52, 258, 78, 25)
    Draw.Box (12, 92, 258, 118, 25)
    Draw.Box (12, 132, 258, 158, 25)
    Draw.Box (10, 170, 260, 190, 27)             % Top of bottom
    Draw.FillBox (4, 24, 9, 146, 31)
    Draw.FillBox (261, 24, 266, 146, 31)
end DrawWorldGUI
