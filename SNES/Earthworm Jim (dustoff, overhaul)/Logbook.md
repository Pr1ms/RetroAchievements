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

## General improvements

### Common edits to achievements

A in-game check has been added. It checks that:
- we are in a gameplay state
- we are not in demo mode

The cheat protection is more comprehensive than before.

### Beat the boss achievements

See "General notes, hurdles" above.

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
| Issue | Action |
|-|-|
|Triple check of the map ID, two of which based on magic values | Removed the two magic checks |
| Unlock based on displayed sprites and without a delta | Unlock based on the "boss" HP since the fridge is treated as a boss in this sequence |

### The Bigger They Are / The Harder They Fall / Work with What You Got / Don't Try This at Home! / Scratch Beneath the Surface (27739, 27740, 27741, 27742, 27747)
| Issue | Action |
|-|-|
| Data is 16 bits and logics uses two byte reads | Using a 16-bit read |
| No delta check | Using the proper previous state for each animation |

### The Rotten Apple (27713)
| Issue | Action |
|-|-|
| Multiple checks of zone ID with stored hits | Kept the same solid address as everywhere, removed weird redundancies with hits |
| Unlock based on a secondary sprite address with no delta check | Unlock based on the level transition |