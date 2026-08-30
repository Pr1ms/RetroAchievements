# The Smurfs (MD) - Overhaul and repairs

## General notes

The code notes were lacking to say the least: no sizes, most where in French, values were not detailed, etc.

Generally speaking, the achievements were heavily relying on hits and resets. A typical achievment would look like so:
```
1		    Mem	8-bit	Fil rouge	        =	Value		    0x00000000	    (1)
2		    Mem	8-bit	Act	                =	Value		    Act 1 - Village	(1)
3		    Mem	8-bit	End of stage	    =	Value		    0x00000001	    (1)
4		    Mem	8-bit	Fil rouge	        >	Delta	8-bit	Fil rouge	    (1)
5	ResetIf	Mem	8-bit	Time out = ff	    =	Value		    0x000000ff	    (0)
6	ResetIf	Mem	8-bit	D????bug mode = ff	=	Value		    0x000000ff	    (0)
7	ResetIf	Mem	8-bit	Act	                !=	Value		    Act 1 - Village	(0)
```

The main issue with that template is that by dying in the current map of an act we unlock all achievements tied to finishing the act in question.

Since the set was being fixed I asked the writing team to do a pass on it (it was full grammar and spelling errors and was overall not respecting the writing guidelines). Titles and descriptions have therefore been edited as well.

## General modifications

### Presentation, Metadata

Added a game banner to the game page.
Added the "Based on a Comic" hub.

### Common edits to achievements

First thing first: debug mode is enabled via a cheat at startup and stays up for the whole gaming session after that. No need to based a reset upon it. I've changed it all to just check that is was not `0xff`.

Second thing: I removed all hits and also reversed the timeout check to not have it be a resetIf.

Finally, instead of using a end of stage flag and a "fil rouge" transition (no actual idea what this address was supposed to be doing), neither of which did not seem very reliable I've based my unlocked on map transition.

The way the game works tracks both an act and a map but maps aren't relative to the acts, it's actually a global enum. Nice thing is: the map transition happens when you end a map (even if it's the last map of its act) while the act transition only happens when the game zooms out to the world to showcase the next act's title.

Therefore, the good timing for unlocks is when the game switches to the first map of the next act.
Added bonus: this transition does not need to have the "no timeout" protection.

### Challenges
The hitless bosses were using an address documented as "End boss and password screen" when it reaches `0xff` this is obviously display data (likely a black pixel from the cutscenes following the liberation of a smurf). Since the unlock happened at the end of the level already (and not at the boss' death), they've been switched to the same logic as progression ones.

I've chosen to use a pauseLock logic so they ressemble their "non challenging" counterparts as much as possible.

### Overdose and Mario Would be Proud
Those two were using hit counts for elements that are tracked in memory at all times. I've switched the logic to tracking the current value instead.

### Rich Presence
The game had no rich presence. Added a dynamic RP displaying the Act, difficulty, extra lives and current score.
Added a mention of using debug mode as well.

### Leaderboards
That's besides the remit of the repairs but since adding leaderboards to sets with no active devs is allowed without a revision claim I've added one leaderboard for score per difficulty level to double dip with DQ14.

### Special mention to #28015
Although it was demoted for instabilities I've also repaired achievement #28015 (Can i have a little Smurf?) so that it could be "revived" in someone goes through a revision of this set at some point in the future.