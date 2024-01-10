% Basic code

for i : 1 .. 5
    AMSUI (i) := false
end for
for k : 1 .. 10
    for p : 1 .. 50
    Item_Class (k,p) := 0
    end for
end for

proc Cursor (X, Y, B : int)
    var MC : int := 54
    if B = 1 then
	MC := 39
    end if
    Draw.Box (X-6, Y-6, X+6, Y+6, MC - 5)
    Draw.Box(X-7, Y-7, X+7, Y+7, MC)
    Draw.Line (X, Y - 7, X, Y + 7, 0)
    Draw.Line (X - 7, Y, X + 7, Y, 0)
end Cursor

proc CursorErase (X, Y, B : int)
    Draw.Oval (X, Y, 7, 7, 0)
    Draw.Oval (X, Y, 6, 6, 0)
end CursorErase

proc AreaDraw (PosX, PosY, ColO : int)
    Draw.FillOval (PosX, PosY, 30, 30, ColO)
    Draw.Oval (PosX, PosY, 30, 30, 77)
    Draw.Oval (PosX, PosY, 28, 28, 76)
end AreaDraw

proc AreaClick (PosX, PosY, ColO : int)
    Draw.FillOval (PosX, PosY, 30, 30, ColO)
    Draw.Oval (PosX, PosY, 30, 30, 104)
    Draw.Oval (PosX, PosY, 28, 28, 147)
end AreaClick

proc Ball (L, BarX, BarY, BarX2, BarY2 : int)
    Bx (L) += RandomX (L)
    By (L) += RandomY (L)
    if Bx (L) - BarX < 4 then
	RandomX (L) := Rand.Int (1, 3)
    end if
    if BarX2 - Bx (L) < 4 then
	RandomX (L) := Rand.Int (-3, -1)
    end if
    if By (L) - BarY < 4 then
	RandomY (L) := Rand.Int (1, 3)
    end if
    if BarY2 - By (L) < 4 then
	RandomY (L) := Rand.Int (-3, -1)
    end if
    if L div 3 = 1 then
	Draw.Oval (Bx (L), By (L), 2, 2, Coleur)
    elsif (L + 1) div 3 = 1 then
	Draw.Oval (Bx (L), By (L), 2, 2, Coleur + 40)
    else
	Draw.Oval (Bx (L), By (L), 2, 2, 79 + Coleur)
    end if
end Ball


