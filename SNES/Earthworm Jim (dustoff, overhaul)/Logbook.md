# Earthworm Jim (SNES) - Dustoff logbook

## General notes, hurdles

The existing set was relying heavily on some magic values to identify when a level was won, i.e. some 8-bit value was 0x33 when in fact that is the top part of a 16-bit value which increases from 0x32xx to over 0x3300. I replaced those by a check on the transition between levels. It means the actual unlock happens a bit later.

I wanted to adapt the boss achievements to be based on the boss HP. 
This revealed several issues with the game memory:
- most entities have decreasing HP but reaching 0 does not kill them, it actually takes one more hit for them to be dead, without further change in HP which stays at 0, this means relying on the entity unloading, which could easily trigger by mistake during a reload after the player death
- some entities have increasing hit count instead of decreasing HP, for those there is actually a value which kills them when met, which would have worked BUT...
- entities are actually stacked in an array and the position of an entity is not guaranteed (not even for bosses); the only way to know which entity we have in a slot is to check the sprite ID (no, really, freezing one before a savestate reload actually morphs an entity and its behaviour to another) BUT due to animation sprite IDs for a single entity are numerous and the range for a single entity is not continous, which means we cannot "win" by using comparisons, we would have to enumerate each sprite for the target boss and check each array slot, which imply a nightmare of Alts

This was really frustrating, especially since I discovered the fridge to launch the cow for the very first achievement is actually an entity with HP and I was thrilled to have the same logics as a boss fight.

Anyway, to circumvent these limitations I had to get creative:
- some bosses fight lock the camera in an otherwise larger map -> the logic relies on the camera unlock
- some bosses have an intrinsic level ID -> the logic relies on level transition
- some bosses are the final step towards winning a level -> le logic relies on level transition

## General modifications

### Common edits to achievements

A in-game check has been added. It checks that:
- we are in a gameplay state
- we are not in demo mode

The cheat protection is more comprehensive than before. 

Also it was based on checkpoints (one for starting the playthrough, one for playing the previous map) to avoid level selection/skiping cheats. Contrary to what's describe in The Nick Trick (27743), this specific cheat did not disable any achievements.

Now it is pause based to avoid stored hits and the pause resets on main menu (but will be reapplied immediately by persisting cheats). It feels saner and will prevent level selection/skipping where needed just as efficiently. Also, The Nick Trick cheat is now doing a pause a well.

### Rich Presence
Rich presence was only dynamic and displaying level and lives (lives were parsed through a lookup).

Actions taken:
- Added a static default RP
- Added two dynamic cases: main menu & demo
- Replaced lives lookup by a lower4 read
- Added difficulty setting, current HP and cheat usage to the display

### Hidden leaderboards
Most cheats are detectable at the moment they are used but don't leave a trace in memory after that.
Two hidden leaderboards have been added to track them to help with potential future tickets:
- a cheat that does not involve level selection or skipping has been used (i.e. all achievements are paused)
- a cheat that involved level selection or skipping has been used (i.e. most achievements are paused but some challenges are not)

## Specific edits
### Not-So-Ground Beef (27712)
- changed the logic that was based on displayed text to rather trigger based on the camera unlock after the sequence

### The Rotten Apple, Fire and Jimstone, Slippery When Wet, Bowl-ing Alley, Beware of Dog, Junk Food, Fish out of Water (27713, 27715, 27716, 27717, 27721, 27724, 27728) 
- changed the logic that was based on the win animation in the considered map (no delta) to one based on the level ID transition

### Galactic Rodeo (27714)
- removed the progression tag since it is 100% missable
- added the missable tag
- changed the logic from using the win animation to using the level ID transition
- fixed the logic that only allowed it to trigger on the first "Andy Asteroids?" race while the description is open to it unlocking on any of those races

### Every Once in a Bile, I Smell a Lab Rat, As the Crow Flies, A Snowball's Chance, Pussyfooting, Phlegm Cell Research, Flightless Birdbrain (27718, 27719, 27725, 27726, 27727, 27729, 27730) 
- was based on boss HP, which is not in a guaranteed spot (hence not a reliable source of information)
- is now using the level ID transition

### Left in the Dark (27720)
- added a missable tag since it can be skipped if you don't know to look for it and does not allow level selection for a retry
- changed the logic that was based on a non-documented animation value in the considered map (no delta) to one based on the level ID transition

### The (Rear) End, The Grooviest Victory!  (27722, 27732)
- was based on several undocumented magic values
- is now based on the camera traveling and locking to the boss final demise

### Re-tire-ment Plan, Buttville Slugger (27723, 27731)
- replace the check on a magic value (no delta) to rather trigger based on the camera unlock after the sequence

### Down in the Dumps (27733)
- removed the logic based on several not-all-documented magic values
- new logic based on a "position window" before the teleport and the exact position Jim is teleported to

### Kicking Some Asteroid (27734)
- changed the logic from using the win animation to using the level ID transition

### Worms in Glass Houses (27735)
- was not a big fan of the current logic using the pod HP since it is not in a guaranteed spot; still, no tickets for years and recent unlocks so I kept it that way
- removed the checkpoint for entering the pod in the first place since it would prevent a retry from a continue and did not really serve a purpose

### Thoughtful Pet Owner, Dog-Eat-Worm World (27736, 27745)
- changed the logic that was based on the win animation in the considered map (no delta) to one based on the level ID transition
- not a fan of the logic based on the "state" of the Dog entity since usually entities position in memory is not guaranteed but I couldn't see how to avoid this with regards to what the achievements ask of the player and it seems stable in this instance (which makes sense since the dog is loaded with the level) => it's been kept
- removed the two magic values which were not stable and are likely what led to tickets
- for Dog-Eat-Worm World: added a note in the description that level selection/skipping is allowed to fit the logic

### Heading for Trouble (27737)
- removed the hit target of 1 on the trigger condition
- removed the checkpoint on the magic value supposed to represent the cow being launched (like, what was that doing here ?!)
- added a delta check

### Invincible Invertebrate, The Nick Trick (27738, 27743)
- introduced a delta check

### When Heck Freezes Over (27744)
- added a missable tag
- reworded the achievement to fit the actual logics: the player does not need to complete the level but merely to reach the Cat fight without every entering the 
- replaced the logic based on a magic value to have a "beginning of the level checkpoint" with a logic based on pausing the achievement if the player enters the snowman room

### The Bigger They Are, The Harder They Fall, Work with What You Got, Don't Try This at Home!, Scratch Beneath the Surface (27739, 27740, 27741, 27742, 27747)
- replaced the double 8-bit read of what is really a 16-bit value by a 16-bit read
- introduced a delta check