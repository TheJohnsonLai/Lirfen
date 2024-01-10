% Lirfen - RPG

include "Code\\ImportStart.t"
setscreen ("graphics:800,900")
View.Set ("offscreenonly")

proc Rastas_Bar % RASTA'S BAR %**********************************************%
    delay (200)
    loop
	Mouse.Where (Mx, My, Mb)
	Pic.Draw (Rastas_Bar_Pic, 0, 0, picCopy)
	Draw.FillBox (10, 20, 250, 310, 184)
	for c : 1 .. 5
	    Draw.Box (8 - c, 18 - c, 252 + c, 312 + c, 182 + c)
	end for
	Draw.FillBox (20, 210, 220, 260, 28)
	Draw.FillBox (20, 140, 220, 190, 28)
	Draw.FillBox (20, 70, 220, 120, 28)
	Draw.Box (20, 210, 220, 260, 112)
	Draw.Box (20, 140, 220, 190, 112)
	Draw.Box (20, 70, 220, 120, 112)
	Font.Draw ("Shop", 48, 225, Font4, 42)
	Font.Draw ("Tabs", 48, 155, Font4, 42)
	Font.Draw ("Leave", 48, 85, Font4, 42)
	Draw.FillOval (30, 235, 5, 5, 116)
	Draw.FillOval (30, 165, 5, 5, 116)
	Draw.FillOval (30, 95, 5, 5, 116)
	Draw.Oval (30, 235, 5, 5, 114)
	Draw.Oval (30, 165, 5, 5, 114)
	Draw.Oval (30, 95, 5, 5, 114)
	if Mx > 20 and Mx < 220 then
	    if My > 210 and My < 260 then
		Draw.FillBox (20, 210, 220, 260, 25)
		Draw.Box (20, 210, 220, 260, 49)
		Draw.FillOval (30, 235, 5, 5, 44)
		Draw.Oval (30, 235, 5, 5, 44)
		Font.Draw ("Shop", 50, 225, Font4, 40)
		if Mb = 1 then
		    Item_Class (1, 1) := 1
		end if
	    elsif My > 140 and My < 190 then
		Draw.FillBox (20, 140, 220, 190, 25)
		Draw.FillOval (30, 165, 5, 5, 44)
		Draw.Box (20, 140, 220, 190, 49)
		Draw.Oval (30, 165, 5, 5, 44)
		Font.Draw ("Tabs", 50, 155, Font4, 40)
		if Mb = 1 then
		end if
	    elsif My > 70 and My < 120 then
		Draw.FillBox (20, 70, 220, 120, 25)
		Draw.FillOval (30, 95, 5, 5, 44)
		Draw.Oval (30, 95, 5, 5, 44)
		Draw.Box (20, 70, 220, 120, 49)
		Font.Draw ("Leave", 50, 85, Font4, 40)
		if Mb = 1 then
		    exit
		end if
	    end if
	end if
	for k : 1 .. 10
	    for p : 1 .. 50
		if Item_Class (k, p) > 0 then
		    Draw.FillBox (20, 200, 780, 880, Blue)
		    Draw.Box (19, 199, 781, 881, 177)
		    Draw.Box (20, 200, 780, 880, 125)
		    for i : 0 .. 4
			Draw.Box (120 + i, 210 + i, 770 - i, 850 - i, 27 + i) % Main Box
		    end for
		    for u : 1 .. 10 %  Left Catergory Boxes [ Weapons / Armor ]
			Draw.Box (31, 861 - (65 * u), 119, 914 - (65 * u), 28)
			Draw.Box (30, 860 - (65 * u), 120, 915 - (65 * u), 23)
			Font.Draw (WeaponList (u), 35, 865 - (65 * u), Font6, 55)
			if Mx > 30 and Mx < 120 and My > 860 - (65 * u) and My < 915 - (65 * u) then
			    Font.Draw (WeaponList (u), 35, 865 - (65 * u), Font6, 16)
			    Draw.Box (31, 861 - (65 * u), 119, 914 - (65 * u), 52)
			    Draw.Box (30, 860 - (65 * u), 120, 915 - (65 * u), 54)
			    if Mb = 1 then
			    end if
			end if
		    end for
		    for su : 0 .. 9 %  Top Boxes [ Types - Axes Etc. ]
			Draw.FillBox (120 + (su * 65), 850, 183 + (su * 65), 871, 31)
			Draw.Box (120 + (su * 65), 850, 183 + (su * 65), 871, 24)
			if Mx > 120 + (su * 65) and Mx < 183 + (su * 65) and My > 850 and My < 880 then
			    Draw.FillBox (120 + (su * 65), 850, 183 + (su * 65), 871, 16)
			    Draw.Box (121 + (su * 65), 851, 182 + (su * 65), 870, 31)
			    Draw.Box (120 + (su * 65), 850, 183 + (su * 65), 871, 36)
			    if Mb = 1 then
			    end if
			end if
		    end for
		end if
	    end for
	end for
	Cursor (Mx, My, Mb)
	View.Update
    end loop
end Rastas_Bar

proc Battle_Keushi_Forest (MapChoice : int) % BATTLE PROCEDURE %**********************************************%
    StateVariables
    BattleReady
    MapDesignation (MapChoice)
    FightSize := Party.Size (1) + Party.Size (3) + Party.Size (2)
    loop
	if InBattle = true then
	    exit when Flee = true
	    loop
		for p : 1 .. FightSize
		    if Stat.Real (p) = true and Stat.Hp (p) > 0 then
			Stat.Turn (p) -= 1
			if Stat.Turn (p) <= 0 then
			    CurT := p
			    Fight := true
			    exit
			end if
		    end if
		end for
		exit when Fight = true
	    end loop
	else
	    CurT := 1
	    for Move : 1 .. Party.Size (1)
		Stat.XC (Move) := Stat.XC (CurT)
		Stat.YC (Move) := Stat.YC (CurT)
	    end for
	end if
	exit when Flee = true
	Fight := false
	loop     % Battle Dimensions : (0,100,maxx,700)
	    Mouse.Where (Mx, My, Mb)
	    Input.KeyDown (Pressed)
	    if Pressed (' ') then
		if StartMenu = false then
		    StartMenu := true
		else
		    StartMenu := false
		end if
		delay (150)
	    end if
	    Draw.FillBox (0, 0, maxx, maxy, 78)
	    if StartMenu = false then
		for k : -30 .. 30
		    Draw.Line (-400, k * 40 + 100, 1200, k * 40 + 100, Blue)
		    Draw.Line (k * 40, -300, k * 40, 1200, Blue)
		end for
		for k : 1 .. 40
		    for p : 1 .. 30
			if BattleBlock (k, p) = 1 or BattleBlock (k, p) = 2 then
			    Pic.Draw (TileWater, -40 + k * 40 + PosX, 60 + p * 40 + PosY, picCopy)
			elsif BattleBlock (k, p) = 3 then
			    Pic.Draw (TileBridge, -40 + k * 40 + PosX, 60 + p * 40 + PosY, picCopy)
			elsif BattleBlock (k, p) = 4 or BattleBlock (k, p) = 5 or BattleBlock (k, p) = 6 or BattleBlock (k, p) = 7 then
			    Pic.Draw (TileTree, -40 + k * 40 + PosX, 60 + p * 40 + PosY, picCopy)
			elsif BattleBlock (k, p) = 8 or BattleBlock (k, p) = 9 then
			    Pic.Draw (TileFlower, -40 + k * 40 + PosX, 60 + p * 40 + PosY, picCopy)
			elsif BattleBlock (k, p) = 10 then
			    Pic.Draw (BarrierField, -40 + k * 40 + PosX, 60 + p * 40 + PosY, picCopy)
			elsif BattleBlock (k, p) = 11 then
			    Pic.Draw (BarrierTundra, -40 + k * 40 + PosX, 60 + p * 40 + PosY, picCopy)
			elsif BattleBlock (k, p) = 12 then
			    Pic.Draw (BarrierCliff, -40 + k * 40 + PosX, 60 + p * 40 + PosY, picCopy)
			elsif BattleBlock (k, p) = 13 then
			    Pic.Draw (BarrierWater, -40 + k * 40 + PosX, 60 + p * 40 + PosY, picCopy)
			elsif BattleBlock (k, p) < 20 then
			    Pic.Draw (TileGrass2, -40 + k * 40 + PosX, 60 + p * 40 + PosY, picCopy)
			else
			    Pic.Draw (TileGrass, -40 + k * 40 + PosX, 60 + p * 40 + PosY, picCopy)
			end if
		    end for
		end for
		for k : 1 .. FightSize % Draws characters
		    if Stat.Real (k) = true and Stat.Hp (k) > 0 then
			Pic.Draw (Stat.Picture (k), Stat.XC (k) * 40 - 40 + PosX, Stat.YC (k) * 40 + 60 + PosY, picCopy)
		    end if
		end for
		Draw.Box (0 + PosX, 100 + PosY, 1600 + PosX, 1300 + PosY, BlazeBlue)
		Restrictions (FightSize)
		if InBattle = true then
		    Draw.Box (Stat.XC (1) * 40 - 240 + PosX, Stat.YC (1) * 40 - 140 + PosY, Stat.XC (1) * 40 + 200 + PosX, Stat.YC (1) * 40 + PosY + 300, 40)
		end if
		Draw.FillBox (0, 701, maxx, maxy, 31) % Top Cover
		Draw.Line (0, 100, maxx, 100, 57) % Bottom Line
		Draw.FillBox (0, 0, maxx, 99, 30) % Bottom Cover
		Draw.Box (0, 0, maxx, maxy, 59) % Surround
		Draw.Box (1, 1, maxx - 1, maxy - 1, 151) % Surround
		Draw.Box (10, 10, 210, 90, 111) % Next turn box
		Draw.FillBox (11, 11, 209, 89, 31) % Next turn coverif Action = true and SelectChar = CurT then         % (Button) Action Cat.1
		MapCreate (Mx, My, Mb)
		for Desc : 1 .. 3  % Description Box
		    Draw.FillBox (215 + Desc, 10 + Desc, 445 - Desc, 90 - Desc, 3 - Desc)
		end for
		Draw.Box (215, 10, 445, 90, 108)
		Draw.Line (15, 50, 35, 70, 106) % Current Turn Left
		Draw.Line (15, 50, 35, 30, 108)
		Draw.Line (35, 30, 35, 70, 108)
		Draw.Line (205, 50, 185, 70, 106) % Current Turn Right
		Draw.Line (205, 50, 185, 30, 108)
		Draw.Line (185, 30, 185, 70, 108)
		Draw.Line (2, 700, maxx - 2, 700, DarkPurple) % Top Line Cover
		for p : 1 .. FightSize % Detect Next Turns
		    if Stat.Real (p) = true then
			if Stat.Hp (p) < 0 then
			    Stat.Real (p) := false
			    Stat.Turn (p) := 999
			end if
			if p = 1 and InBattle = false then
			    Stat.Turn (p) := 3
			end if
		    end if
		end for
		for k : 1 .. FightSize % Assign
		    Rotation (k) := Stat.Turn (k)
		    DisplayRotations (k) := k
		end for
		loop % Bubble Sort
		    Order := false
		    for Turn : 2 .. FightSize
			if Rotation (Turn - 1) > Rotation (Turn) then
			    Tis := DisplayRotations (Turn)
			    Tiz := Rotation (Turn)
			    DisplayRotations (Turn) := DisplayRotations (Turn - 1)
			    Rotation (Turn) := Rotation (Turn - 1)
			    DisplayRotations (Turn - 1) := Tis
			    Rotation (Turn - 1) := Tiz
			    Order := true
			else
			end if
		    end for
		    exit when Order = false
		end loop
		for Turns : 1 .. 3 % Display
		    if Stat.Real (DisplayRotations (Turns + Riffle)) = true then
			Pic.Draw (Stat.Picture (DisplayRotations (Turns + Riffle)), Turns * 50 - 10, 30, picCopy)
			if Mx > Turns * 50 - 10 and Mx < Turns * 50 + 30 and My > 30 and My < 70 then
			    Draw.Box (Turns * 50 - 10, 30, Turns * 50 + 30, 70, 35)
			    Draw.Box (Turns * 50 - 12, 28, Turns * 50 + 32, 72, 65)
			    if Mb = 1 then
				PosX := Stat.XC (DisplayRotations (Turns + Riffle)) * -40 + 400
				PosY := Stat.YC (DisplayRotations (Turns + Riffle)) * -40 + 300
				if PosX > 160 then
				    PosX := 160
				elsif PosX < -360 then
				    PosX := -360
				end if
				if PosY > 160 then
				    PosY := 160
				elsif PosY < -360 then
				    PosY := -360
				end if
			    end if
			end if
		    end if
		end for
		if (Mx - 15) * (70 - 50) - (35 - 15) * (My - 50) > 0 and
			(Mx - 35) * (30 - 70) - (35 - 35) * (My - 70) > 0 and (Mx - 35) * (50 - 30) - (15 - 35) * (My - 30) > 0 then
		    Draw.Line (15, 50, 35, 70, 79)     % Current Turn Left
		    Draw.Line (15, 50, 35, 30, 79)
		    Draw.Line (35, 30, 35, 70, 79)
		    if Mb = 1 then
			Riffle -= 1
			delay (70)
		    end if
		elsif (Mx - 205) * (70 - 50) - (185 - 205) * (My - 50) < 0 and
			(Mx - 185) * (30 - 70) - (185 - 185) * (My - 70) < 0 and (Mx - 185) * (50 - 30) - (205 - 185) * (My - 30) < 0 then
		    Draw.Line (205, 50, 185, 70, 79) % Current Turn Right
		    Draw.Line (205, 50, 185, 30, 79)
		    Draw.Line (185, 30, 185, 70, 79)
		    if Mb = 1 then
			Riffle += 1
			delay (70)
		    end if
		end if
		if Riffle < 0 then
		    Riffle := 0
		elsif Riffle > FightSize - 8 then
		    Riffle := FightSize - 8
		end if
	    else
	    end if
	    if InBattle = false then
		for EnemyCheck : Party.Size (1) + Party.Size (3) + 1 .. FightSize
		    if Stat.Real (EnemyCheck) = true then
			if ((Stat.XC (1) * 40 + 20) - (Stat.XC (EnemyCheck) * 40 + 20)) ** 2 + ((Stat.YC (1) * 40 + 80) - (Stat.YC (EnemyCheck) * 40 + 80)) ** 2 <= 78 ** 2 then
			    InBattle := true
			    exit
			end if
		    end if
		end for
	    end if
	    for T : 1 .. FightSize
		exit when StartMenu = true
		if Actions (2) = true or Actions (3) = true or Actions (4) = true and WithinRange = true and Mx > 0 and Mx < 800 and My > 100 and My < 700 then
		    FlipSide := false
		    exit
		elsif Mx > 13 and My > 506 and Mx < 246 and My < 693 and Mb = 1 then
		    MapSelect := true
		    ClickedChar := false
		    FlipSide := true
		    exit
		elsif Stat.Real (T) = true then     % Detect what is clicked
		    if Mx > Stat.XC (CurT) * 40 - 40 + PosX and Mx < Stat.XC (CurT) * 40 + PosX and Stat.YC (CurT) * 40 + 60 + PosY < My and Stat.YC (CurT) * 40 + 100 + PosY > My then
			Draw.Box (Stat.XC (CurT) * 40 - 40 + PosX, Stat.YC (CurT) * 40 + 60 + PosY, Stat.XC (CurT) * 40 + PosX, Stat.YC (CurT) * 40 + 100 + PosY, 35)
			if Mb = 1 then
			    % if char selected
			    ClickedChar := true
			    SelectChar := CurT
			    FlipSide := false
			    exit
			end if
		    elsif Mx > Stat.XC (T) * 40 - 40 + PosX and Mx < Stat.XC (T) * 40 + PosX and Stat.YC (T) * 40 + 60 + PosY < My and Stat.YC (T) * 40 + 100 + PosY > My then
			if Stat.Team (T) = 1 then
			    Draw.Box (Stat.XC (T) * 40 - 40 + PosX, Stat.YC (T) * 40 + 60 + PosY, Stat.XC (T) * 40 + PosX, Stat.YC (T) * 40 + 100 + PosY, 55)
			elsif Stat.Team (T) = 2 then
			    Draw.Box (Stat.XC (T) * 40 - 40 + PosX, Stat.YC (T) * 40 + 60 + PosY, Stat.XC (T) * 40 + PosX, Stat.YC (T) * 40 + 100 + PosY, 50)
			elsif Stat.Team (T) = 3 then
			    Draw.Box (Stat.XC (T) * 40 - 40 + PosX, Stat.YC (T) * 40 + 60 + PosY, Stat.XC (T) * 40 + PosX, Stat.YC (T) * 40 + 100 + PosY, 40)
			end if
			if Mb = 1 then
			    % if char selected
			    ClickedChar := true
			    SelectChar := T
			    FlipSide := false
			    exit
			end if
		    elsif Mb = 1 and Mx > 0 and Mx < 800 and My > 100 and My < 700 and MovingInAction = false then     % If map selected
			Draw.Oval (Mx, My, 60, 60, 30)
			ClickedChar := false
			FlipSide := true
		    end if
		end if
	    end for
	    if FlipSide = true and StartMenu = false and MapSelect = false then
		PosX += Mx - Dx
		PosY += My - Dy
		Burst := false
		Action := false
	    elsif FlipSide = true and StartMenu = false and MapSelect = true then
		PosX += round ((Dx - Mx) * 6)
		PosY += round ((Dy - My) * 5)
		Burst := false
		Action := false
	    end if
	    if Mx > 215 and Mx < 445 and My > 10 and My < 90 and Mb = 1 then
		Draw.Box (215, 10, 445, 90, 5)
		Action := false
		Burst := false
	    end if
	    if ClickedChar = true then     % If char is selected;
		Draw.Box (Stat.XC (SelectChar) * 40 - 40 + PosX, Stat.YC (SelectChar) * 40 + 60 + PosY, Stat.XC (SelectChar) * 40 + PosX, Stat.YC (SelectChar) * 40 + PosY + 100, 116)
		Draw.Box (Stat.XC (SelectChar) * 40 - 41 + PosX, Stat.YC (SelectChar) * 40 + 59 + PosY, Stat.XC (SelectChar) * 40 + PosX + 1, Stat.YC (SelectChar) * 40 + PosY + 101, 45)
		Draw.Box (456, 44, 505, 94, 26)
		Pic.Draw (Stat.Avatar (SelectChar), 455, 45, picCopy)
		FightGUI (Stat.Hp (SelectChar), Stat.THp (SelectChar), Stat.Mana (SelectChar), Stat.TMana (SelectChar), Stat.Unseal (SelectChar), Stat.Speed (SelectChar), Stat.Class (SelectChar),
		    Stat.Level (SelectChar))
		Font.Draw (Stat.Name (SelectChar), 511, 69, Font5, 25)
		if Stat.Team (SelectChar) = 1 then
		    Font.Draw (Stat.Name (SelectChar), 510, 70, Font5, BlazeBlue)
		    Draw.Line (508, 60, 725, 60, 54)
		    Draw.Line (509, 59, 726, 59, 27)
		elsif Stat.Team (SelectChar) = 2 then
		    Font.Draw (Stat.Name (SelectChar), 510, 70, Font5, 120)
		    Draw.Line (508, 60, 725, 60, 122)
		    Draw.Line (509, 59, 726, 59, 27)
		elsif Stat.Team (SelectChar) = 3 then
		    Font.Draw (Stat.Name (SelectChar), 510, 70, Font5, 41)
		    Draw.Line (508, 60, 725, 60, 111)
		    Draw.Line (509, 59, 726, 59, 27)
		else
		end if
		if Stat.Team (CurT) = 1 and SelectChar = CurT then     % If it is your character
		    Draw.Box (10, 830, 210, 880, 27)
		    Draw.Box (12, 832, 208, 878, 101)
		    Font.Draw ("Burst", 50, 840, Font4, 124)
		    Draw.Box (10, 770, 210, 820, 27)
		    Draw.Box (12, 772, 208, 818, 101)
		    Font.Draw ("Action", 50, 780, Font4, 124)
		    Draw.Box (10, 710, 210, 760, 27)
		    Draw.Box (12, 712, 208, 758, 101)
		    Font.Draw ("Wait", 50, 720, Font4, 124)
		end if
		if Stat.Team (CurT) = 1 and SelectChar = CurT then
		    if Mx > 10 and Mx < 210 and My > 830 and My < 880 then
			Draw.Box (10, 830, 210, 880, 56)
			Font.Draw ("Burst", 50, 840, Font4, 57)
			Draw.Box (12, 832, 208, 878, 34)
			if Mb = 1 and Moved = false then
			    if Burst = true then
				Burst := false
			    else
				Burst := true
			    end if
			    Action := false
			    delay (125)
			end if
		    elsif Mx > 10 and Mx < 210 and My > 770 and My < 820 then
			Draw.Box (10, 770, 210, 820, 56)
			Draw.Box (12, 772, 208, 818, 34)
			Font.Draw ("Action", 50, 780, Font4, 57)
			if Mb = 1 and Acted = false and InBattle = true then
			    if Action = false then
				Action := true
			    else
				Action := false
			    end if
			    Burst := false
			    delay (125)
			end if
		    elsif Mx > 10 and Mx < 210 and My > 710 and My < 760 then
			Draw.Box (10, 710, 210, 760, 56)
			Draw.Box (12, 712, 208, 758, 34)
			Font.Draw ("Wait", 50, 720, Font4, 57)
			if Mb = 1 then
			    Rest := true
			end if
		    end if
		end if
		MovingInAction := false
		if Burst = true and Moved = false and Stat.Team (CurT) = 1 and SelectChar = CurT then         % If Burst is selected
		    MovingInAction := true
		    Draw.FillBox (11, 831, 209, 879, 29)
		    Draw.Box (10, 830, 210, 880, 56)
		    Font.Draw ("Burst", 50, 840, Font4, 57)
		    Draw.Box (12, 832, 208, 878, 34)
		    for k : 1 .. 40
			for p : 1 .. 30
			    if (((Stat.XC (CurT) * 40 - 20) - (k * 40 - 20)) ** 2) + (((Stat.YC (CurT) * 40 + 80) - (p * 40 + 80)) ** 2) <= (Stat.Burst (CurT) * 40) ** 2 and
				    k * 40 - 40 + PosX > 0 and p * 40 + 60 + PosY > 100 and k * 40 + PosX < 800 and p * 40 + 100 + PosY < 700 then
				Draw.Box (k * 40 - 40 + PosX, p * 40 + 60 + PosY, k * 40 + PosX, p * 40 + 100 + PosY, 116)
				Draw.Box (k * 40 - 39 + PosX, p * 40 + 61 + PosY, k * 40 + PosX - 1, p * 40 + 99 + PosY, 44)
				if Mx > k * 40 - 40 + PosX and Mx < k * 40 + PosX and My > p * 40 + 60 + PosY and My < p * 40 + 100 + PosY then
				    Draw.Box (k * 40 - 40 + PosX, p * 40 + 60 + PosY, k * 40 + PosX, p * 40 + 100 + PosY, 55)
				    Draw.Box (k * 40 - 39 + PosX, p * 40 + 61 + PosY, k * 40 + PosX - 1, p * 40 + 99 + PosY, 52)
				    if Mb = 1 then
					for Check : 1 .. FightSize
					    if Stat.Real (Check) = true and Check not= CurT then
						if k = Stat.XC (CurT) and p = Stat.YC (CurT) or k = Stat.XC (Check) and p = Stat.YC (Check) then
						    Cancel := true
						    exit
						elsif BattleBlock (k, p) = 10 or BattleBlock (k, p) = 11 or BattleBlock (k, p) = 12 or BattleBlock (k, p) = 13 then
						    Cancel := true
						    exit
						end if
					    end if
					end for
					exit when Cancel = true
					Advant (1) := (k * 40) - (Stat.XC (CurT) * 40)
					Advant (2) := (p * 40) - (Stat.YC (CurT) * 40)
					for decreasing Shakugan : 10 .. 1
					    Draw.Line (Stat.XC (CurT) * 40 - 20 + PosX, Stat.YC (CurT) * 40 + 80 + PosY, Stat.XC (CurT) * 40 - 20 + (Advant (1) div Shakugan) + PosX,
						Stat.YC (CurT) * 40 + 80 + (Advant (2) div Shakugan) + PosY, 37)
					    Draw.Oval (Stat.XC (CurT) * 40 - 20 + (Advant (1) div Shakugan) + PosX, Stat.YC (CurT) * 40 + 60 + 20 + (Advant (2) div Shakugan) + PosY, 2, 2, 54)
					    Cursor (Mx, My, Mb)
					    View.Update
					    delay (69)
					    FirstNo := true
					    Moved := true
					end for
					Stat.XC (CurT) := k
					Stat.YC (CurT) := p
					exit
				    end if
				end if
			    end if
			    exit when Moved = true or Cancel = true
			end for
			exit when Moved = true or Cancel = true
		    end for
		elsif Action = true and Acted = false and Stat.Team (CurT) = 1 and SelectChar = CurT then         % If Action is selected
		    Draw.FillBox (11, 771, 209, 819, 29)
		    Draw.Box (10, 770, 210, 820, 56)
		    Draw.Box (12, 772, 208, 818, 34)
		    Font.Draw ("Action", 50, 780, Font4, 57)
		    Draw.Line (210, 795, 220, 795, 123)
		    for Skill : 0 .. 4
			var CC1 : int := 27
			var CC2 : int := 101
			Mouse.Where (Mx, My, Mb)
			if Mx > 220 and My > 854 - (36 * Skill) and Mx < 420 and My < 890 - (36 * Skill) then
			    CC1 := 34
			    CC2 := 56
			end if
			if Mb = 1 and Mx > 220 and My > 854 - (36 * Skill) and Mx < 420 and My < 890 - (36 * Skill) then
			    for k : 1 .. 5
				AMSUI (k) := false
				Actions (k) := false
			    end for
			    AMSUI (Skill + 1) := true
			end if
			Draw.Box (220, 854 - (36 * Skill), 420, 890 - (36 * Skill), CC1)
			Draw.Box (222, 856 - (36 * Skill), 418, 888 - (36 * Skill), CC2)
		    end for
		    for Intake : 1 .. 5         % Draw Attack magic Unseal etc
			Mouse.Where (Mx, My, Mb)
			if AMSUI (Intake) = true then
			    Draw.Line (420, 872 - ((Intake - 1) * 36), 430, 872 - ((Intake - 1) * 36), 123)
			    for Skill : 0 .. 4
				var CC1 : int := 27
				var CC2 : int := 101        % Draw Attack sub categories
				if Mx > 430 and My > 854 - (36 * Skill) and Mx < 630 and My < 890 - (36 * Skill) then
				    CC1 := 34
				    CC2 := 56
				    if Mb = 1 then         % Actions (Whip,Slice) Activation
					for k : 1 .. 5
					    Actions (k) := false
					end for
					Actions (Skill + 1) := true         % Action taken activates / button pressed
					delay (66)
				    end if
				end if
				if Skill = 0 or Skill = 4 then
				    CC1 += 3
				    CC2 += 1
				end if
				Draw.Box (430, 854 - (36 * Skill), 630, 890 - (36 * Skill), CC1)
				Draw.Box (432, 856 - (36 * Skill), 628, 888 - (36 * Skill), CC2)
			    end for
			end if
		    end for
		end if
		if Action = true and Stat.Team (CurT) = 1 and SelectChar = CurT then
		    for k : 1 .. 5             % (Button) Action Cat.2 - Skills,Magic,Unseal,Item,Attack
			Mouse.Where (Mx, My, Mb)
			Font.Draw (AMSUIString (k), 250, 900 - (36 * k), Font5, 124)
			if AMSUI (k) = true then         % Determines if attack,skill,magic list appears
			    Draw.FillBox (221, 891 - (36 * k), 419, 925 - (36 * k), 30)         % Highlights dark
			    Draw.Box (220, 890 - (36 * k), 420, 926 - (36 * k), 34)         % Highlights
			    Draw.Box (222, 892 - (36 * k), 418, 924 - (36 * k), 56)         % Highlights
			    Font.Draw (AMSUIString (k), 250, 900 - (36 * k), Font5, 53)
			    Draw.Line (450, 872, 610, 872, 29)
			    Draw.Line (450, 728, 610, 728, 29)
			    if Actions (1) = true then
				SelectSkill -= 1
				Actions (1) := false
				if SelectSkill < 1 then
				    SelectSkill := 1
				end if
				delay (66)
			    elsif Actions (5) = true then
				SelectSkill += 1
				Actions (5) := false
				if SelectSkill > 47 then
				    SelectSkill := 47
				end if
				delay (66)
			    elsif Actions (2) = true or Actions (3) = true or Actions (4) = true then
				for r : 2 .. 4
				    if Actions (r) = true then
					Draw.Box (430, 854 - (36 * (r - 1)), 630, 890 - (36 * (r - 1)), 57)
					Draw.Box (432, 856 - (36 * (r - 1)), 628, 888 - (36 * (r - 1)), 50)
					if Stat.Skills (CurT, r - 2 + SelectSkill) > 0 then
					    SkillCast (k, r - 2 + SelectSkill, FightSize)
					end if
				    end if
				end for
			    end if
			end if
		    end for
		    if AMSUI (1) = true then     % Draws Text List Actions
			if SelectSkill > 4 then
			    SelectSkill := 4
			end if
			for p : 2 .. 4
			    Font.Draw (Attackstring (p - 2 + SelectSkill), 450, 864 - ((p - 1) * 36), Font5, 53)
			end for
		    elsif AMSUI (2) = true then
			for p : 2 .. 4
			    Font.Draw (Magicstring (p - 2 + SelectSkill), 450, 864 - ((p - 1) * 36), Font5, 120)
			end for
		    elsif AMSUI (3) = true then
			for p : 2 .. 4
			    Font.Draw (Skillstring (p - 2 + SelectSkill), 450, 864 - ((p - 1) * 36), Font5, 79)
			end for
		    elsif AMSUI (4) = true then
			if SelectSkill > 8 then
			    SelectSkill := 8
			end if
			for p : 2 .. 4
			    Font.Draw (Unsealstring (p - 2 + SelectSkill), 450, 864 - ((p - 1) * 36), Font5, 37)
			end for
		    elsif AMSUI (5) = true then
			for p : 2 .. 4
			    Font.Draw (Itemstring (p - 2 + SelectSkill), 450, 864 - ((p - 1) * 36), Font5, 111)
			end for
		    end if
		end if
	    end if
	    if Rest = true then             % If Wait is selected
		exit
	    end if
	    if Moved = true and SelectChar = CurT and ClickedChar = true then
		Draw.FillBox (11, 831, 209, 879, 16)
		Draw.Box (10, 830, 210, 880, 122)
		Font.Draw ("Burst", 50, 840, Font4, 56)
		Draw.Box (12, 832, 208, 878, 47)
	    end if
	    if Acted = true and SelectChar = CurT and ClickedChar = true then
		for r : 1 .. 5
		    Actions (r) := false
		end for
		Action := false
		Draw.FillBox (11, 771, 209, 819, 16)
		Draw.Box (10, 770, 210, 820, 122)
		Draw.Box (12, 772, 208, 818, 47)
		Font.Draw ("Action", 50, 780, Font4, 39)
	    end if
	    if Stat.Team (CurT) = 3 and StartMenu = false then
		if Stat.Class (CurT) = "Swords" then
		    GenericInt := Rand.Int (1, 2)
		    if GenericInt = 2 then
			for Pers : 1 .. FightSize
			    if Stat.Real (Pers) = true then
				if (Stat.XC (Pers) - Stat.XC (CurT)) ** 2 + (Stat.YC (Pers) - Stat.YC (CurT)) ** 2 <= Stat.Burst (CurT) ** 2 + 4 then
				    if Stat.XC (CurT) - Stat.XC (Pers) > 0 then
					Stat.XC (CurT) -= Rand.Int (0, Stat.Burst (CurT))
				    else
					Stat.XC (CurT) += Rand.Int (0, Stat.Burst (CurT))
				    end if
				    if Stat.YC (CurT) - Stat.YC (Pers) > 0 then
					Stat.YC (CurT) -= Rand.Int (0, Stat.Burst (CurT))
				    else
					Stat.YC (CurT) += Rand.Int (0, Stat.Burst (CurT))
				    end if
				else
				    if Stat.XC (CurT) - Stat.XC (1) > 0 then
					Stat.XC (CurT) -= Rand.Int (0, Stat.Burst (CurT))
				    else
					Stat.XC (CurT) += Rand.Int (0, Stat.Burst (CurT))
				    end if
				    if Stat.YC (CurT) - Stat.YC (1) > 0 then
					Stat.YC (CurT) -= Rand.Int (0, Stat.Burst (CurT))
				    else
					Stat.YC (CurT) += Rand.Int (0, Stat.Burst (CurT))
				    end if
				end if
				exit
			    end if
			end for
		    else
			for decreasing Pers : FightSize .. 1
			    if Stat.Real (Pers) = true then
				if (Stat.XC (Pers) - Stat.XC (CurT)) ** 2 + (Stat.YC (Pers) - Stat.YC (CurT)) ** 2 <= Stat.Burst (CurT) ** 2 + 4 then
				    if Stat.XC (CurT) - Stat.XC (Pers) > 0 then
					Stat.XC (CurT) -= Rand.Int (0, Stat.Burst (CurT))
				    else
					Stat.XC (CurT) += Rand.Int (0, Stat.Burst (CurT))
				    end if
				    if Stat.YC (CurT) - Stat.YC (Pers) > 0 then
					Stat.YC (CurT) -= Rand.Int (0, Stat.Burst (CurT))
				    else
					Stat.YC (CurT) += Rand.Int (0, Stat.Burst (CurT))
				    end if
				end if
			    else
				if Stat.XC (CurT) - Stat.XC (1) > 0 then
				    Stat.XC (CurT) -= Rand.Int (0, Stat.Burst (CurT))
				else
				    Stat.XC (CurT) += Rand.Int (0, Stat.Burst (CurT))
				end if
				if Stat.YC (CurT) - Stat.YC (1) > 0 then
				    Stat.YC (CurT) -= Rand.Int (0, Stat.Burst (CurT))
				else
				    Stat.YC (CurT) += Rand.Int (0, Stat.Burst (CurT))
				end if
			    end if
			    exit
			end for
		    end if
		end if
		for k : 1 .. FightSize
		    if Stat.Real (k) = true then
			if Stat.XC (CurT) - Stat.XC (k) < 2 and Stat.XC (CurT) - Stat.XC (k) > -2 and Stat.YC (CurT) - Stat.XC (k) < 2 and Stat.YC (CurT) - Stat.XC (k) > -2 then
			    Stat.Hp (k) -= Stat.Attack (CurT) + Stat.Defense (k)
			    Rest := true
			    exit
			end if
		    end if
		end for
		exit
	    end if
	    if StartMenu = true then
		Draw.FillBox (0, 750, 800, maxy, Slate)
		Draw.FillBox (0, 0, 800, 750, 16)
		Draw.Box (3, 752, 796, maxy - 3, HardBlue)
		Font.Draw ("Paused", 50, 830, Font4, 40)
		for m : 0 .. 9
		    Draw.Box (20, 120 + m * 60, 320, 170 + m * 60, 52)
		    Draw.Box (22, 122 + m * 60, 318, 168 + m * 60, 52)
		    Font.Draw (SMString (m + 1), 30, 130 + m * 60, Font7, Slate)
		    if Mx > 20 and Mx < 320 and My > 120 + m * 60 and My < 170 + m * 60 then
			Draw.Box (20, 120 + m * 60, 320, 170 + m * 60, 48)
			Draw.Box (22, 122 + m * 60, 318, 168 + m * 60, 49)
			Font.Draw (SMString (m + 1), 30, 130 + m * 60, Font7, 72)
			if Mb = 1 then
			    if m = 5 then
				StartOption := true
				SettingsPrepare
				delay (100)
			    elsif m = 6 then
				StartMenu := false
			    end if
			end if
		    end if
		end for
		if StartOption = true then
		    StartMenuOption
		end if
		for k : 0 .. 1
		    Draw.Box (0 + k, 0 + k, maxx - k, maxy - k, 177 - k * 120)
		end for
	    end if
	    Cursor (Mx, My, Mb)
	    View.Update
	    cls
	    Dx := Mx
	    Dy := My
	    Win := true
	    Lose := true
	    for Win_ : 1 .. Party.Size (1)
		if Stat.Hp (Win_) > 0 then
		    Lose := false
		end if
	    end for
	    for Lose_ : Party.Size (1) + Party.Size (3) + 1 .. FightSize
		if Stat.Hp (Lose_) > 0 then
		    Win := false
		end if
	    end for
	    if Lose = true then
		InBattle := false
		exit
	    elsif Win = true then
		InBattle := false
		exit
	    end if
	end loop
	if FirstNo = false then
	    Stat.Turn (CurT) := Stat.Speed (CurT) - 25
	else
	    Stat.Turn (CurT) := Stat.Speed (CurT)
	end if
	Stat.Mana (CurT) += round (Stat.TMana (CurT) / 10)
	Stat.Unseal (CurT) += 10
	CS := 1
	Order := false
	Burst := false
	Action := false
	Rest := false
	Moved := false
	Acted := false
	FirstNo := false
	ClickedChar := false
	WithinRange := false
	Attack := false
	Magic := false
	Skills := false
	Unseal := false
	Item := false
	for r : 1 .. 5
	    AMSUI (r) := false
	end for
	for r : 1 .. 5
	    Actions (r) := false
	end for
    end loop
    Flee := false
end Battle_Keushi_Forest

proc PartyList % Party room
    CurT := 1
    PLS := 0
    loop
	Pic.Draw (PartyScreen, 0, 0, picCopy)
	Draw.FillBox (20, 420, 320, 780, BlazeBlue) %Top Left - Char Stats
	Draw.FillBox (20, 400, 320, 120, BlazeBlue) % Bottom Left - Char options
	Draw.FillBox (380, 120, 780, 780, BlazeBlue) % Right - Gearing
	Draw.FillBox (20, 800, 330, 880, Sky) % Leftside Top - Menu / World
	Draw.FillBox (330, 800, 780, 880, BlazeBlue) % Rightside Top - Char select
	Draw.Box (20, 420, 320, 780, 49)
	Draw.Box (20, 400, 320, 120, 49)
	Draw.Box (380, 120, 780, 780, 49)
	Draw.Box (20, 800, 330, 880, 47)
	Draw.Box (330, 800, 780, 880, 51)
	Pic.Draw (WorldMapExit, 260, 815, picCopy)     % Exit button
	Draw.Box (262, 817, 318, 873, 40)
	Draw.Box (260, 815, 320, 875, 40)
	Draw.Box (335, 810, 355, 870, 26)     % Left
	Draw.Box (755, 810, 775, 870, 26)     % Right
	% Additionals
	Draw.Line (25, 700, 260, 700, 26)
	Mouse.Where (Mx, My, Mb)
	if Stat.Real (CurT) = true then % Draw stats
	    for Detect : 1 .. 9
		if Mx > 25 and Mx < 230 and My > 695 - (Detect * 30) and My < 715 - (Detect * 30) then
		    Draw.FillBox (26, 695 - Detect * 30, 229, 717 - Detect * 30, 65)
		    Draw.Box (26, 695 - Detect * 30, 229, 717 - Detect * 30, 40)
		    Font.Draw (StatString (Detect), 20, 60, Font1, 54)
		end if
	    end for
	    Font.Draw (Stat.Name (CurT), 31, 749, Font7, 26)
	    Font.Draw (Stat.Name (CurT), 30, 750, Font7, 176)
	    Font.Draw ("Class: " + Stat.Class (CurT), 30, 670, Font5, 54)
	    Font.Draw ("Race: " + Stat.Race (CurT), 30, 640, Font5, 55)
	    Font.Draw ("Life: " + realstr (Stat.Hp (CurT), 5) + "/" + realstr (Stat.THp (CurT), 5), 30, 610, Font5, 121)
	    Font.Draw ("Mana: " + realstr (Stat.Mana (CurT), 4) + "/" + realstr (Stat.TMana (CurT), 4), 30, 580, Font5, 120)
	    Font.Draw ("Attack: " + realstr (Stat.Attack (CurT), 4), 30, 550, Font5, 111)
	    Font.Draw ("M.Attack: " + realstr (Stat.M_Attack (CurT), 4), 30, 520, Font5, 111)
	    Font.Draw ("Defense: " + realstr (Stat.Defense (CurT), 4), 30, 490, Font5, 16)
	    Font.Draw ("M.Defense: " + realstr (Stat.M_Defense (CurT), 4), 30, 460, Font5, 16)
	    Font.Draw ("Speed: " + intstr (Stat.Speed (CurT)), 30, 430, Font5, 42)
	    % Bottom Left
	    Font.Draw ("Gear", 30, 370, Font5, 16)
	    Font.Draw ("Gear", 30, 340, Font5, 16)
	    Font.Draw ("Gear", 30, 310, Font5, 16)
	    Font.Draw ("Gear", 30, 280, Font5, 16)
	    Font.Draw ("Gear", 30, 250, Font5, 16)
	    Font.Draw ("Gear", 30, 220, Font5, 16)
	    Font.Draw ("Gear", 30, 190, Font5, 16)
	    Font.Draw ("Gear", 30, 160, Font5, 16)
	    Font.Draw ("Gear", 30, 130, Font5, 16)
	end if
	if Mx > 335 and Mx < 355 and My > 810 and My < 870 then
	    Draw.Box (335, 810, 355, 870, DarkPurple)     % Left
	    if Mb = 1 then
		PLS -= 1
		delay (110)
	    end if
	elsif Mx > 755 and Mx < 775 and My > 810 and My < 870 then
	    Draw.Box (755, 810, 775, 870, DarkPurple)     % Right
	    if Mb = 1 then
		PLS += 1
		delay (110)
	    end if
	end if
	PRestrictions
	if Mx > 260 and Mx < 320 and My > 815 and My < 875 then     % Exit
	    Draw.Box (262, 817, 318, 873, 121)
	    Draw.Box (260, 815, 320, 875, 122)
	    Draw.Line (260, My, 320, My, 49)
	    Draw.Line (Mx, 815, Mx, 875, 49)
	    if Mb = 1 then
		PosX := (Mx - 15 - 260) * -2666 div 100
		PosY := ((My - 16 - 815) * -2666 div 100)
		delay (100)
		exit
	    end if
	end if
	for k : 1 .. Party.Size (1)
	    if Stat.Real (k + PLS) = true then
		Pic.Draw (Stat.Picture (k + PLS), 325 + (k * 60), 820, picCopy)
	    else
		Draw.FillBox (325 + (k * 60), 820, 365 + k * 60, 860, 27)
	    end if
	    if Mx > 325 + (k * 60) and Mx < 365 + (k * 60) and My > 820 and My < 860 then
		Draw.Box (325 + (k * 60), 820, 365 + (k * 60), 860, 35)
		Draw.Box (324 + (k * 60), 819, 366 + (k * 60), 861, 59)
		if Mb = 1 then
		    CurT := k + PLS
		end if
	    else
		Draw.Box (325 + (k * 60), 820, 365 + (k * 60), 860, 33)
		Draw.Box (324 + (k * 60), 819, 366 + (k * 60), 861, 53)
	    end if
	end for
	Cursor (Mx, My, Mb)
	View.Update
	cls
    end loop
end PartyList

proc SaveGame
    delay (200)
    var Saves : int := -1
    loop
	Mouse.Where (Mx, My, Mb)
	Draw.FillBox (0, 0, maxx, maxy, 16)
	Draw.Box (1, 1, maxx - 1, maxy - 1, Slate)
	Draw.Box (2, 2, maxx - 2, maxy - 2, Sky)
	for s : 0 .. 3
	    if Mx > 50 and Mx < 450 and My > 650 - 200 * s and My < 800 - 200 * s then
		Draw.FillBox (50, 650 - 200 * s, 450, 800 - 200 * s, 178)
		Draw.Oval (250, 725 - 200 * s, 60, 60, 111)
		Draw.Oval (325, 711 - 200 * s, 30, 30, 62)
		Draw.Box (50, 650 - 200 * s, 450, 800 - 200 * s, BlazeBlue)
		Draw.Box (53, 653 - 200 * s, 447, 797 - 200 * s, BlazeBlue)
		Font.Draw ("Profile " + intstr (s + 1), 100, 700 - 200 * s, Font4, HardBlue)
		Draw.Line (80, 690 - 200 * s, 420, 690 - 200 * s, BlazeBlue)
		Draw.Line (40, 725 - 200 * s, 50, 725 - 200 * s, Blue)
		Draw.Line (450, 725 - 200 * s, 460, 725 - 200 * s, Blue)
		Draw.Line (250, 800 - 200 * s, 250, 810 - 200 * s, Blue)
		Draw.Line (250, 640 - 200 * s, 250, 650 - 200 * s, Blue)
		Draw.Box (40, 640 - 200 * s, 460, 810 - 200 * s, 58)
		if Mb = 1 then
		    Saves := s
		end if
	    else
		Draw.FillBox (50, 650 - 200 * s, 450, 800 - 200 * s, DarkPurple)
		Draw.Box (50, 650 - 200 * s, 450, 800 - 200 * s, 53)
		Draw.Box (53, 653 - 200 * s, 447, 797 - 200 * s, 53)
		Font.Draw ("Profile " + intstr (s + 1), 100, 700 - 200 * s, Font4, Slate)
		Draw.Line (80, 690 - 200 * s, 420, 690 - 200 * s, 31)
	    end if
	end for
	Draw.Box (10, 10, maxx - 10, maxy - 10, 31)
	Draw.Line (10, 815, maxx - 10, 815, Slate)
	Draw.Box (50, 830, 350, 870, 39)
	Draw.Box (450, 830, 750, 870, 39)
	Draw.FillBox (55, 835, 197, 865, 17)
	Draw.FillBox (203, 835, 345, 865, 17)
	Draw.Box (55, 835, 197, 865, 64)
	Draw.Box (203, 835, 345, 865, 64)
	Font.Draw ("Select Up", 65, 845, Font6, 30)
	Font.Draw ("Select Down", 213, 845, Font6, 30)
	Font.Draw (" Settings", 520, 840, Font7, 57)
	if Mx > 450 and Mx < 750 and My > 830 and My < 870 then
	    Draw.FillBox (450, 830, 750, 870, 176)
	    Draw.Box (450, 830, 750, 870, 113)
	    Font.Draw (" Settings", 520, 840, Font7, 36)
	    if Mb = 1 then
		delay (100)
		exit
	    end if
	elsif Mx > 55 and Mx < 197 and My > 835 and My < 865 then
	    Draw.Line (51, 869, 54, 866, 31)
	    Draw.Line (51, 831, 54, 834, 31)
	    Draw.FillBox (55, 835, 197, 865, 177)
	    Draw.Box (55, 835, 197, 865, 79)
	    Font.Draw ("Select Up", 65, 845, Font6, Sky)
	elsif Mx > 203 and Mx < 345 and My > 835 and My < 865 then
	    Draw.Line (346, 866, 349, 869, 31)
	    Draw.Line (346, 834, 349, 831, 31)
	    Draw.FillBox (203, 835, 345, 865, 177)
	    Draw.Box (203, 835, 345, 865, 79)
	    Font.Draw ("Select Down", 213, 845, Font6, Sky)
	end if
	for s : 0 .. 3
	    if Saves = s then
		Filex := Files (s)
		open : stream, Filex, write
		write : stream, Filex
		delay (200)
		Saves := -1
		close : stream
		exit
	    end if
	end for
	Cursor (Mx, My, Mb)
	View.Update
	cls
    end loop
end SaveGame

proc Settings
    SoundList := 0
    SettingsPrepare
    var ClickedSong : boolean := false
    loop
	Mouse.Where (Mx, My, Mb)
	Pic.Draw (SettingsScreen, 0, 0, picCopy)
	Draw.FillBox (0, 0, maxx, 40, 16)
	Font.Draw ("Settings", 30, 850, Font4, 34)
	for k : 0 .. 3
	    Draw.FillBox (149, 469 - k * 80, 451, 541 - k * 80, 16)
	    Draw.Box (149, 469 - k * 80, 451, 541 - k * 80, 51)
	    Draw.Box (150, 470 - k * 80, 450, 540 - k * 80, 52)
	    Font.Draw (OptString (k + 1), 170, 490 - (k * 80), Font4, 24)
	    Draw.Line (155, 475 - k * 80, 445, 475 - k * 80, 50)
	end for
	for m : 1 .. 4
	    if Mx > 150 and Mx < 450 and My > 460 - (m - 1) * 80 and My < 540 - (m - 1) * 80 then
		Draw.FillBox (149, 469 - (m - 1) * 80, 451, 541 - (m - 1) * 80, 24)
		Draw.Box (149, 469 - (m - 1) * 80, 451, 541 - (m - 1) * 80, 51)
		Draw.Box (150, 470 - (m - 1) * 80, 450, 540 - (m - 1) * 80, 53)
		Draw.Line (155, 475 - (m - 1) * 80, 445, 475 - (m - 1) * 80, 103)
		Font.Draw (OptString (m), 170, 490 - (m - 1) * 80, Font4, 79)
		if m = 1 then
		    Font.Draw (" Select the soundtrack you want to play.", 20, 14, Font3, BlazeBlue)
		elsif m = 2 then
		    Font.Draw (" Play cutscenes you have previously viewed.", 20, 14, Font3, Blue)
		elsif m = 3 then
		    Font.Draw (" Save your current progress. ", 20, 14, Font3, Sky)
		elsif m = 4 then
		    Font.Draw (" Go back to the world map.", 20, 14, Font3, Brown)
		end if
		if Mb = 1 then
		    if m = 4 then
			Exiting := true
			SoundTrack := false
			exit
		    elsif m = 3 then
			SoundTrack := false
			SaveGame
		    elsif m = 2 then
			SoundTrack := false
			put "Eh?"
		    elsif m = 1 then
			SoundTrack := true
			exit
		    end if
		end if
	    end if
	end for
	if SoundTrack = true then % Soundtrack clicked
	    Draw.FillBox (150, 470, 450, 540, DarkPurple)
	    Draw.Box (150, 470, 450, 540, 37)
	    Draw.Box (149, 469, 451, 541, 59)
	    Font.Draw (OptString (1), 170, 490, Font4, 123)
	    Font.Draw ("Sound tracks", 540, 700, Font4, 107)
	    Draw.Line (520, 690, 880, 690, 107)
	    Draw.Line (521, 689, 881, 689, 28)
	    Draw.Line (452, 502, 461, 502, 49)
	    Draw.Line (453, 500, 467, 500, 53)
	    Draw.Line (452, 498, 461, 498, 49)
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
		    Draw.Line (468, 500, 545, 500, 27)
		    Draw.Line (546, 500, 546, 605 - b * 70, 48)
		    Draw.Line (546, 605 - b * 70, 559, 605 - b * 70, 48)
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
			if TrackPlaying (b + 1 + SoundList) = true then
			else
			    for r : 1 .. 24
				TrackPlaying (r) := false
			    end for
			    TrackPlaying (b + 1 + SoundList) := true
			    SongPlaying := b + 1 + SoundList
			    ClickedSong := true
			    delay (120)
			    /* Backup
			     for bb : 0 .. 7
			     if bb not= b then
			     Draw.FillBox (560, 580 - bb * 70, 780, 630 - bb * 70, DarkPurple)
			     Draw.Box (560, 580 - bb * 70, 780, 630 - bb * 70, 37)
			     Font.Draw (SongName (bb + 1 + SoundList), 570, 590 - bb * 70, Font5, 39)
			     end if
			     end for
			     Cursor (Mx, My, Mb)
			     for stalltime : 1 .. 3
			     Draw.Box (Mx - 7 - stalltime * 3, My - 7 - stalltime * 3, Mx + 7 + stalltime * 3, My + 7 + stalltime * 3, 31)
			     View.Update
			     delay (400)
			     end for
			     */
			end if
		    end if
		end if
	    end for
	    for m : 1 .. 8
		if TrackPlaying (m + SoundList) = true then
		    Font.Draw (SongName (m + SoundList), 570, 590 - (m - 1) * 70, Font5, TC (m + SoundList))
		    Draw.Line (570, 620 - (m - 1) * 70, 770, 620 - (m - 1) * 70, 34)
		end if
	    end for
	    if SoundList = 0 then
		Draw.Oval (620, 60, 6, 6, 40)
	    elsif SoundList = 8 then
		Draw.Oval (670, 60, 6, 6, 47)
	    else
		Draw.Oval (720, 60, 6, 6, 54)
	    end if
	end if
	for k : 0 .. 1
	    Draw.Box (0 + k, 0 + k, maxx - k, maxy - k, 177 - k * 120)
	end for
	Cursor (Mx, My, Mb)
	if ClickedSong = true then
	    Music.PlayFileStop
	    fork PlayMusic (SongPlaying)
	end if
	View.Update
	cls
	ClickedSong := false
	exit when Exiting = true
    end loop
    Exiting := false
end Settings

proc World     %************%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WORLD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%******************%
    WorldReady
    SettingsPrepare
    var MoveInAction : boolean := false
    var Slow : boolean := false
    var RandomMusic : int := 1
    var RightsList : array 1 .. 4 of boolean
    for Right : 1 .. 4
	RightsList (Right) := false
    end for
    loop
	Mouse.Where (Mx, My, Mb)
	MoveInAction := true
	if MoveScr = false and Mx > 0 and Mx < 800 and My > 200 and My < 900 then
	    MoveInAction := false
	    %put "X:[", Mx - PosX, "] - Y:[", My - PosY, "]"
	    if ((Mx - PosX) - 390) ** 2 + ((My - PosY) - 778) ** 2 <= 40 ** 2 then     % Rastas Bar
		Draw.Oval ((Mx), (My), 40, 40, 55)
		Draw.Oval ((Mx), (My), 41, 41, 53)
		Draw.Oval ((Mx), (My), 45, 45, 103)
		if Mb = 1 then
		    for k : 1 .. 20
			Descriptions (k) := 0
		    end for
		    Descriptions (1) := 1
		end if
	    elsif (Mx - PosX - 1123) ** 2 + (My - PosY - 1220) ** 2 <= 40 ** 2 then     % Yeifin Reihm
		Draw.Oval ((Mx), (My), 40, 40, 55)
		Draw.Oval ((Mx), (My), 41, 41, 53)
		Draw.Oval ((Mx), (My), 45, 45, 103)
		if Mb = 1 then
		    for k : 1 .. 20
			Descriptions (k) := 0
		    end for
		    Descriptions (2) := 1
		end if
	    elsif (Mx - PosX - 385) ** 2 + (My - PosY - 1040) ** 2 <= 40 ** 2 then     % Gretchins Hollows
		Draw.Oval (Mx, My, 40, 40, 55)
		Draw.Oval (Mx, My, 41, 41, 53)
		Draw.Oval ((Mx), (My), 45, 45, 103)
		if Mb = 1 then
		    for k : 1 .. 20
			Descriptions (k) := 0
		    end for
		    Descriptions (3) := 1
		end if
	    elsif (Mx - PosX - 554) ** 2 + (My - PosY - 575) ** 2 <= 40 ** 2 then     % Gretchins Hollows
		Draw.Oval (Mx, My, 40, 40, 54)
		Draw.Oval (Mx, My, 41, 41, 52)
		Draw.Oval ((Mx), (My), 45, 45, 103)
		if Mb = 1 then
		    for k : 1 .. 20
			Descriptions (k) := 0
		    end for
		    Descriptions (4) := 1
		end if
	    elsif (Mx - PosX - 873) ** 2 + (My - PosY - 746) ** 2 <= 40 ** 2 then         % Gretchins Hollows
		Draw.Oval (Mx, My, 40, 40, 54)
		Draw.Oval (Mx, My, 41, 41, 52)
		Draw.Oval ((Mx), (My), 45, 45, 103)
		if Mb = 1 then
		    for k : 1 .. 20
			Descriptions (k) := 0
		    end for
		    Descriptions (5) := 1
		end if
	    elsif (Mx - PosX - 1026) ** 2 + (My - PosY - 363) ** 2 <= 40 ** 2 then            % Field
		Draw.Oval (Mx, My, 40, 40, 54)
		Draw.Oval (Mx, My, 41, 41, 52)
		Draw.Oval ((Mx), (My), 45, 45, 103)
		if Mb = 1 then
		    for k : 1 .. 20
			Descriptions (k) := 0
		    end for
		    Descriptions (6) := 1
		end if
	    elsif (Mx - PosX - 1330) ** 2 + (My - PosY - 149) ** 2 <= 40 ** 2 then                % Heathen Wolves
		Draw.Oval (Mx, My, 40, 40, 54)
		Draw.Oval (Mx, My, 41, 41, 52)
		Draw.Oval ((Mx), (My), 45, 45, 103)
		if Mb = 1 then
		    for k : 1 .. 20
			Descriptions (k) := 0
		    end for
		    Descriptions (7) := 1
		end if
	    elsif (Mx - PosX - 1205) ** 2 + (My - PosY - 756) ** 2 <= 40 ** 2 then                    % Butterfly
		Draw.Oval (Mx, My, 40, 40, 54)
		Draw.Oval (Mx, My, 41, 41, 52)
		Draw.Oval ((Mx), (My), 45, 45, 103)
		if Mb = 1 then
		    for k : 1 .. 20
			Descriptions (k) := 0
		    end for
		    Descriptions (8) := 1
		end if
	    elsif (Mx - PosX - 274) ** 2 + (My - PosY - 1393) ** 2 <= 40 ** 2 then                        % Butterfly
		Draw.Oval (Mx, My, 40, 40, 54)
		Draw.Oval (Mx, My, 41, 41, 52)
		Draw.Oval ((Mx), (My), 45, 45, 103)
		if Mb = 1 then
		    for k : 1 .. 20
			Descriptions (k) := 0
		    end for
		    Descriptions (9) := 1
		end if
	    elsif (Mx - PosX - 796) ** 2 + (My - PosY - 1160) ** 2 <= 40 ** 2 then                             % Butterfly
		Draw.Oval (Mx, My, 40, 40, 54)
		Draw.Oval (Mx, My, 41, 41, 52)
		Draw.Oval ((Mx), (My), 45, 45, 103)
		if Mb = 1 then
		    for k : 1 .. 20
			Descriptions (k) := 0
		    end for
		    Descriptions (10) := 1
		end if
	    elsif (Mx - PosX - 198) ** 2 + (My - PosY - 147) ** 2 <= 40 ** 2 then                                 % Butterfly
		Draw.Oval (Mx, My, 40, 40, 54)
		Draw.Oval (Mx, My, 41, 41, 52)
		Draw.Oval ((Mx), (My), 45, 45, 103)
		if Mb = 1 then
		    for k : 1 .. 20
			Descriptions (k) := 0
		    end for
		    Descriptions (11) := 1
		end if
	    end if
	end if
	if Mb = 1 and Mx > 0 and Mx < 800 and My > 200 and My < 900 then
	    Draw.Oval (Mx, My, 60, 60, 28)
	    ClickedChar := false
	    FlipSide := true
	    if MoveInAction = true then
		MoveScr := true
		for k : 1 .. 20
		    Descriptions (k) := 0
		end for
	    end if
	else
	    MoveScr := false
	end if
	if FlipSide = true then
	    PosX += Mx - Dx
	    PosY += My - Dy
	end if
	WRestrictions
	for k : 1 .. 20
	    if Descriptions (k) = 1 then
		Draw.Oval (PosX + DesX (k), (PosY + DesY (k)), 40, 40, 108)
		Draw.Oval (PosX + DesX (k), (PosY + DesY (k)), 41, 41, 62)
		Draw.FillBox (PosX + DesX (k) + 40, PosY + DesY (k) + 30, PosX + DesX (k) + 240, PosY + DesY (k) + 155, 16)
		Pic.Draw (MapTile (k), PosX + DesX (k) + 42, PosY + DesY (k) + 113, picCopy)
		Draw.Box (PosX + DesX (k) + 40, PosY + DesY (k) + 30, PosX + DesX (k) + 240, PosY + DesY (k) + 155, BlazeBlue)
		Draw.Box (PosX + DesX (k) + 42, PosY + DesY (k) + 113, PosX + DesX (k) + 238, PosY + DesY (k) + 153, BlazeBlue)
		Draw.Box (PosX + DesX (k) + 42, PosY + DesY (k) + 32, PosX + DesX (k) + 238, PosY + DesY (k) + 111, BlazeBlue)
		Font.Draw (Des (k), PosX + DesX (k) + 45, PosY + DesY (k) + 93, Font3, 31)     % Descriptions
		Draw.FillBox (PosX + DesX (k) + 50, PosY + DesY (k), PosX + DesX (k) + 150, PosY + DesY (k) + 25, 177)     % Enter sign
		Draw.Box (PosX + DesX (k) + 50, PosY + DesY (k), PosX + DesX (k) + 150, PosY + DesY (k) + 25, 124)
		Font.Draw ("Enter", PosX + DesX (k) + 60, PosY + DesY (k) + 5, Font5, 49)
		if Mx > PosX + DesX (k) + 50 and Mx < PosX + DesX (k) + 150 and My > PosY + DesY (k) and My < PosY + DesY (k) + 25 then
		    Draw.FillBox (PosX + DesX (k) + 50, PosY + DesY (k), PosX + DesX (k) + 150, PosY + DesY (k) + 25, 31)
		    Draw.Box (PosX + DesX (k) + 50, PosY + DesY (k), PosX + DesX (k) + 150, PosY + DesY (k) + 25, 177)
		    Font.Draw ("Enter", PosX + DesX (k) + 60, PosY + DesY (k) + 5, Font5, BlazeBlue)
		    if Mb = 1 then
			if k = 1 then
			    Rastas_Bar
			elsif k = 2 then
			    Battle_Keushi_Forest (1)
			elsif k = 3 then
			elsif k = 4 then
			elsif k = 5 then
			end if
		    end if
		end if
		exit
	    end if
	end for
	DrawWorldGUI
	for k : 0 .. 3
	    Font.Draw (WorldList (k + 1), 300, 150 - k * 42, Font5, 59)
	    if Mx > 290 and Mx < 490 and My > 145 - k * 42 and My < 180 - k * 42 then
		Draw.FillBox (474, 145 - k * 42, 479, 180 - k * 42, Slate)     % Fade
		Draw.FillBox (480, 145 - k * 42, 484, 180 - k * 42, Sky)     % Fade
		Draw.FillBox (485, 145 - k * 42, 487, 180 - k * 42, BlazeBlue)     % Fade
		Draw.FillBox (488, 145 - k * 42, 490, 180 - k * 42, 53)     % Fade
		Draw.Box (290, 145 - k * 42, 490, 180 - k * 42, 54)     % Right side Boxes
		Font.Draw (WorldList (k + 1), 300, 150 - k * 42, Font5, k + 1)
		if Mb = 1 then
		    for o : 1 .. 4
			RightsList (o) := false
		    end for
		    if k = 0 then
			RightsList (1) := true
		    elsif k = 1 then
			RightsList (2) := true
		    elsif k = 2 then
			RightsList (3) := true
		    else
			RightsList (4) := true
		    end if
		end if
	    end if
	end for
	if Mx > 9 and Mx < 261 then
	    if My > 10 and My < 40 then
		Draw.Box (10, 10, 260, 40, 108)
		Draw.Box (12, 12, 258, 38, 59)
		Draw.Line (4, 25, 10, 25, 108)
		Draw.Line (261, 25, 266, 25, 108)
		if Mb = 1 then
		    Settings
		end if
	    elsif My > 50 and My < 80 then
		Draw.Box (10, 50, 260, 80, 108)
		Draw.Box (12, 52, 258, 78, 59)
		Draw.Line (4, 65, 10, 65, 108)
		Draw.Line (261, 65, 266, 65, 108)
		if Mb = 1 then
		end if
	    elsif My > 90 and My < 120 then
		Draw.Box (10, 90, 260, 120, 108)
		Draw.Box (12, 92, 258, 118, 59)
		Draw.Line (4, 105, 10, 105, 108)
		Draw.Line (261, 105, 266, 105, 108)
		if Mb = 1 then
		end if
	    elsif My > 130 and My < 160 then
		Draw.Box (10, 130, 260, 160, 108)
		Draw.Box (12, 132, 258, 158, 59)
		Draw.Line (4, 145, 10, 145, 108)
		Draw.Line (261, 145, 266, 145, 108)
		if Mb = 1 then
		    PartyList
		end if
	    end if
	end if
	if RightsList (1) = true then
	    Draw.Box (282, 12, 778, 188, BlazeBlue)
	elsif RightsList (2) = true then
	    Draw.Box (282, 12, 778, 188, 124)
	elsif RightsList (3) = true then
	    Draw.Box (282, 12, 778, 188, 56)
	    Draw.Line (495, 150, 700, 150, 57)
	    for S : 1 .. 8
		if TrackPlaying (S + SoundList) = true then
		    Font.Draw ("" + SongName (S + SoundList), 500, 155, Font5, 54)
		    Font.Draw ("[ " + SongDes (S + SoundList) + " ]", 500, 50, Font3, 53)
		    exit
		end if
	    end for
	elsif RightsList (4) = true then
	    Draw.Box (282, 12, 778, 188, 41)
	end if
	Cursor (Mx, My, Mb)
	View.Update
	cls
	Dx := Mx
	Dy := My
	DrawWorld (PosX, PosY)
    end loop
end World

proc LoadGame
end LoadGame

proc Continue
end Continue

proc Start
    cls
    View.Set ("nooffscreenonly")
    for k : 0 .. 2
	Pic.DrawSpecial (MainS (k + 1), 250, 460 - 120 * k, picCopy, picFadeIn, 240)
    end for
    View.Set ("offscreenonly")
    loop
	Mouse.Where (Mx, My, Mb)
	if My > 460 and My < 540 then
	    Draw.Box (250, 460, 550, 540, 119)
	    Draw.Box (251, 459, 551, 539, 103)
	    Draw.Line (260, 470, 540, 470, 53)
	    if Mb = 1 then
		World
	    end if
	elsif My > 340 and My < 420 then
	    Draw.Box (250, 340, 550, 420, 25)
	    Draw.Box (251, 339, 551, 419, 16)
	    Draw.Line (260, 350, 540, 350, 132)
	    if Mb = 1 then
		LoadGame
	    end if
	elsif My > 220 and My < 300 then
	    Draw.Box (250, 220, 550, 300, 111)
	    Draw.Box (251, 219, 551, 299, 56)
	    Draw.Line (260, 230, 540, 230, 132)
	    if Mb = 1 then
		Continue
	    end if
	elsif My > 100 and My < 180 then
	    Draw.Box (250, 100, 550, 180, 111)
	    Draw.Box (251, 99, 551, 179, 56)
	    Draw.Line (260, 140, 540, 140, 53)
	    Draw.Oval (400, 140, 30, 30, 55)
	    Draw.Oval (400, 140, 28, 28, 109)
	    if Mb = 1 then
		exit
	    end if
	end if
	Cursor (Mx, My, Mb)
	View.Update
	cls
	CursorErase (Mx, My, Mb)
	for k : 0 .. 2
	    Pic.Draw (MainS (k + 1), 250, 460 - 120 * k, picCopy)
	end for
	Draw.Line (270, 155, 530, 155, 39)
	Draw.Line (260, 140, 540, 140, 38)
	Draw.Line (270, 125, 530, 125, 37)
	for k : 0 .. 3
	    Draw.Box (250, 460 - 120 * k, 550, 540 - 120 * k, 28)
	    Draw.Box (251, 459 - 120 * k, 551, 539 - 120 * k, 24)
	    Draw.Line (260, 470 - 120 * k, 540, 470 - 120 * k, 31)
	end for
    end loop
end Start

proc Multiplayer
    loop
	View.Update
	exit
    end loop
end Multiplayer

proc Options
    var OptStringM : array 1 .. 3 of string
    var SoundTrack : boolean := false
    SettingsPrepare
    GenericInt := 0
    OptStringM (1) := "Sound Track"
    OptStringM (2) := "  Help"
    OptStringM (3) := "Main Menu"
    for k : 1 .. 8
	TrackPlaying (k) := false
    end for
    loop
	Mouse.Where (Mx, My, Mb)
	Font.Draw ("Options", 30, 850, Font4, 34)
	for k : 0 .. 2
	    Draw.Box (149, 469 - k * 80, 451, 541 - k * 80, 51)
	    Draw.Box (150, 470 - k * 80, 450, 540 - k * 80, 52)
	    Font.Draw (OptStringM (k + 1), 170, 490 - (k * 80), Font4, 24)
	    Draw.Line (155, 475 - k * 80, 445, 475 - k * 80, 50)
	end for
	for m : 1 .. 3
	    if Mx > 150 and Mx < 450 and My > 460 - (m - 1) * 80 and My < 540 - (m - 1) * 80 then
		Draw.Box (149, 469 - (m - 1) * 80, 451, 541 - (m - 1) * 80, 51)
		Draw.Box (150, 470 - (m - 1) * 80, 450, 540 - (m - 1) * 80, 53)
		Draw.Line (155, 475 - (m - 1) * 80, 445, 475 - (m - 1) * 80, 103)
		Font.Draw (OptStringM (m), 170, 490 - (m - 1) * 80, Font4, 79)
		if Mb = 1 then
		    if m = 3 then
			Exiting := true
			exit
		    elsif m = 2 then
			put "Eh?"
		    elsif m = 1 then
			SoundTrack := true
			exit
		    end if
		end if
	    end if
	end for
	if SoundTrack = true then
	    Draw.FillBox (150, 470, 450, 540, 102)
	    Draw.Box (150, 470, 450, 540, 37)
	    Draw.Box (149, 469, 451, 541, 59)
	    Font.Draw (OptStringM (1), 170, 490, Font4, 123)
	    Font.Draw ("Sound tracks", 540, 700, Font4, 107)
	    Draw.Line (520, 690, 880, 690, 107)
	    Draw.Line (521, 689, 881, 689, 28)
	    Draw.Line (452, 502, 461, 502, 49)
	    Draw.Line (453, 500, 467, 500, 53)
	    Draw.Line (452, 498, 461, 498, 49)
	    for b : 0 .. 7
		Mouse.Where (Mx, My, Mb)
		Draw.FillBox (560, 580 - b * 70, 780, 630 - b * 70, 30)
		Draw.Box (560, 580 - b * 70, 780, 630 - b * 70, 37)
		Font.Draw (SongName (b + 1), 570, 590 - b * 70, Font5, 39)
		if Mx > 560 and Mx < 780 and My > 580 - b * 70 and My < 630 - b * 70 then
		    Draw.FillBox (560, 580 - b * 70, 780, 630 - b * 70, 16)
		    Draw.Box (560, 580 - b * 70, 780, 630 - b * 70, 48)
		    Font.Draw (SongName (b + 1), 570, 590 - b * 70, Font5, 36)
		    for k : 0 .. 1
			for p : 0 .. 1
			    Draw.Line (555 + (k * 210), 635 - (p * 60) - (b * 70), 575 + (k * 210), 635 - (p * 60) - (b * 70), 53)
			    Draw.Line (555 + (k * 230), 620 - (p * 45) - (b * 70), 555 + (k * 230), 635 - (p * 45) - (b * 70), 53)
			end for
		    end for
		    if Mb = 1 then
			for r : 1 .. 8
			    TrackPlaying (r) := false
			end for
			TrackPlaying (b + 1) := true
			SongPlaying := b
			Music.PlayFileStop
			fork PlayMusic (SongPlaying + 1)
			delay (50)
		    end if
		end if
	    end for
	end if
	for List : 1 .. 8
	    if TrackPlaying (List) = true then
		Font.Draw (SongName (List), 570, 590 - (SongPlaying) * 70, Font5, TC (List))
	    end if
	end for
	Cursor (Mx, My, Mb)
	View.Update
	cls
	exit when Exiting = true
    end loop
    Exiting := false
end Options

proc Quit
    quit
end Quit

for k : 1 .. 4
    Bx (k) := Rand.Int (260, 550)
    By (k) := Rand.Int (426, 453)
end for
for k : 5 .. 8
    Bx (k) := Rand.Int (260, 550)
    By (k) := Rand.Int (306, 335)
end for
for k : 9 .. 12
    Bx (k) := Rand.Int (260, 550)
    By (k) := Rand.Int (187, 215)
end for
for r : 1 .. 12
    RandomX (r) := Rand.Int (-3, 3)
    RandomY (r) := Rand.Int (-3, 3)
end for


fork PlayMusic (4)
%$ World

View.Set ("nooffscreenonly")
Pic.DrawSpecial (IntroPic, 0, 0, picCopy, picFadeIn, 5050)
Pic.DrawSpecial (Intro2Pic, 0, 0, picCopy, picFadeIn, 170)
Pic.DrawSpecial (Intro3Pic, 0, 0, picCopy, picFadeIn, 200)
Pic.DrawSpecial (Intro4Pic, 0, 0, picCopy, picFadeIn, 130)
Pic.DrawSpecial (MainMenu, 0, 0, picCopy, picFadeIn, 2000)
View.Set ("offscreenonly")


loop         % Main Menu
    if Coleur >= 103 then
	FlipSide := true
    elsif Coleur <= 32 then
	FlipSide := false
    end if
    if FlipSide = true then
	Coleur -= 1
    else
	Coleur += 1
    end if
    Mouse.Where (Mx, My, Mb)
    if Mx > 250 and Mx < 550 then
	if My > 460 and My < 540 then
	    Draw.Box (250, 460, 550, 540, 119)
	    Draw.Box (251, 459, 551, 539, 103)
	    Draw.Line (260, 470, 540, 470, 53)
	    if Mb = 1 then
		Exiting := true
		Start
		delay (100)
	    end if
	elsif My > 340 and My < 420 then
	    Draw.Box (250, 340, 550, 420, 25)
	    Draw.Box (251, 339, 551, 419, 16)
	    Draw.Line (260, 350, 540, 350, 132)
	    if Mb = 1 then
		Exiting := true
		Multiplayer
		delay (100)
	    end if
	elsif My > 220 and My < 300 then
	    Draw.Box (250, 220, 550, 300, 111)
	    Draw.Box (251, 219, 551, 299, 56)
	    Draw.Line (260, 230, 540, 230, 132)
	    if Mb = 1 then
		Exiting := false
		delay (200)
		Options
		delay (100)
	    end if
	elsif My > 100 and My < 180 then
	    Draw.Box (250, 100, 550, 180, 114)
	    Draw.Box (251, 99, 551, 179, 51)
	    Draw.Line (260, 110, 540, 110, 40)
	    if Mb = 1 then
		Quit
	    end if
	end if
    end if
    for L : 1 .. 4
	Ball (L, 245, 421, 555, 459)
    end for
    for L : 5 .. 8
	Ball (L, 245, 301, 555, 339)
    end for
    for L : 9 .. 12
	Ball (L, 245, 181, 555, 219)
    end for
    Cursor (Mx, My, Mb)
    View.Update
    delay (10)
    CursorErase (Mx, My, Mb)
    Pic.Draw (MainMenu, 0, 0, picCopy)
    for k : 0 .. 3
	Draw.Box (250, 460 - 120 * k, 550, 540 - 120 * k, 28)
	Draw.Box (251, 459 - 120 * k, 551, 539 - 120 * k, 24)
	Draw.Line (260, 470 - 120 * k, 540, 470 - 120 * k, 31)
    end for
end loop
