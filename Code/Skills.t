% Skills
% index
% 1 - Vicious Stab 2 - Air cutter 3 - Winsrash

proc SkillCast (Type, SkillN, FightSize : int)
    var Act : boolean := false
    var SX, SY, SS : int := 0
    var DisplayHp : int
    WithinRange := false
    if Type = 1 or Type = 3 or Type = 5 then
	for SkillLoop : 1 .. 50
	    if SkillN = SkillLoop then
		Draw.FillBox (640, 710, 790, 890, 16)
		Draw.Box (640, 710, 790, 890, 53)
		Draw.Box (642, 712, 788, 888, 52)
		Font.Draw ("Lv. " + intstr (Stat.Skills (CurT, SkillN)), 645, 720, Font6, 52)
		Font.Draw (SkillRange (SkillLoop), 645, 740, Font6, 52)
		if Type = 1 then
		    Font.Draw (Attackstring (SkillN) + "", 670, 800, Font7, 64)
		elsif Type = 3 then
		    Font.Draw (Skillstring (SkillN) + "", 670, 800, Font7, 64)
		else
		    Font.Draw (Itemstring (SkillN) + "", 670, 800, Font7, 64)
		end if
		for k : 1 .. 40
		    for p : 1 .. 30
			if (((Stat.XC (CurT) * 40 - 20) - (k * 40 - 20)) ** 2) + (((Stat.YC (CurT) * 40 + 80) - (p * 40 + 80)) ** 2) <= (SkillRangeInt (SkillLoop)) ** 2 then
			    Draw.Box (k * 40 - 40 + PosX, p * 40 + 60 + PosY, k * 40 + PosX, p * 40 + 100 + PosY, 55)
			    Draw.Box (k * 40 - 39 + PosX, p * 40 + 61 + PosY, k * 40 + PosX - 1, p * 40 + 99 + PosY, 78)
			    for Detect : 1 .. FightSize
				if Stat.Real (Detect) = true then
				    if Stat.XC (Detect) = k and Stat.YC (Detect) = p then
					if Stat.Team (Detect) = 1 then
					    Draw.Box (k * 40 - 5 + PosX, p * 40 + 95 + PosY, k * 40 - 35 + PosX, p * 40 + 65 + PosY, 42)
					elsif Stat.Team (Detect) = 3 then
					    Draw.Box (k * 40 - 5 + PosX, p * 40 + 95 + PosY, k * 40 - 35 + PosX, p * 40 + 65 + PosY, 123)
					else
					    Draw.Box (k * 40 - 5 + PosX, p * 40 + 95 + PosY, k * 40 - 35 + PosX, p * 40 + 65 + PosY, 44)
					end if
				    end if
				end if
			    end for
			    if Mx > k * 40 - 40 + PosX and Mx < k * 40 + PosX and My > p * 40 + 60 + PosY and My < p * 40 + 100 + PosY then
				WithinRange := true
				Draw.Box (k * 40 - 40 + PosX, p * 40 + 60 + PosY, k * 40 + PosX, p * 40 + 100 + PosY, 216)
				Draw.Box (k * 40 - 39 + PosX, p * 40 + 61 + PosY, k * 40 + PosX - 1, p * 40 + 99 + PosY, 120)
				for Person : 1 .. FightSize
				    if Stat.Real (Person) = true then
					if Stat.XC (Person) = k and Stat.YC (Person) = p then
					    SX := Person
					    SS := 1
					    if Stat.Team (Person) = 1 then
						SY := 53
					    elsif Stat.Team (Person) = 2 then
						SY := 43
					    else
						SY := 111
					    end if
					    exit
					end if
				    end if
				end for
				if SS = 1 then % 215 - 445 x
				    if Stat.Pierce (CurT) > Stat.Block (SX) then
					DamageHit := Stat.Attack (CurT) - Stat.Defense (SX)
				    else
					DamageHit := ((Stat.Attack (CurT) + Stat.Pierce (CurT) - Stat.Block (SX) - Stat.Defense (SX)) ** 2 ** 0.5 / 2)
				    end if
				    PercentHit := (((Stat.Accuracy (CurT) * 100 div Stat.Evasion (SX)) - 100) * 2)
				    if PercentHit > 100 then
					PercentHit := 100
				    elsif PercentHit < 9 then
					PercentHit := 9
				    end if
				    DisplayHp := round (Stat.Hp (SX) / Stat.THp (SX) * 100)
				    Font.Draw (realstr (Stat.Attack (CurT) - Stat.Defense (SX), 5), 310, 60, Font7, 113) % Raw Damage
				    Font.Draw (intstr (PercentHit) + "%", 370, 17, Font5, 108) % Hit chance
				    Draw.Line (280, 45, 420, 45, 28)
				    Font.Draw (realstr (DamageHit, 6) + ">", 310, 40, Font5, 105) % Actual Damage
				    Font.Draw (Stat.Name (SX), 220, 70, Font5, SY) % Target Name
				    Draw.FillBox (220, 15, 220 + DisplayHp, 22, 108) % Hp Bar
				    Draw.Box (220, 15, 320, 22, 105)
				    Font.Draw (realstr (Stat.Hp (SX), 4) + "/" + realstr (Stat.THp (SX), 4), 240, 23, Font1, 107)
				else
				    if BattleBlock (k, p) = 1 or BattleBlock (k, p) = 2 then
					Font.Draw ("Water", 220, 15, Font5, 54)
				    elsif BattleBlock (k, p) = 6 or BattleBlock (k, p) = 4 or BattleBlock (k, p) = 5 or BattleBlock (k, p) = 7 then
					Font.Draw ("Trees", 220, 15, Font5, 50)
				    elsif BattleBlock (k, p) = 3 then
					Font.Draw ("Bridge", 220, 15, Font5, 43)
				    elsif BattleBlock (k, p) = 8 or BattleBlock (k, p) = 9 then
					Font.Draw ("Flowers", 220, 15, Font5, 40)
				    elsif BattleBlock (k, p) = 10 or BattleBlock (k, p) = 11 or BattleBlock (k, p) = 12 or BattleBlock (k, p) = 13  then
					Font.Draw ("Environment Barrier", 220, 15, Font5, 123)
				    elsif BattleBlock (k, p) < 20 then
					Font.Draw ("Grass", 220, 15, Font5, 121)
				    else
					Font.Draw ("Thick Grass", 220, 15, Font5, 120)
				    end if
				end if
				if Mb = 1 then
				    Draw.Box (k * 40 - 40 + PosX, p * 40 + 60 + PosY, k * 40 + PosX, p * 40 + 100 + PosY, 111)
				    Draw.Box (k * 40 - 39 + PosX, p * 40 + 61 + PosY, k * 40 + PosX - 1, p * 40 + 99 + PosY, 38)
				    for Person : 1 .. FightSize
					if Stat.Real (Person) = true then
					    if Stat.XC (Person) = k and Stat.YC (Person) = p and Stat.Name (Person) not= Stat.Name (CurT) then
						if Stat.Attack (CurT) >= Stat.Defense (Person) then
						    if (Stat.Accuracy (CurT) * 100 div Stat.Evasion (Person) - 100) * 2 >= 100 then
							Hitting := 101
						    elsif (Stat.Accuracy (CurT) * 100 div Stat.Evasion (Person) - 100) * 2 < 100 then
							Hitting := (Stat.Accuracy (CurT) * 100 div Stat.Evasion (Person) - 100) * 2
							if Hitting > 9 then
							    Hitting := 10
							end if
						    end if
						    GenericInt := Rand.Int (1, 100)
						    if Hitting >= GenericInt then
							if Stat.Pierce (CurT) > Stat.Block (Person) then
							    Stat.Hp (Person) -= ((Stat.Attack (CurT) - Stat.Defense (Person)) * Rand.Int (95, 105) / 100)
							    Font.Draw (" Hit " + realstr (((Stat.Attack (CurT) - Stat.Defense (Person)) * Rand.Int (95, 105) / 100), 6), Stat.XC (Person) * 40 - 40 +
								PosX, Stat.YC (Person) * 40 + 110 + PosY, Font1, 39)
							else
							    Stat.Hp (Person) -= (((Stat.Attack (CurT) + Stat.Pierce (CurT) - Stat.Block (Person) - Stat.Defense (Person)) ** 2 ** 0.5 / 2) *
								Rand.Int (95,
								105)
								/ 100)
							    DamageHit := (((Stat.Attack (CurT) + Stat.Pierce (CurT) - Stat.Block (Person) - Stat.Defense (Person)) ** 2 ** 0.5 / 2) * Rand.Int (95,
								105) / 100)
							    Font.Draw (" Blocked " + realstr (DamageHit, 6), Stat.XC (Person) * 40 - 40 + PosX, Stat.YC (Person) * 40 + 110 + PosY, Font1, 42)
							end if
						    else
							Font.Draw (" Miss ", Stat.XC (Person) * 40 - 40 + PosX, Stat.YC (Person) * 40 + 110 + PosY, Font1, 26)
						    end if
						else
						    Font.Draw (" 0 ", Stat.XC (Person) * 40 - 40 + PosX, Stat.YC (Person) * 40 + 110 + PosY, Font1, 16)
						end if
						for MultiFire : 1 .. 9
						    for decreasing Animate : 5 .. 1
							Draw.Line (Stat.XC (CurT) * 40 - 20 + PosX, Stat.YC (CurT) * 40 + 80 + PosY, (Stat.XC (CurT) * 40 - 20 + PosX) -
							    ((Stat.XC (CurT) * 40 - 20 + PosX) - (Stat.XC (Person) * 40 - 20 + PosX)) div Animate, (Stat.YC (CurT) * 40 + 80 + PosY) -
							    ((Stat.YC (CurT) * 40 + 80 + PosY) - (Stat.YC (Person) * 40 + 80 + PosY)) div Animate, 42 + (MultiFire * 3))
							View.Update
							delay (40)
						    end for % Animation here
						end for
						Acted := true
						Act := true
						exit
					    end if
					end if
				    end for
				    if Acted = false then
					Draw.FillBox (220, 14, 440, 35, 0)
					Font.Draw ("No target", 220, 15, Font5, 39)
					Pause := true
				    end if
				end if
			    end if
			end if
		    end for
		end for
		exit
	    end if
	end for
    elsif Type = 2 then
	for SkillLoop : 1 .. 50
	    if SkillN = SkillLoop then
		Draw.FillBox (640, 710, 790, 890, 16)
		Draw.Box (640, 710, 790, 890, 53)
		Draw.Box (642, 712, 788, 888, 52)
		Font.Draw ("Lv. " + intstr (Stat.Magic (CurT, SkillN)), 645, 720, Font6, 52)
		Font.Draw (SkillRange (SkillLoop), 645, 740, Font6, 52)
		Font.Draw (Magicstring (SkillN) + "", 670, 800, Font7, 64)
		for k : 1 .. 40
		    for p : 1 .. 30
			if (((Stat.XC (CurT) * 40 - 20) - (k * 40 - 20)) ** 2) + (((Stat.YC (CurT) * 40 + 80) - (p * 40 + 80)) ** 2) <= (MagicRangeInt (SkillLoop)) ** 2 then
			    Draw.Box (k * 40 - 40 + PosX, p * 40 + 60 + PosY, k * 40 + PosX, p * 40 + 100 + PosY, 55)
			    Draw.Box (k * 40 - 39 + PosX, p * 40 + 61 + PosY, k * 40 + PosX - 1, p * 40 + 99 + PosY, 78)
			    for Detect : 1 .. FightSize
				if Stat.Real (Detect) = true then
				    if Stat.XC (Detect) = k and Stat.YC (Detect) = p then
					if Stat.Team (Detect) = 1 then
					    Draw.Box (k * 40 - 5 + PosX, p * 40 + 95 + PosY, k * 40 - 35 + PosX, p * 40 + 65 + PosY, 42)
					elsif Stat.Team (Detect) = 3 then
					    Draw.Box (k * 40 - 5 + PosX, p * 40 + 95 + PosY, k * 40 - 35 + PosX, p * 40 + 65 + PosY, 123)
					else
					    Draw.Box (k * 40 - 5 + PosX, p * 40 + 95 + PosY, k * 40 - 35 + PosX, p * 40 + 65 + PosY, 44)
					end if
				    end if
				end if
			    end for
			    if Mx > k * 40 - 40 + PosX and Mx < k * 40 + PosX and My > p * 40 + 60 + PosY and My < p * 40 + 100 + PosY then
				WithinRange := true
				Draw.Box (k * 40 - 40 + PosX, p * 40 + 60 + PosY, k * 40 + PosX, p * 40 + 100 + PosY, 216)
				Draw.Box (k * 40 - 39 + PosX, p * 40 + 61 + PosY, k * 40 + PosX - 1, p * 40 + 99 + PosY, 120)
				for Person : 1 .. FightSize
				    if Stat.Real (Person) = true then
					if Stat.XC (Person) = k and Stat.YC (Person) = p then
					    SX := Person
					    SS := 1
					    if Stat.Team (Person) = 1 then
						SY := 53
					    elsif Stat.Team (Person) = 2 then
						SY := 43
					    else
						SY := 111
					    end if
					    exit
					end if
				    end if
				end for
				if SS = 1 then % 215 - 445 x
				    DamageHit := Stat.M_Attack (CurT) - Stat.M_Defense (SX) - Stat.Resistance (SX)
				    PercentHit := 100
				    if PercentHit > 95 then
					PercentHit := 95
				    elsif PercentHit < 9 then
					PercentHit := 9
				    end if
				    DisplayHp := round (Stat.Hp (SX) / Stat.THp (SX) * 100)
				    Font.Draw (realstr (Stat.M_Attack (CurT) - Stat.M_Defense (SX), 5), 310, 60, Font7, 113) % Raw Damage
				    Font.Draw (intstr (PercentHit) + "%", 370, 17, Font5, 108) % Hit chance
				    Draw.Line (280, 45, 420, 45, 28)
				    Font.Draw (realstr (DamageHit, 6) + ">", 310, 40, Font5, 105) % Actual Damage
				    Font.Draw (Stat.Name (SX), 220, 70, Font5, SY) % Target Name
				    Draw.FillBox (220, 15, 220 + DisplayHp, 22, 108) % Hp Bar
				    Draw.Box (220, 15, 320, 22, 105)
				    Font.Draw (realstr (Stat.Hp (SX), 4) + "/" + realstr (Stat.THp (SX), 4), 240, 23, Font1, 107)
				else
				    if BattleBlock (k, p) = 1 or BattleBlock (k, p) = 2 then
					Font.Draw ("Water", 220, 15, Font5, 54)
				    elsif BattleBlock (k, p) = 6 or BattleBlock (k, p) = 4 or BattleBlock (k, p) = 5 or BattleBlock (k, p) = 7 then
					Font.Draw ("Trees", 220, 15, Font5, 50)
				    elsif BattleBlock (k, p) = 3 then
					Font.Draw ("Bridge", 220, 15, Font5, 43)
				    elsif BattleBlock (k, p) = 8 or BattleBlock (k, p) = 9 then
					Font.Draw ("Flowers", 220, 15, Font5, 40)
				    elsif BattleBlock (k, p) = 10 or BattleBlock (k, p) = 11 or BattleBlock (k, p) = 12 or BattleBlock (k, p) = 13 then
					Font.Draw ("Environment Barrier", 220, 15, Font5, 123)
				    elsif BattleBlock (k, p) < 20 then
					Font.Draw ("Grass", 220, 15, Font5, 121)
				    else
					Font.Draw ("Thick Grass", 220, 15, Font5, 120)
				    end if
				end if
				if Mb = 1 then
				    Draw.Box (k * 40 - 40 + PosX, p * 40 + 60 + PosY, k * 40 + PosX, p * 40 + 100 + PosY, 111)
				    Draw.Box (k * 40 - 39 + PosX, p * 40 + 61 + PosY, k * 40 + PosX - 1, p * 40 + 99 + PosY, 38)
				    for Person : 1 .. FightSize
					if Stat.Real (Person) = true then
					    if Stat.XC (Person) = k and Stat.YC (Person) = p and Stat.Name (Person) not= Stat.Name (CurT) then
						if Stat.M_Attack (CurT) >= Stat.M_Defense (Person) - Stat.Level (Person) then
						    Hitting := 95
						    GenericInt := Rand.Int (1, 100)
						    if Hitting >= GenericInt then
							if Stat.Accuracy (CurT) > Stat.Resistance (Person) then
							    Stat.Hp (Person) -= ((Stat.M_Attack (CurT) - Stat.M_Defense (Person)) * Rand.Int (95, 105) / 100)
							    Font.Draw (" Hit " + realstr (((Stat.M_Attack (CurT) - Stat.M_Defense (Person)) * Rand.Int (95, 105) / 100), 6), Stat.XC (Person) * 40
								- 40, Stat.YC (Person) * 40 + 110, Font1, 39)
							else
							    Stat.Hp (Person) -= (round ((Stat.M_Attack (CurT) - Stat.M_Defense (Person) - Stat.Resistance (Person)) / 2) * Rand.Int (92,
								108) div 100)
							    DamageHit := (round ((Stat.M_Attack (CurT) - Stat.M_Defense (Person) - Stat.Resistance (Person)) / 2) * Rand.Int (92,
								108) div 100)
							    Font.Draw (" Blocked " + realstr (DamageHit, 6), Stat.XC (Person) * 40 - 40, Stat.YC (Person) * 40 + 110, Font1, 42)
							end if
						    else
							Font.Draw (" Miss ", Stat.XC (Person) * 40 - 40, Stat.YC (Person) * 40 + 110, Font1, 26)
						    end if
						else
						    Font.Draw (" 0 ", Stat.XC (Person) * 40 - 40, Stat.YC (Person) * 40 + 110, Font1, 16)
						end if
						for MultiFire : 1 .. 9
						    for decreasing Animate : 5 .. 1
							Draw.Line (Stat.XC (CurT) * 40 - 20 + PosX, Stat.YC (CurT) * 40 + 80 + PosY, (Stat.XC (CurT) * 40 - 20 + PosX) -
							    ((Stat.XC (CurT) * 40 - 20 + PosX) - (Stat.XC (Person) * 40 - 20 + PosX)) div Animate, (Stat.YC (CurT) * 40 + 80 + PosY) -
							    ((Stat.YC (CurT) * 40 + 80 + PosY) - (Stat.YC (Person) * 40 + 80 + PosY)) div Animate, 42 + ((MultiFire + 1) * 2))
							View.Update
							delay (40)
						    end for     % Animation here
						end for
						Acted := true
						Act := true
						exit
					    end if
					end if
				    end for
				    if Acted = false then
					Draw.FillBox (220, 14, 440, 35, 0)
					Font.Draw ("No target", 220, 15, Font5, 39)
					Pause := true
				    end if
				end if
			    end if
			end if
		    end for
		end for
		exit
	    end if
	end for
    elsif Type = 4 then
    end if
end SkillCast
