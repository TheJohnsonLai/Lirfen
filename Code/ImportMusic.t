var MusicTrack : array 1 .. 25 of string
var TrackPlaying : array 1 .. 25 of boolean

MusicTrack (1) := "Music\\Cat, Glass, Moon.mp3"
MusicTrack (2) := "Music\\Eternity.mp3"
MusicTrack (3) := "Music\\Night of Nights.mp3"
MusicTrack (4) := "Music\\Shakugan No Shana OP 1-4.mp3"
MusicTrack (5) := "Music\\Shakugan Instrumental.mp3"
MusicTrack (6) := "Music\\Grief.mp3"
MusicTrack (7) := "Music\\Sociometry.mp3"
MusicTrack (8) := "Music\\Blaze.mp3"
MusicTrack (9) := "Music\\WataMote ED.mp3"
MusicTrack (10) := "Music\\Grimoire.mp3"
MusicTrack (11) := "Music\\Premonition.mp3"
MusicTrack (12) := "Music\\Words that were put together.mp3"
MusicTrack (13) := "Music\\Where the wind reaches.mp3"
MusicTrack (14) := "Music\\Newborn wind.mp3"
MusicTrack (15) := "Music\\Promise.mp3"
MusicTrack (16) := "Music\\The Place Where the Wind Arrives.mp3"
MusicTrack (17) := "Music\\Eternal.mp3"
MusicTrack (18) := "Music\\Kotoba.mp3"
MusicTrack (19) := "Music\\Memory.mp3"
MusicTrack (20) := "Music\\Summer Lights.mp3"
MusicTrack (21) := "Music\\Remnants of a dream.mp3"
MusicTrack (22) := "Music\\Winter Fireworks.mp3"
MusicTrack (23) := "Music\\Saya's Song.mp3"
MusicTrack (24) := "Music\\Higurashi - Why or why not.mp3"
MusicTrack (25) := "Music\\Kanon, The Complete OST.mp3"

for k : 1 .. 25
    if k not= 4 then
	TrackPlaying (k) := false
    else
	TrackPlaying (k) := true
    end if
end for

process PlayMusic (Chosen : int)
    for M : 1 .. 25
	if M not= Chosen then
	    TrackPlaying (M) := false
	else
	    TrackPlaying (M) := true
	end if
    end for
    for MusicList : 1 .. 25
	if MusicList = Chosen then
	  %  loop
		Music.PlayFileReturn (MusicTrack (MusicList))
	   %    View.Update
	   %     exit when TrackPlaying (MusicList) = false
	   % end loop
	end if
    end for
end PlayMusic
