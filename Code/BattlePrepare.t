% Battle Prepare

proc StateVariables
    PosX := 0
    PosY := 0
    for r : 1 .. 5
	Actions (r) := false
    end for
    for i : 1 .. 50
	if Stat.Real (i) = false then
	    Stat.Hp (i) := 0
	    Attacks (i) := 0
	    Stat.Turn (i) := 999
	end if
	MagicRangeInt (i) := 160
	SkillRangeInt (i) := 40
	Attackstring (i) := " "
	Skillstring (i) := " "
	Magicstring (i) := " "
	Itemstring (i) := " "
	SkillRange (i) := "Range: 1"
    end for
    SkillRangeInt (2) := 120
    SkillRangeInt (3) := 160
    for i : 1 .. 5
	AMSUI (i) := false
    end for
    CS := 1
    Riffle := 0
    Burst := false
    WithinRange := false
    Acted := false
    Rest := false
    ClickedChar := false
    Flee := false
    AMSUIString (1) := "Attack"
    AMSUIString (2) := "Magic"
    AMSUIString (3) := "Skill"
    AMSUIString (4) := "Unseal"
    AMSUIString (5) := "Items"
    Attackstring (1) := "Slice"
    Attackstring (2) := "Whip"
    Attackstring (3) := "Shoot"
    Attackstring (4) := "Mana"
    Attackstring (5) := "Punch"
    Attackstring (6) := "Kick"
    Magicstring (1) := "Mana Shot"
    Magicstring (2) := "Thunderstrike"
    Magicstring (3) := "Ice blast"
    Magicstring (4) := "Fire storm"
    Magicstring (5) := "Thunderstorm"
    Magicstring (6) := "Ice freeze"
    Skillstring (1) := "Chain Slash"
    Skillstring (2) := "Torque Lash"
    Skillstring (3) := "Air Render"
    Skillstring (4) := "Pungre"
    Skillstring (5) := "Histos"
    Skillstring (6) := "Sabre Tooth"
    Unsealstring (1) := "Dirs Fire"
    Unsealstring (2) := "Las Turtle"
    Unsealstring (3) := "Frens Shrub"
    Unsealstring (4) := "Ges Bird"
    Unsealstring (5) := "Xun S'lain"
    Unsealstring (6) := "Xor Hawk"
    Unsealstring (7) := "Das Wunder"
    Unsealstring (8) := "Arci Eye"
    Unsealstring (9) := "Ter Minyu"
    Unsealstring (10) := "Rin Cat"
    Itemstring (1) := "Mos Leaf"
    Itemstring (2) := "Mos Palm"
    Itemstring (3) := "Mos Stem"
    Itemstring (4) := "Mos Plant"
    Itemstring (5) := "Stam Leaf"
    Itemstring (6) := "Stam Palm"
    Itemstring (7) := "Stam Stem"
    Itemstring (8) := "Stam Plant"
    Itemstring (9) := "Nos Deions"
    Itemstring (10) := "Geutin Vlask"
    SMString (1) := "Party"
    SMString (2) := "Conditions"
    SMString (3) := "Environment"
    SMString (4) := "Tabs"
    SMString (5) := "Info"
    SMString (6) := "Soundtrack"
    SMString (7) := "Return"
    SMString (8) := "Quick Save"
    SMString (9) := "Flee battle"
    SMString (10) := "Quit game"
    SkillRange (1) := ""
    SkillRange (2) := ""
    SkillRange (3) := ""
    SkillRange (4) := ""
    SkillRange (5) := ""
    SkillRange (6) := ""
end StateVariables

proc Restrictions (FightSize : int)
    if PosX > 200 then
	PosX := 200
    elsif PosX < -1000 then
	PosX := -1000
    end if
    if PosY > 200 then
	PosY := 200
    elsif PosY < -800 then
	PosY := -800
    end if
    for RestricSta : 1 .. FightSize
	for k : 1 .. 40
	    for p : 1 .. 30
		if Stat.Real (RestricSta) = true then
		    if Stat.XC (RestricSta) = k and Stat.YC (RestricSta) = p and BattleBlock (k, p) = 29 then
		    end if
		end if
	    end for
	end for
	if Stat.Real (RestricSta) = true then
	    if Stat.Hp (RestricSta) > Stat.THp (RestricSta) then
		Stat.Hp (RestricSta) := Stat.THp (RestricSta)
	    end if
	    if Stat.Mana (RestricSta) > Stat.TMana (RestricSta) then
		Stat.Mana (RestricSta) := Stat.TMana (RestricSta)
	    end if
	    if Stat.Unseal (RestricSta) > 100 then
		Stat.Unseal (RestricSta) := 100
	    end if
	end if
    end for
    Cancel := false
    FlipSide := false
    MapSelect := false
end Restrictions

proc MapCreate (Mx, My, Mb : int)
    Draw.FillBox (13, 506, 246, 693, DarkPurple)
    for k : 2 .. 28
	Draw.Line (13, 500 + round (k * 6.65), 246, 500 + round (k * 6.65), HardBlue)
	Draw.Line (round (k * 6.65), 507, round (k * 6.65), 693, HardBlue)
    end for
    for k : 29 .. 37
	Draw.Line (round (k * 6.65), 507, round (k * 6.65), 693, HardBlue)
    end for
    Draw.Box (13, 506, 246, 693, 103)
    Draw.FillBox (33, 521, 227, 677, 16)
    for h : 0 .. 1
	for y : 0 .. 1
	    Draw.Line (33 + h * 118 - round (PosX / 10.5), 523 + y * 93 - round (PosY / 12), 33 + h * 118 - round (PosX / 10.5), 533 + y * 93 - round (PosY / 12), 31)
	    Draw.Line (33 + h * 108 - round (PosX / 10.5), 523 + y * 103 - round (PosY / 12), 43 + h * 108 - round (PosX / 10.5), 523 + y * 103 - round (PosY / 12), 31)
	end for
    end for
    if Mx > 13 and My > 506 and Mx < 246 and My < 693 and Mb = 0 then
	Draw.Line (13, My, 246, My, 48)
	Draw.Line (Mx, 506, Mx, 693, 48)
	Draw.Oval (Mx, My, 20, 20, DarkPurple)
    elsif Mx > 13 and My > 506 and Mx < 246 and My < 693 and Mb = 1 then
	Draw.Oval (Mx, My, 20, 20, 53)
	Draw.Line (13, My, Mx - 30, My, 39)
	Draw.Line (Mx, 506, Mx, My - 30, 39)
	Draw.Line (Mx + 30, My, 246, My, 39)
	Draw.Line (Mx, My + 30, Mx, 693, 39)
    end if
end MapCreate

proc FightGUI (Hp, THp, Mana, TMana, Unseal, Speed : real, Class : string, Level : int)
    var CH, CM, UM : int
    CH := round ((Hp / THp) * 100)
    CM := round ((Mana / TMana) * 100)
    UM := round (Unseal / 1.5)
    Draw.FillBox (460, 10, 460 + CH, 17, 86)
    Draw.FillBox (565, 10, 565 + CM, 17, 79)
    Draw.FillBox (670, 10, 670 + UM, 17, 48)
    Draw.FillBox (460, 10, 460 + CH, 12, 111)
    Draw.FillBox (565, 10, 565 + CM, 12, 55)
    Draw.FillBox (670, 10, 670 + UM, 12, 120)
    Draw.Box (460, 10, 560, 17, 31)
    Draw.Box (565, 10, 665, 17, 31)
    Draw.Box (670, 10, 770, 17, 31)
    Font.Draw (realstr (round (Hp), 4) + "/" + realstr (round (THp), 4), 466, 18, Font3, 25)
    Font.Draw (realstr (round (Mana), 4) + "/" + realstr (round (TMana), 4), 571, 18, Font3, 25)
    Font.Draw (realstr (round (Unseal), 4) + "/ 100", 676, 18, Font3, 25)
    Font.Draw (realstr (round (Hp), 4) + "/" + realstr (round (THp), 4), 465, 19, Font3, 112)
    Font.Draw (realstr (round (Mana), 4) + "/" + realstr (round (TMana), 4), 570, 19, Font3, 55)
    Font.Draw (realstr (round (Unseal), 4) + "/ 100", 675, 19, Font3, 120)
end FightGUI

proc BattleReady
    var Drag : boolean := false
    var Distance : int := 1
    var SChar : int
    var SX, SY : int := 1
    for p : 1 .. Party.Size (1)
	Stat.XC (p) := p
	Stat.YC (p) := 1
    end for
    loop
	Mouse.Where (Mx, My, Mb)
	Draw.FillBox (0, 600, maxx, maxy, 5)
	Draw.FillBox (0, 0, maxx, 50, 16)
	for k : 1 .. 15
	    Draw.FillBox (0, 4 * k + 40, maxx, 4 * k + 44, 15 + k)
	end for
	Draw.Box (0, 0, maxx, maxy, 54)
	Draw.Box (1, 1, maxx - 1, maxy - 1, 103)
	Draw.Box (2, 2, maxx - 2, 104, 101)
	Draw.Box (2, 600, maxx - 2, maxy - 2, 103)
	for k : 0 .. 1
	    for p : 0 .. 5
		Draw.FillBox (250 + p * 50, 700 - k * 50, 290 + p * 50, 740 - k * 50, 47)
		Draw.Box (249 + p * 50, 699 - k * 50, 291 + p * 50, 741 - k * 50, 53)
		Draw.Box (252 + p * 50, 702 - k * 50, 288 + p * 50, 738 - k * 50, 103)
	    end for
	end for
	for k : 1 .. 6     % Detect Char Select
	    for p : 0 .. 1
		Draw.Box (200 + (k * 50), 650 + p * 50, 240 + (k * 50), 690 + p * 50, 30)
		Mouse.Where (Mx, My, Mb)
		if Stat.Real (k) = true then
		    Pic.Draw (Stat.Picture (k), 200 + (Stat.XC (k) * 50), 600 + Stat.YC (k) * 50, picCopy)
		    if Mx > Stat.XC (k) * 50 + 200 and Mx < Stat.XC (k) * 50 + 240 and My > Stat.YC (k) * 50 + 600 and My < 640 + Stat.YC (k) * 50 then
			if Mb = 1 and Stat.Real (k) = true and Drag = false then
			    SX := Stat.XC (k)
			    SY := Stat.YC (k)
			    Drag := true
			    SChar := k
			end if
		    end if
		end if
	    end for
	end for
	for k : 1 .. 6     % Detect Char Select
	    for p : 0 .. 1
		if Mx > k * 50 + 200 and Mx < k * 50 + 240 and My > p * 50 + 650 and My < p * 50 + 690 then
		    Draw.Box (200 + (k * 50), 650 + p * 50, 240 + (k * 50), 690 + p * 50, 40)
		end if
	    end for
	end for
	if Drag = true then
	    Pic.Draw (Stat.Picture (SChar), Mx - 20, My - 20, picCopy)
	    if Mb = 0 then
		for l : 1 .. Party.Size (1)
		    Mouse.Where (Mx, My, Mb)
		    if Mx > Stat.XC (l) * 50 + 200 and Mx < Stat.XC (l) * 50 + 240 and My > Stat.YC (l) * 50 + 600 and My < 640 + Stat.YC (l) * 50 then
			Drag := false
		    else
			for m : 1 .. 6
			    for n : 0 .. 1
				Mouse.Where (Mx, My, Mb)
				if Mx > m * 50 + 200 and Mx < m * 50 + 240 and My > 650 + n * 50 and My < 690 + n * 50 then
				    Stat.XC (SChar) := m
				    Stat.YC (SChar) := n + 1
				end if
			    end for
			end for
			Drag := false
		    end if
		end for
	    end if
	end if
	Draw.FillBox (500, 200, 750, 250, Slate)
	Draw.Box (500, 200, 750, 250, 54)
	Draw.Box (499, 199, 751, 251, 78)
	Font.Draw ("Start", 570, 215, Font4, 110)
	Draw.FillBox (50, 200, 300, 250, 30)
	Draw.Box (50, 200, 300, 250, 26)
	Draw.Box (49, 199, 301, 251, 16)
	Font.Draw ("Flee", 120, 215, Font4, 40)
	if Mx > 500 and Mx < 750 and My > 200 and My < 250 then
	    Draw.FillBox (500, 200, 750, 250, 18)
	    Draw.Box (500, 200, 750, 250, 51)
	    Draw.Box (499, 199, 751, 251, 48)
	    Font.Draw ("Start", 570, 215, Font4, 124)
	    if Mb = 1 then
		delay (200)
		exit
	    end if
	elsif Mx > 50 and Mx < 300 and My > 200 and My < 250 then
	    Draw.FillBox (50, 200, 300, 250, 89)
	    Draw.Box (50, 200, 300, 250, 113)
	    Draw.Box (49, 199, 301, 251, 86)
	    Font.Draw ("Flee", 120, 215, Font4, 17)
	    if Mb = 1 then
		Flee := true
		exit
	    end if
	end if
	Cursor (Mx, My, Mb)
	View.Update
	cls
    end loop
    for p : 1 .. Party.Size (1)
	Stat.XC (p) := 10
	Stat.YC (p) := 5
    end for
    for p : Party.Size (1) + Party.Size (3) + 1 .. Party.Size (1) + Party.Size (3) + Party.Size (2)
	Stat.XC (p) := 12
	Stat.YC (p) := p - 2
    end for
end BattleReady

proc MapDesignation (MC : int)
    if MC = 1 then
	for p : 1 .. 40 % Sets Battle
	    for k : 1 .. 30
		GenericInt := Rand.Int (1, 10)
		if GenericInt < 8 then
		    BattleBlock (p, k) := 10
		else
		    BattleBlock (p, k) := 12
		end if
	    end for
	end for
	for k : 10 .. 30
	    for p : 5 .. 25
		GenericInt := Rand.Int (1, 19)
		if GenericInt < 7 then
		    BattleBlock (k, p) := Rand.Int (4, 9)
		else
		    BattleBlock (k, p) := Rand.Int (14, 30)
		end if
	    end for
	end for
    elsif MC = 2 then
    end if
end MapDesignation

proc StartMenuOption
    Draw.Box (20, 120 + 5 * 60, 320, 170 + 5 * 60, 48)
    Draw.Box (22, 122 + 5 * 60, 318, 168 + 5 * 60, 49)
    Font.Draw (SMString (5 + 1), 30, 130 + 5 * 60, Font7, 72)
    Font.Draw ("Sound tracks", 540, 700, Font4, 107)
    Draw.Line (520, 690, 880, 690, 107)
    Draw.Line (521, 689, 881, 689, 28)
    for b : 0 .. 7
	Mouse.Where (Mx, My, Mb)
	Draw.FillBox (560, 580 - b * 70, 780, 630 - b * 70, DarkPurple)
	Draw.Box (560, 580 - b * 70, 780, 630 - b * 70, 37)
	Font.Draw (SongName (b + 1 + SoundList), 570, 590 - b * 70, Font5, 39)
	Draw.Box (600, 50, 740, 70, 40)
	Draw.Box (602, 52, 738, 68, 62)
	Draw.Line (610, 60, 730, 60, 27)
	if Mx > 600 and Mx < 740 and My > 50 and My < 70 then
	    Draw.Box (600, 50, 740, 70, 54)
	    Draw.Box (602, 52, 738, 68, 103)
	    Draw.Line (610, 60, 730, 60, 23)
	    if Mb = 1 then
		Draw.Box (600, 50, 740, 70, 122)
		Draw.Box (602, 52, 738, 68, 49)
		Draw.Line (610, 60, 730, 60, 48)
		if SoundList = 0 then
		    SoundList := 8
		elsif SoundList = 8 then
		    SoundList := 16
		else
		    SoundList := 0
		end if
		delay (120)
	    end if
	end if
	if Mx > 560 and Mx < 780 and My > 580 - b * 70 and My < 630 - b * 70 then
	    Draw.FillBox (560, 580 - b * 70, 780, 630 - b * 70, 16)
	    Draw.Box (560, 580 - b * 70, 780, 630 - b * 70, 48)
	    Font.Draw (SongName (b + 1 + SoundList), 570, 590 - b * 70, Font5, 36)
	    for k : 0 .. 1
		for p : 0 .. 1
		    Draw.Line (555 + (k * 210), 635 - (p * 60) - (b * 70), 575 + (k * 210), 635 - (p * 60) - (b * 70), 53)
		    Draw.Line (555 + (k * 230), 620 - (p * 45) - (b * 70), 555 + (k * 230), 635 - (p * 45) - (b * 70), 53)
		end for
	    end for
	    if Mb = 1 then
		for r : 1 .. 24
		    TrackPlaying (r) := false
		end for
		TrackPlaying (b + 1 + SoundList) := true
		SongPlaying := b + 1 + SoundList
		Music.PlayFileStop
		fork PlayMusic (SongPlaying)
		delay (120)
		exit
	    end if
	end if
    end for
    for m : 1 .. 8
	if TrackPlaying (m + SoundList) = true then
	    Font.Draw (SongName (m + SoundList), 570, 590 - (m - 1) * 70, Font5, TC (m + SoundList))
	end if
    end for
    if SoundList = 0 then
	Draw.Oval (620, 60, 6, 6, 40)
    elsif SoundList = 8 then
	Draw.Oval (670, 60, 6, 6, 47)
    else
	Draw.Oval (720, 60, 6, 6, 54)
    end if
end StartMenuOption
