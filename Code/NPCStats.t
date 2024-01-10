% Statistics

for i : 1 .. 50
    Stat.Real (i) := false
end for

% Main Character
Stat.Level (1) := 1
Stat.Name (1) := "Lirfen"
Stat.Real (1) := true
Stat.Team (1) := 1
Stat.Picture (1) := LirfenPic
Stat.Avatar (1) := LirfenAva
Stat.Class (1) := "Elven"
Stat.Race (1) := "Elf"
Stat.Hp (1) := 95
Stat.THp (1) := 95
Stat.Mana (1) := 40
Stat.TMana (1) := 40
Stat.Attack (1) := 26
Stat.M_Attack (1) := 23
Stat.Defense (1) := 18
Stat.M_Defense (1) := 17
Stat.Speed (1) := 85
Stat.Turn (1) := 85
Stat.Resistance (1) := 4
Stat.Luck (1) := 105
Stat.Burst (1) := 3
Stat.Accuracy (1) := 45
Stat.Evasion (1) := 25
Stat.Block (1) := 25
Stat.Pierce (1) := 34
Stat.Money (1) := 10
Stat.XC (1) := 5
Stat.YC (1) := 5
for R : 1 .. 50
    Stat.Magic (1, R) := 1
    Stat.Skills (1, R) := 1
end for
Stat.Unseal (1) := 5

Stat.Level (2) := 1
Stat.Name (2) := "Shana"
Stat.Real (2) := true
Stat.Team (2) := 1
Stat.Picture (2) := ShanaPic
Stat.Avatar (2) := ShanaAva
Stat.Class (2) := "Photonic"
Stat.Race (2) := "Wyvern"
Stat.Hp (2) := 75
Stat.THp (2) := 75
Stat.Mana (2) := 70
Stat.TMana (2) := 70
Stat.Attack (2) := 28
Stat.M_Attack (2) := 37
Stat.Defense (2) := 14
Stat.M_Defense (2) := 18
Stat.Speed (2) := 80
Stat.Turn (2) := 80
Stat.Resistance (2) := 5
Stat.Luck (2) := 150
Stat.Burst (2) := 2
Stat.Accuracy (2) := 50
Stat.Evasion (2) := 12
Stat.Block (2) := 20
Stat.Pierce (2) := 49
Stat.Money (2) := 0
Stat.XC (2) := 2
Stat.YC (2) := 5
for R : 1 .. 50
    Stat.Magic (2, R) := 1
    Stat.Skills (2, R) := 1
end for
Stat.Unseal (2) := 20

Stat.Level (3) := 1
Stat.Name (3) := "Hiyori"
Stat.Real (3) := true
Stat.Team (3) := 1
Stat.Picture (3) := HiyoriPic
Stat.Avatar (3) := HiyoriAva
Stat.Class (3) := "Phantom"
Stat.Race (3) := "Human"
Stat.Hp (3) := 82
Stat.THp (3) := 82
Stat.Mana (3) := 55
Stat.TMana (3) := 55
Stat.Attack (3) := 24
Stat.M_Attack (3) := 25
Stat.Defense (3) := 26
Stat.M_Defense (3) := 16
Stat.Speed (3) := 84
Stat.Turn (3) := 84
Stat.Resistance (3) := 3
Stat.Luck (3) := 130
Stat.Burst (3) := 4
Stat.Accuracy (3) := 25
Stat.Evasion (3) := 32
Stat.Block (3) := 34
Stat.Pierce (3) := 39
Stat.Money (3) := 1
Stat.XC (3) := 2
Stat.YC (3) := 3
for R : 1 .. 50
    Stat.Magic (3, R) := 1
    Stat.Skills (3, R) := 1
end for
Stat.Unseal (3) := 20

Stat.Level (4) := 1
Stat.Name (4) := "Nora"
Stat.Real (4) := true
Stat.Team (4) := 1
Stat.Picture (4) := NoraRealPic
Stat.Avatar (4) := NoraAva
Stat.Class (4) := "Gunner"
Stat.Race (4) := "Human"
Stat.Hp (4) := 87
Stat.THp (4) := 87
Stat.Mana (4) := 60
Stat.TMana (4) := 60
Stat.Attack (4) := 41
Stat.M_Attack (4) := 20
Stat.Defense (4) := 18
Stat.M_Defense (4) := 19
Stat.Speed (4) := 79
Stat.Turn (4) := 79
Stat.Resistance (4) := 9
Stat.Luck (4) := 125
Stat.Burst (4) := 4
Stat.Accuracy (4) := 38
Stat.Evasion (4) := 19
Stat.Block (4) := 3
Stat.Pierce (4) := 22
Stat.Money (4) := 12
Stat.XC (4) := 2
Stat.YC (4) := 2
for R : 1 .. 50
    Stat.Magic (4, R) := 1
    Stat.Skills (4, R) := 1
end for
Stat.Unseal (4) := 10

for SkillBasic : 1 .. 4
    for SB : 1 .. 4
	Stat.Skills (SkillBasic, SB) := 1
    end for
end for

% PARTY %************************************************%
Party.Size (1) := 6
Party.GMoney (1) := 200
Party.Level (1) := 1

Party.Size (3) := 3
Party.Level (3) := 3
Party.GMoney (1) := 5700

Party.Size (2) := 2
Party.GMoney (2) := Rand.Int (5, 25) * Party.Level (1)
Party.Level (2) := Party.Level (1)

% Allies %************************************************%

% 
Stat.Level (7) := Stat.Level (1)
Stat.Name (7) := ""
Stat.Real (7) := false
Stat.Team (7) := 3
Stat.Picture (7) := WolframPic
Stat.Avatar (7) := WolframAva
Stat.Class (7) := "Wolverine"
Stat.Race (7) := "Wolf"
Stat.Hp (7) := 110
Stat.THp (7) := 110
Stat.Mana (7) := 38
Stat.TMana (7) := 38
Stat.Attack (7) := 30
Stat.M_Attack (7) := 9
Stat.Defense (7) := 22
Stat.M_Defense (7) := 13
Stat.Speed (7) := 95
Stat.Turn (7) := 95
Stat.Resistance (7) := 5
Stat.Luck (7) := 69
Stat.Burst (7) := 4
Stat.Accuracy (7) := 50
Stat.Evasion (7) := 5
Stat.Block (7) := 5
Stat.Pierce (7) := 45
Stat.Money (7) := 14
Stat.XC (7) := 4
Stat.YC (7) := 3
for R : 1 .. 50
    Stat.Magic (16, R) := 0
    Stat.Skills (16, R) := 1
end for
Stat.Unseal (7) := 30

% 
Stat.Level (8) := Stat.Level (1)
Stat.Name (8) := ""
Stat.Real (8) := false
Stat.Team (8) := 3
Stat.Picture (8) := WolframPic
Stat.Avatar (8) := WolframAva
Stat.Class (8) := "Wolverine"
Stat.Race (8) := "Wolf"
Stat.Hp (8) := 110
Stat.THp (8) := 110
Stat.Mana (8) := 38
Stat.TMana (8) := 38
Stat.Attack (8) := 30
Stat.M_Attack (8) := 9
Stat.Defense (8) := 22
Stat.M_Defense (8) := 13
Stat.Speed (8) := 95
Stat.Turn (8) := 95
Stat.Resistance (8) := 5
Stat.Luck (8) := 69
Stat.Burst (8) := 4
Stat.Accuracy (8) := 50
Stat.Evasion (8) := 5
Stat.Block (8) := 5
Stat.Pierce (8) := 45
Stat.Money (8) := 14
Stat.XC (8) := 4
Stat.YC (8) := 3
for R : 1 .. 50
    Stat.Magic (16, R) := 0
    Stat.Skills (16, R) := 1
end for
Stat.Unseal (8) := 30

%
Stat.Level (9) := Stat.Level (1)
Stat.Name (9) := ""
Stat.Real (9) := false
Stat.Team (9) := 3
Stat.Picture (9) := WolframPic
Stat.Avatar (9) := WolframAva
Stat.Class (9) := "Wolverine"
Stat.Race (9) := "Wolf"
Stat.Hp (9) := 110
Stat.THp (9) := 110
Stat.Mana (9) := 38
Stat.TMana (9) := 38
Stat.Attack (9) := 30
Stat.M_Attack (9) := 9
Stat.Defense (9) := 22
Stat.M_Defense (9) := 13
Stat.Speed (9) := 95
Stat.Turn (9) := 95
Stat.Resistance (9) := 5
Stat.Luck (9) := 69
Stat.Burst (9) := 4
Stat.Accuracy (9) := 50
Stat.Evasion (9) := 5
Stat.Block (9) := 5
Stat.Pierce (9) := 45
Stat.Money (9) := 14
Stat.XC (9) := 4
Stat.YC (9) := 3
for R : 1 .. 50
    Stat.Magic (16, R) := 0
    Stat.Skills (16, R) := 1
end for
Stat.Unseal (9) := 30

%   *****%%%%%%%%%%%%% Enemies %%%%%%%%%%%%%%*****
proc CycleNames (ID : int)
    if GenericInt = 1 then
	Stat.Name (ID) := "Rebenir"
    elsif GenericInt = 2 then
	Stat.Name (ID) := "Wahztak"
    elsif GenericInt = 3 then
	Stat.Name (ID) := "Mahdun"
    elsif GenericInt = 4 then
	Stat.Name (ID) := "Vil'ska"
    elsif GenericInt = 5 then
	Stat.Name (ID) := "Hajukin"
    elsif GenericInt = 6 then
	Stat.Name (ID) := "Agongstaon"
    elsif GenericInt = 7 then
	Stat.Name (ID) := "Rebounds"
    elsif GenericInt = 8 then
	Stat.Name (ID) := "Forlan"
    elsif GenericInt = 9 then
	Stat.Name (ID) := "Hoar"
    elsif GenericInt = 10 then
	Stat.Name (ID) := "Bejin-Bastus"
    elsif GenericInt = 11 then
	Stat.Name (ID) := "Whumin Izer"
    elsif GenericInt = 12 then
	Stat.Name (ID) := "Hay Flick Lims"
    elsif GenericInt = 13 then
	Stat.Name (ID) := "Shetrista"
    elsif GenericInt = 14 then
	Stat.Name (ID) := "Miguello"
    elsif GenericInt = 15 then
	Stat.Name (ID) := "Yufan"
    elsif GenericInt = 16 then
	Stat.Name (ID) := "Din Shing"
    elsif GenericInt = 17 then
	Stat.Name (ID) := "Li Jue"
    elsif GenericInt = 18 then
	Stat.Name (ID) := "Gongsun Zan"
    elsif GenericInt = 19 then
	Stat.Name (ID) := "Direggs"
    elsif GenericInt = 20 then
	Stat.Name (ID) := "Harper"
    elsif GenericInt = 21 then
	Stat.Name (ID) := "Mastix"
    elsif GenericInt = 22 then
	Stat.Name (ID) := "xXSupra-DarkXx"
    elsif GenericInt = 23 then
	Stat.Name (ID) := "Meliggs"
    elsif GenericInt = 24 then
	Stat.Name (ID) := "Felissa"
    elsif GenericInt = 25 then
	Stat.Name (ID) := "Feliks"
    elsif GenericInt = 26 then
	Stat.Name (ID) := "Alin Tera"
    elsif GenericInt = 27 then
	Stat.Name (ID) := "Cellens"
    elsif GenericInt = 28 then
	Stat.Name (ID) := "Kan Maeja"
    elsif GenericInt = 29 then
	Stat.Name (ID) := "Soi N'in jun"
    elsif GenericInt = 30 then
	Stat.Name (ID) := "Tear"
    elsif GenericInt = 31 then
	Stat.Name (ID) := "Time Flies"
    elsif GenericInt = 32 then
	Stat.Name (ID) := "Grave Digger"
    elsif GenericInt = 33 then
	Stat.Name (ID) := "Northern Nightmare"
    elsif GenericInt = 34 then
	Stat.Name (ID) := "Gastrous"
    elsif GenericInt = 35 then
	Stat.Name (ID) := "Ten Dimes"
    elsif GenericInt = 36 then
	Stat.Name (ID) := "Critefol"
    elsif GenericInt = 37 then
	Stat.Name (ID) := "Lyrndol"
    elsif GenericInt = 38 then
	Stat.Name (ID) := "Rahetel"
    elsif GenericInt = 39 then
	Stat.Name (ID) := "Feun Tisc"
    elsif GenericInt = 40 then
	Stat.Name (ID) := "Felippe Br"
    elsif GenericInt = 41 then
	Stat.Name (ID) := "Vordell"
    elsif GenericInt = 42 then
	Stat.Name (ID) := "Meh Ai Koto"
    elsif GenericInt = 43 then
	Stat.Name (ID) := "Jistos"
    elsif GenericInt = 44 then
	Stat.Name (ID) := "Pak Mooy"
    elsif GenericInt = 45 then
	Stat.Name (ID) := "Rivuls"
    elsif GenericInt = 46 then
	Stat.Name (ID) := "Je'xclim"
    elsif GenericInt = 47 then
	Stat.Name (ID) := "Gobalani - He'irstos"
    elsif GenericInt = 48 then
	Stat.Name (ID) := "Roojit"
    elsif GenericInt = 49 then
	Stat.Name (ID) := "Xerstohs"
    elsif GenericInt = 50 then
	Stat.Name (ID) := "Oslo in the Sanctuary"
    end if
end CycleNames

% Human
GenericInt := Rand.Int (1, 50)
Stat.Level (11) := Stat.Level (1)
CycleNames (11)
Stat.Real (11) := true
Stat.Team (11) := 3
Stat.Picture (11) := GobassassinPic
Stat.Avatar (11) := GobassassinAva
Stat.Class (11) := "Assassin"
Stat.Race (11) := "Human"
Stat.Hp (11) := 58
Stat.THp (11) := 58
Stat.Mana (11) := 42
Stat.TMana (11) := 42
Stat.Attack (11) := 29
Stat.M_Attack (11) := 23
Stat.Defense (11) := 13
Stat.M_Defense (11) := 23
Stat.Speed (11) := 76
Stat.Turn (11) := 76
Stat.Resistance (11) := 2
Stat.Luck (11) := 160
Stat.Burst (11) := 6
Stat.Accuracy (11) := 34
Stat.Evasion (11) := 36
Stat.Block (11) := 24
Stat.Pierce (11) := 29
Stat.Money (11) := 25
Stat.XC (11) := 3
Stat.YC (11) := 3
for R : 10 .. 50
    Stat.Magic (11, R) := 0
    Stat.Skills (11, R) := 1
end for
Stat.Unseal (11) := 10


% Gnoll Enemy
GenericInt := Rand.Int (1, 50)
Stat.Level (10) := Stat.Level (1)
CycleNames (10)
Stat.Real (10) := true
Stat.Team (10) := 3
Stat.Picture (10) := GnollPic
Stat.Avatar (10) := GnollAva
Stat.Class (10) := "Swords"
Stat.Race (10) := "Gnoll"
Stat.Hp (10) := 65
Stat.THp (10) := 65
Stat.Mana (10) := 20
Stat.TMana (10) := 45
Stat.Attack (10) := 15
Stat.M_Attack (10) := 10
Stat.Defense (10) := 10
Stat.M_Defense (10) := 10
Stat.Speed (10) := 99
Stat.Turn (10) := 99
Stat.Resistance (10) := 4
Stat.Luck (10) := 105
Stat.Burst (10) := 3
Stat.Accuracy (10) := 25
Stat.Evasion (10) := 15
Stat.Block (10) := 15
Stat.Pierce (10) := 14
Stat.Money (10) := 11
Stat.XC (10) := 3
Stat.YC (10) := 3
for R : 10 .. 50
    Stat.Magic (10, R) := 0
    Stat.Skills (10, R) := 0
end for
Stat.Unseal (10) := 10

% Wolfram
GenericInt := Rand.Int (1, 50)
Stat.Level (16) := Stat.Level (1)
CycleNames (16)
Stat.Real (16) := true
Stat.Team (16) := 3
Stat.Picture (16) := WolframPic
Stat.Avatar (16) := WolframAva
Stat.Class (16) := "Wolverine"
Stat.Race (16) := "Wolf"
Stat.Hp (16) := 110
Stat.THp (16) := 110
Stat.Mana (16) := 38
Stat.TMana (16) := 38
Stat.Attack (16) := 30
Stat.M_Attack (16) := 9
Stat.Defense (16) := 22
Stat.M_Defense (16) := 13
Stat.Speed (16) := 95
Stat.Turn (16) := 95
Stat.Resistance (16) := 5
Stat.Luck (16) := 69
Stat.Burst (16) := 4
Stat.Accuracy (16) := 50
Stat.Evasion (16) := 5
Stat.Block (16) := 5
Stat.Pierce (16) := 45
Stat.Money (16) := 14
Stat.XC (16) := 4
Stat.YC (16) := 3
for R : 1 .. 50
    Stat.Magic (16, R) := 0
    Stat.Skills (16, R) := 1
end for
Stat.Unseal (9) := 30

% Karlan
GenericInt := Rand.Int (1, 50)
Stat.Level (12) := Stat.Level (1)
CycleNames (12)
Stat.Real (12) := true
Stat.Team (12) := 3
Stat.Picture (12) := KarlanPic
Stat.Avatar (12) := KarlanAva
Stat.Class (12) := "Beserker"
Stat.Race (12) := "Human"
Stat.Hp (12) := 103
Stat.THp (12) := 103
Stat.Mana (12) := 27
Stat.TMana (12) := 27
Stat.Attack (12) := 27
Stat.M_Attack (12) := 21
Stat.Defense (12) := 10
Stat.M_Defense (12) := 5
Stat.Speed (12) := 91
Stat.Turn (12) := 91
Stat.Resistance (12) := 3
Stat.Luck (12) := 100
Stat.Burst (12) := 4
Stat.Accuracy (12) := 39
Stat.Evasion (12) := 37
Stat.Block (12) := 16
Stat.Pierce (12) := 38
Stat.Money (12) := 24
Stat.XC (12) := 4
Stat.YC (12) := 3
for R : 10 .. 50
    Stat.Magic (12, R) := 0
    Stat.Skills (12, R) := 1
end for
Stat.Unseal (12) := 25

% Minst
GenericInt := Rand.Int (1, 50)
Stat.Level (13) := Stat.Level (1)
CycleNames (13)
Stat.Real (13) := true
Stat.Team (13) := 3
Stat.Picture (13) := MinstPic
Stat.Avatar (13) := MinstAva
Stat.Class (13) := "Acolyte"
Stat.Race (13) := "Wyvern"
Stat.Hp (13) := 70
Stat.THp (13) := 70
Stat.Mana (13) := 65
Stat.TMana (13) := 65
Stat.Attack (13) := 13
Stat.M_Attack (13) := 23
Stat.Defense (13) := 9
Stat.M_Defense (13) := 16
Stat.Speed (13) := 79
Stat.Turn (13) := 79
Stat.Resistance (13) := 7
Stat.Luck (13) := 80
Stat.Burst (13) := 2
Stat.Accuracy (13) := 40
Stat.Evasion (13) := 10
Stat.Block (13) := 2
Stat.Pierce (13) := 55
Stat.Money (13) := 30
Stat.XC (13) := 4
Stat.YC (13) := 3
for R : 10 .. 50
    Stat.Magic (13, R) := 1
    Stat.Skills (13, R) := 0
end for
Stat.Unseal (13) := 0

% Radshuan
GenericInt := Rand.Int (1, 50)
Stat.Level (14) := Stat.Level (1)
CycleNames (14)
Stat.Real (14) := true
Stat.Team (14) := 3
Stat.Picture (14) := RadShuanPic
Stat.Avatar (14) := RadShuanAva
Stat.Class (14) := "Taggerung"
Stat.Race (14) := "Leopard"
Stat.Hp (14) := 770
Stat.THp (14) := 770
Stat.Mana (14) := 100
Stat.TMana (14) := 100
Stat.Attack (14) := 23
Stat.M_Attack (14) := 19
Stat.Defense (14) := 16
Stat.M_Defense (14) := 14
Stat.Speed (14) := 110
Stat.Turn (14) := 110
Stat.Resistance (14) := 20
Stat.Luck (14) := 25
Stat.Burst (14) := 5
Stat.Accuracy (14) := 35
Stat.Evasion (14) := 20
Stat.Block (14) := 17
Stat.Pierce (14) := 26
Stat.Money (14) := 56
Stat.XC (14) := 4
Stat.YC (14) := 3
for R : 10 .. 50
    Stat.Magic (14, R) := 1
    Stat.Skills (14, R) := 1
end for
Stat.Unseal (14) := 3

% Orlan
GenericInt := Rand.Int (1, 50)
Stat.Level (15) := Stat.Level (1)
CycleNames (15)
Stat.Real (15) := true
Stat.Team (15) := 3
Stat.Picture (15) := OrlanPic
Stat.Avatar (15) := OrlanAva
Stat.Class (15) := "Taggerung"
Stat.Race (15) := "Otter"
Stat.Hp (15) := 125
Stat.THp (15) := 125
Stat.Mana (15) := 33
Stat.TMana (15) := 33
Stat.Attack (15) := 25
Stat.M_Attack (15) := 23
Stat.Defense (15) := 11
Stat.M_Defense (15) := 12
Stat.Speed (15) := 130
Stat.Turn (15) := 130
Stat.Resistance (15) := 9
Stat.Luck (15) := 153
Stat.Burst (15) := 3
Stat.Accuracy (15) := 44
Stat.Evasion (15) := 24
Stat.Block (15) := 12
Stat.Pierce (15) := 48
Stat.Money (15) := 42
Stat.XC (15) := 4
Stat.YC (15) := 3
for R : 10 .. 50
    Stat.Magic (15, R) := 1
    Stat.Skills (15, R) := 1
end for
Stat.Unseal (15) := 20

