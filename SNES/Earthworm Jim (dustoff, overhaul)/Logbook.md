# Earthworm Jim (SNES) - Dustoff logbook

## General improvements

### Common edits to achievements

A in-game check has been added. It checks that:
- we are in a gameplay state
- we are not in demo mode

### Beat the boss achievement

For end of level bosses instead of relying on some kind of magic data we focus on the level transition.

### Rich Presence
Rich presence was only dynamic and displaying level and lives (lives were parsed through a lookup).

Actions taken:
- Added a static default RP
- Added two dynamic cases: main menu & demo
- Replaced lives lookup by a lower4 read
- Added difficulty setting, current HP and cheat usage to the display

## Specific edits
### Not-So-Ground Beef (27712)
| Issue | Action |
|-|-|
|Triple check of the map ID, two of which based on magic values | Removed the two magic checks |
| Unlock based on displayed sprites and without a delta | Replaced with a check on the camera being unlocked (which is the actual thing which forces us to throw the cow away in the first place) |

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