# Plan
- code note rewriting
- logics update to modern standards
- logics correction when it is functionnaly wrong (example with achievement 4316)
- demo protection (which does not seem to exist right now since measured cheevos get updates during the demo)
- a bit of description rewording to better fit the actual underlying logic
- RP improvement (score, boss fight)
- reordering the achievements to have the progression on top (not sure if that falls into the remit of  a dustoff)
- As per the docs we should not measure anything that is easily accessible in-game. All measured values for this set are actually displayed on screen at all times. Therefore the measured flag seems redundant. => I'd remove the measured entirely and, for the three achievement that imply stockpiling ammunition (which makes them missable in a sense), I'd add a missable tag and trigger flag as a replacement

TODO:
- make the "score" leaderboards be instant submits
- score achievements should read "at least" 

## Code notes
Unused addresses with unclear description have been removed.

Unused addresses with clear code notes have been rewritten when they were missing something (size, possible values and their meaning, etc.).

Addresses with size and proper description have been kept as-is.

## Rich presence
Added a default static RP.

Added the score to the RP and added more precision to the location mainly to tell if the player is in a boss fight.

## Leaderboards
Three leaderboards have had "speedrun" capitalized in their titles: 142118, 142119 and 142120

## Achievements

### Global changes
All achievements have been demo-mode protected.

All measured flags have been removed from the achievements since the measured values were actually displayed in the game UI at all times.

Achievements about stockpiling items (i.e. ammunition) have their mesured flag replaced by a trigger flag and a missable tag so that the player is made aware that they shouldn't use the items as projectiles if they want to unlock the achievment.

### Specific changes
