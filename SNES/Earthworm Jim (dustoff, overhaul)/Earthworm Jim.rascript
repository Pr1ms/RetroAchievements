// Earthworm Jim
// #ID = 889

/** TODO(Prims):
   [ ] Make savestates for reproducting open tickets to check if my edits actually solve them
   [ ] Full RAM Redig
   [ ] Rewrite achievements to standards and upon reliable RAM addresses
   [ ] Add Demo protection (for Pete's Sake displays a primed achievement)
   [ ] Check/add cheat protection where relevant
   [ ] Improve RP to sort titles, demo, etc. and add a default RP
*/


level = {
    0x0000: "bouncing on old tires in New Junk City",
    0x0001: "feeling hot in What the Heck?",
    0x0002: "fighting Rusty the Snowman",
    0x0003: "fighting Evil the Cat",
    0x0004: "bungee jumping in Snot a Problem: Round 1",
    0x0005: "bungee jumping in Snot a Problem: Round 2",
    0x0006: "bungee jumping in Snot a Problem: Round 3",
    0x0007: "escorting Peter Puppy in For Pete's Sake",
    0x0008: "exploring Buttville",
    0x0009: "using his head in Buttville",
    0x000A: "exploring Level 5",
    0x000B: "fighting Chicken Wing",
    0x000C: "trying to get back to his suit in Level 5",
    0x000D: "wandering Down the Tubes",
    0x000E: "racing for his life in the Tube Race",
    0x000F: "racing Psycrow in Andy Asteroids?",
    0x0010: "racing Psycrow in Andy Asteroids?",
    0x0011: "racing Psycrow in Andy Asteroids?",
    0x0012: "racing Psycrow in Andy Asteroids?",
    0x0013: "racing Psycrow in Andy Asteroids?",
    0x0014: "racing Psycrow in Andy Asteroids?",
    0x0015: "not Alone in the Dark",
    0x0016: "not Alone in the Dark",
    0x0017: "not Alone in the Dark",
    0x0018: "not Alone in the Dark",
    0x0019: "not Alone in the Dark",
    0x001A: "fighting Psycrow!"
}

difficulty = {
    0x00: "Practice",
    0x01: "Normal",
    0x02: "Difficult"
}

function inGame() => high4(0x6620) == 3 && byte(0x6B8E) == 0

// The following can be detected while being used
function notCommonForbiddenCodes() => disable_when(word(0x50B8) == 0xFFFF) &&  // Map View Mode Cheat
                                   disable_when(word(0x50C0) != 0 && prev(word(0x00516C)) < word(0x00516C)) && // Extra Continue Cheat
                                   disable_when(word(0x50C0) != 0 && prev(low4(0x005162)) < low4(0x005162)) && // Extra Life Cheat
                                   disable_when(word(0x50C0) != 0 && prev(low4(0x006627)) < low4(0x006627)) && // Energy Refill Cheat
                                   disable_when(word(0x50C0) != 0 && prev(low4(0x006620)) < low4(0x006620)) && // Ammo Refill Cheat
                                   disable_when(word(0x50C0) != 0 && prev(word(0x0069A0)) < word(0x0069A0)) && // Plasma Power-Up Cheat
                                   disable_when(word(0x5142) == 0xFFFF) &&  // Debug View: Freezeability
                                   disable_when(word(0x5144) == 0xFFFF) && // Debug View: Cheat Mode                                                
                                   (always_false() || never(high4(0x6620) == 0))

// For map selection, there are several possibilities
// - via the debug menu we end up in the main menu with a non 0x00 level value AND word(0x50C0) == 0xFFFF
// - via a specific level cheat we have word(0x50C0) == 0xFFFF during the whole win/loading screens
// - via the level skip cheat we have word(0x50C0) == 0xFFFF during the whole win/loading screens
// Protection for progression achievements then only consist in checking word(0x50C0) not being 0xFFFF,

// Since some traces of cheats only last a few freames we cannot track it in RP. Instead we will use hidden leaderboards to prevent wrongful tickets in the future

function notAnyCheat() => notCommonForbiddenCodes() && word(0x50C0) != 0xFFFF

// TODO: find a mainMenu/in game flag
rich_presence_conditional_display(high4(0x6620) == 0, "In Main Menu")
rich_presence_conditional_display(byte(0x6B8E) == 1, "In Demo Mode")
  
rich_presence_conditional_display(inGame() && (word(0x50B8) == 0xFFFF || word(0x5142) == 0xFFFF || word(0x5144) == 0xFFFF || word(0x50C0) == 0xFFFF), "Jim is {0} ({1}) - HP: {2}% - Lives: {3} - Using Cheats",
                                  rich_presence_lookup("Level", word(0x512A), level),
                                  rich_presence_lookup("Difficulty", word(0x5146), difficulty),
                                  rich_presence_value("VALUE", low4(0x6627) * 100 + low4(0x6628) * 10 + low4(0x6629)),
                                  rich_presence_value("VALUE",low4(0x5162))
)

rich_presence_conditional_display(inGame(), "Jim is {0} ({1}) - HP: {2}% - Lives: {3}",
                                  rich_presence_lookup("Level", word(0x512A), level),
                                  rich_presence_lookup("Difficulty", word(0x5146), difficulty),
                                  rich_presence_value("VALUE", low4(0x6627) * 100 + low4(0x6628) * 10 + low4(0x6629)),
                                  rich_presence_value("VALUE",low4(0x5162))
)


rich_presence_display("Playing Earthworm Jim")

achievement(
    title = "Not-So-Ground Beef", points = 5, type="progression",
    description = "Launch the cow in New Junk City",
    id = 27712, badge = "28222",
    trigger = notAnyCheat() && inGame() && word(0x00512A) == 0x0000 && 
              word(0x6890) == 0x0370 && word(0x6892) == 0x0215 &&
              prev(word(0x6894)) == 0xFFFF && word(0x6894) == 0x0000
)

achievement(
    title = "The Rotten Apple", points = 10, type="progression",
    description = "Complete New Junk City",
    id = 27713, badge = "28190", 
    trigger = inGame() && word(0x512A) == 0x00 && prev(word(0x00519E)) == 0x1707 && word(0x00519E) == 0x18BF
)

achievement(
    title = "Galactic Rodeo", points = 10, 
    type="missable",
    description = "Win an Andy Asteroids? race",
    id = 27714, badge = "28196", 
    trigger = byte(0x00512A) == 15 && byte(0x00519B) == 55
)

achievement(
    title = "Fire and Jimstone", points = 10, type="progression",
    description = "Complete What the Heck?",
    id = 27715, badge = "28197", 
    trigger = byte(0x00512A) == 3 && byte(0x00519B) == 51 && byte(0x005144) != 255 && once(byte(0x00698A) == 29) &&
              once(byte(0x00512A) == 0) && once(byte(0x00512A) == 15) && never(byte(0x0050B8) == 255) &&
              never(byte(0x0050D0) != 0) && byte(0x0050B6) != 1 && never(byte(0x0050C0) == 7) &&
              never(byte(0x005164) == 255)
)

achievement(
    title = "Slippery When Wet", points = 10, type="progression",
    description = "Complete Down the Tubes",
    id = 27716, badge = "28183", 
    trigger = byte(0x00512A) == 13 && byte(0x00519B) == 50 && byte(0x005144) != 255 && once(byte(0x00698A) == 29) &&
              once(byte(0x00512A) == 0) && once(byte(0x00512A) == 3) && never(byte(0x0050B8) == 255) &&
              never(byte(0x0050D0) != 0) && byte(0x0050B6) != 1 && never(byte(0x0050C0) == 7) &&
              never(byte(0x005164) == 255)
)

achievement(
    title = "Bowl-ing Alley", points = 10, type="progression",
    description = "Complete Tube Race",
    id = 27717, badge = "28198", 
    trigger = byte(0x00512A) == 14 && byte(0x00519B) == 50 && byte(0x005144) != 255 && once(byte(0x00698A) == 29) &&
              once(byte(0x00512A) == 0) && once(byte(0x00512A) == 3) && never(byte(0x0050B8) == 255) &&
              never(byte(0x0050D0) != 0) && byte(0x0050B6) != 1 && never(byte(0x0050C0) == 7) &&
              never(byte(0x005164) == 255)
)

achievement(
    title = "Every Once in a Bile", points = 10, type="progression",
    description = "Complete Snot a Problem",
    id = 27718, badge = "28191", 
    trigger = byte(0x00512A) == 6 && once(byte(0x00698A) == 29) && once(byte(0x00512A) == 0) &&
              once(byte(0x0068C2) == 10) && prev(byte(0x0068C2)) == 1 && byte(0x0068C2) == 0 &&
              (low4(0x006627) + low4(0x006628) + low4(0x006629)) != 0 && byte(0x005144) != 255 &&
              never(byte(0x0050D0) != 0) && byte(0x0050B6) != 1 && never(byte(0x0050C0) == 7) &&
              never(byte(0x005164) == 255)
)

achievement(
    title = "I Smell a Lab Rat", points = 10, type="progression",
    description = "Complete Level 5",
    id = 27719, badge = "28192", 
    trigger = byte(0x00512A) == 11 && byte(0x0051F2) == 0 && prev(byte(0x005224)) == 10 && byte(0x005144) != 255 &&
              once(byte(0x00698A) == 29) && once(byte(0x00512A) == 0) && once(byte(0x00512A) == 3) &&
              never(byte(0x0050B8) == 255) && never(byte(0x0050D0) != 0) && byte(0x0050B6) != 1 &&
              never(byte(0x0050C0) == 7) && never(byte(0x005164) == 255) &&
              ((byte(0x005224) == 12) ||
               (byte(0x005224) == 3))
)

achievement(
    title = "Left in the Dark", points = 10,
    description = "Complete Who Turned Out the Lights?",
    type = "missable",
    id = 27720, badge = "28194", 
    trigger = byte(0x00512A) == 25 && byte(0x00519B) == 13 && byte(0x005144) != 255 && once(byte(0x00698A) == 29) &&
              once(byte(0x00512A) == 0) && once(byte(0x00512A) == 3) && never(byte(0x0050B8) == 255) &&
              never(byte(0x0050D0) == 128) && byte(0x0050B6) != 1 && never(byte(0x0050C0) == 7) &&
              never(byte(0x005164) == 255)
)

achievement(
    title = "Beware of Dog", points = 10, type="progression",
    description = "Complete For Pete's Sake",
    id = 27721, badge = "28195", 
    trigger = byte(0x00512A) == 7 && byte(0x00519B) == 51 && byte(0x005144) != 255 && once(byte(0x00698A) == 29) &&
              once(byte(0x00512A) == 0) && once(byte(0x00512A) == 3) && never(byte(0x0050B8) == 255) &&
              never(byte(0x0050D0) != 0) && byte(0x0050B6) != 1 && never(byte(0x0050C0) == 7) &&
              never(byte(0x005164) == 255)
)

achievement(
    title = "The (Rear) End", points = 25, type="win_condition",
    description = "Complete Buttville and beat the game",
    id = 27722, badge = "28223", 
    trigger = byte(0x00512A) == 8 && byte(0x005170) == 137 && byte(0x00517A) == 32 && byte(0x005144) != 255 &&
              once(byte(0x00698A) == 29) && once(byte(0x00512A) == 0) && once(byte(0x00512A) == 3) &&
              never(byte(0x0050B8) == 255) && never(byte(0x0050D0) != 0) && byte(0x0050B6) != 1 &&
              never(byte(0x0050C0) == 7) && never(byte(0x005164) == 255)
)

achievement(
    title = "Re-tire-ment Plan", points = 10,
    description = "Defeat Billy the Bin on Difficult mode",
    id = 27723, badge = "28224",
    trigger = notAnyCheat() && inGame() && word(0x00512A) == 0x0000 && word(0x5146) == 0x0002 &&
              word(0x6890) == 0x11D0 && word(0x6892) == 0x0098 &&
              prev(word(0x6894)) == 0xFFFF && word(0x6894) == 0x0000
)

achievement(
    title = "Junk Food", points = 10,
    description = "Defeat Chuck on Difficult mode",
    id = 27724, badge = "28225", 
    trigger = byte(0x00512A) == 0 && byte(0x005146) == 2 && byte(0x00519B) == 51 && byte(0x005144) != 51 &&
              never(byte(0x0050B8) == 255) && never(byte(0x0050D0) != 0) && once(byte(0x005164) == 255) &&
              byte(0x0050B6) != 1 && never(byte(0x0050C0) == 7)
)

achievement(
    title = "As the Crow Flies", points = 10,
    description = "Defeat Psy-Crow",
    id = 27725, badge = "28179", 
    trigger = (byte(0x00512A) == 26 && prev(byte(0x0051F2)) > 0 && byte(0x0051F2) == 0) &&
              once(byte(0x00512A) == 15 && never(byte(0x0050D0) == 128 || byte(0x0050C0) == 7)) && byte(0x005144) != 255 &&
              byte(0x0050B6) != 1 &&
              disable_when(byte(0x00512A) == 26 &&
                  (low4(0x006627) + low4(0x006628) + low4(0x006629)) < prev(low4(0x006629)) &&
                  (low4(0x006627) + low4(0x006628) + low4(0x006629)) == 0,
                  until=byte(0x00512A) == 26 && byte(0x00572A) == 234
              )
)

achievement(
    title = "A Snowball's Chance", points = 10,
    description = "Defeat Rusty the Snowman on Difficult mode",
    id = 27726, badge = "28226", 
    trigger = byte(0x00512A) == 2 && byte(0x005146) == 2 && byte(0x0052F2) == 0 && once(byte(0x00698A) == 29) &&
              once(byte(0x00512A) == 0) && once(byte(0x0052F2) == 150) && byte(0x0052F8) == 64 && byte(0x005144) != 255 &&
              never(byte(0x0050B8) == 255) && never(byte(0x0050D0) != 0) && byte(0x0050B6) != 1 &&
              never(byte(0x0050C0) == 7)
)

achievement(
    title = "Pussyfooting", points = 10,
    description = "Defeat Evil the Cat on Difficult mode",
    id = 27727, badge = "28181", 
    trigger = byte(0x00512A) == 3 && byte(0x005146) == 2 && byte(0x0068D0) == 9 && byte(0x005144) != 255 &&
              once(byte(0x00698A) == 29) && once(byte(0x00512A) == 0) && once(byte(0x00512A) == 1) &&
              never(byte(0x0050B8) == 255) && never(byte(0x0050D0) != 0) && byte(0x0050B6) != 1 &&
              never(byte(0x0050C0) == 7)
)

achievement(
    title = "Fish out of Water", points = 10,
    description = "Defeat Bob on Difficult mode... without taking damage?!",
    id = 27728, badge = "28180", 
    trigger = byte(0x00512A) == 14 && byte(0x005146) == 2 && byte(0x00519B) == 50 && byte(0x005144) != 255 &&
              once(byte(0x00698A) == 29) && once(byte(0x00512A) == 0) && never(byte(0x0050B8) == 255) &&
              never(byte(0x0050D0) != 0) && byte(0x0050B6) != 1 && never(byte(0x0050C0) == 7)
)

achievement(
    title = "Phlegm Cell Research", points = 10,
    description = "Defeat Major Mucus on Difficult mode",
    id = 27729, badge = "28199", 
    trigger = byte(0x00512A) == 6 && once(byte(0x0068C2) == 10) && prev(byte(0x0068C2)) == 1 && byte(0x0068C2) == 0 &&
              byte(0x005146) == 2 && (low4(0x006627) + low4(0x006628) + low4(0x006629)) != 0 && byte(0x005144) != 255 &&
              never(byte(0x0050D0) != 0) && byte(0x0050B6) != 1 && once(byte(0x00512A) == 0) &&
              once(byte(0x00698A) == 29) && never(byte(0x0050C0) == 7)
)

achievement(
    title = "Flightless Birdbrain", points = 10,
    description = "Defeat Chicken Wing on Difficult mode",
    id = 27730, badge = "28227", 
    trigger = byte(0x00512A) == 11 && byte(0x0051F2) == 0 && prev(byte(0x005224)) == 10 && byte(0x005146) == 2 &&
              byte(0x005144) != 255 && once(byte(0x00698A) == 29) && once(byte(0x00512A) == 0) &&
              never(byte(0x0050B8) == 255) && never(byte(0x0050D0) != 0) && byte(0x0050B6) != 1 &&
              never(byte(0x0050C0) == 7) &&
              ((byte(0x005224) == 12) ||
               (byte(0x005224) == 3))
)

achievement(
    title = "Buttville Slugger", points = 25,
    description = "Defeat J. Alfred Maggot on Difficult mode",
    id = 27731, badge = "28228", 
    trigger = byte(0x00512A) == 8 && byte(0x005144) != 255 && once(byte(0x00698A) == 29) && once(byte(0x00512A) == 0) &&
              never(byte(0x0050B8) == 255) && never(byte(0x0050D0) != 0) && byte(0x005146) == 2 && byte(0x0050B6) != 1 &&
              never(byte(0x0050C0) == 7) && once(byte(0x00512A) == 8 && byte(0x005174) >= 23 && byte(0x005224) == 4) &&
              word(0x006B62) == 65535
)

achievement(
    title = "The Grooviest Victory!", points = 50,
    description = "Defeat Queen Pulsating, Bloated, Festering, Sweaty, Pus-Filled, Malformed Slug-for-a-Butt on Difficult mode... whew!",
    id = 27732, badge = "28229", 
    trigger = byte(0x00512A) == 8 && byte(0x005146) == 2 && byte(0x005170) == 137 && byte(0x00517A) == 32 &&
              byte(0x005144) != 255 && once(byte(0x00698A) == 29) && once(byte(0x00512A) == 0) &&
              never(byte(0x0050B8) == 255) && never(byte(0x0050D0) != 0) && byte(0x0050B6) != 1 &&
              never(byte(0x0050C0) == 7)
)

achievement(
    title = "Down in the Dumps", points = 5,
    description = "Use a Warp Toilet",
    id = 27733, badge = "28230", 
    trigger = byte(0x00512A) == 0 && byte(0x000190) == 132 && byte(0x0001F1) == 0 && byte(0x005101) == 9 &&
              byte(0x005144) != 255 && never(byte(0x0050B8) == 255)
)

achievement(
    title = "Kicking Some Asteroid", points = 10,
    description = "Win the first Andy Asteroids? race while collecting at least 60 fuel pods - specific level codes or the debug level skip code are allowed",
    id = 27734, badge = "28189", 
    trigger = byte(0x00512A) == 15 && byte(0x00519B) == 55 && byte(0x006B4E) >= 60
)

achievement(
    title = "Worms in Glass Houses", points = 25,
    description = "Complete Tube Race without hitting any walls - specific level codes or the debug level skip code are allowed",
    id = 27735, badge = "28184", 
    trigger = never(byte(0x00512A) != 14) && once(dword(0x005174) == 35324320) && never(byte(0x006752) == 0) &&
              prev(word(0x006886)) == 65535 && word(0x005174) > 3120 && word(0x005174) < 3290 && word(0x005176) > 1152 &&
              word(0x005176) < 1280 && never(byte(0x005144) > 0) && never(byte(0x0050B8) == 255) &&
              never(byte(0x0050D0) == 128) &&
              ((unless(prev(word(0x005AEA)) != 65535) && never(byte(0x005AD4) > 0) && word(0x005AEA) == 0) ||
               (unless(prev(word(0x005A6A)) != 65535) && never(byte(0x005A54) > 0) && word(0x005A6A) == 0))
)

achievement(
    title = "Thoughtful Pet Owner", points = 25,
    description = "Complete For Pete's Sake without making Peter Puppy angry - specific level codes or the debug level skip code are allowed",
    id = 27736, badge = "28231", 
    trigger = byte(0x00512A) == 7 && trigger_when(byte(0x00519B) == 51) && once(byte(0x00572A) == 46) &&
              once(byte(0x00572C) == 30) && byte(0x005144) != 255 && never(byte(0x0050B8) == 255) &&
              never(byte(0x0050D0) == 128) && never(byte(0x0069D2) == 11) && unless(byte(0x00512A) != 7) &&
              never(byte(0x0050C0) == 7)
)

achievement(
    title = "Heading for Trouble", points = 25,
    description = "Complete the \"Use Your Head!\" section of Buttville without taking damage - specific level codes or the debug level skip code are allowed",
    id = 27737, badge = "28232", 
    trigger = once(byte(0x00512A) == 9) && once(byte(0x005770) == 138) && trigger_when(byte(0x00512A) == 8) &&
              byte(0x005144) != 255 && never(byte(0x0050B8) == 255) && never(byte(0x0050D0) == 128) &&
              never(byte(0x00519B) == 33) && never(byte(0x0050C0) == 7)
)

achievement(
    title = "Invincible Invertebrate", points = 25,
    description = "Earn 9 lives",
    id = 27738, badge = "28188", 
    trigger = once(byte(0x00698A) == 29) && once(byte(0x00512A) == 0) && byte(0x00512A) != 0 && low4(0x005162) == 9 &&
              byte(0x0050B6) != 1 && never(byte(0x0050C0) == 7)
)

achievement(
    title = "The Bigger They Are", points = 1,
    description = "Watch Jim show off his strength",
    id = 27739, badge = "28233", 
    trigger = notAnyCheat() && inGame() && 
              prev(word(0x00519E)) == 0x19F3 && word(0x00519E) == 0x1A05 // From flexing to flexing too much
)

achievement(
    title = "The Harder They Fall", points = 1,
    description = "Watch Jim show off a little too much",
    id = 27740, badge = "28185", 
    trigger = notAnyCheat() && inGame() && 
              prev(word(0x00519E)) == 0x19F3 && word(0x00519E) == 0x1A7F // From flexing to falling pants 
)

achievement(
    title = "Work with What You Got", points = 1,
    description = "Watch Jim skip some rope",
    id = 27741, badge = "28186",
    trigger = notAnyCheat() && inGame() && 
              prev(word(0x00519E)) == 0x1707 && word(0x00519E) == 0x1B37 // From idle to skipping
)

achievement(
    title = "Don't Try This at Home!", points = 1,
    description = "Watch Jim ignore proper gun safety",
    id = 27742, badge = "28234",
    trigger = notAnyCheat() && inGame() && 
              prev(word(0x00519E)) == 0x1707 && word(0x00519E) == 0x18BF // From idle to exploding their face
)

achievement(
    title = "The Nick Trick", points = 1,
    description = "Pause the game and press Y, A, B, B, A, Y, A, B - this will block ALL other achievements!",
    id = 27743, badge = "28187", published = "18/08/2015 19:18:57", modified = "31/08/2021 22:01:42",
    trigger = byte(0x000060) == 107 && byte(0x000097) == 3
)

achievement(
    title = "When Heck Freezes Over", points = 25,
    description = "Complete What the Heck? without fighting Rusty the Snowman",
    id = 27744, badge = "28235", published = "18/08/2015 19:19:00", modified = "31/08/2021 23:34:05",
    trigger = once(byte(0x00512A) == 1) && byte(0x00512A) == 3 && never(byte(0x00512A) == 2) &&
              once(byte(0x00572A) == 46) && once(byte(0x00572C) == 30) && byte(0x005144) != 255 &&
              once(byte(0x00512A) == 0) && never(byte(0x0050B8) == 255) && never(byte(0x0050D0) == 128) &&
              byte(0x0050B6) != 1 && never(byte(0x0050C0) == 7)
)

achievement(
    title = "Dog-Eat-Worm World", points = 25,
    description = "Complete For Pete's Sake while Peter Puppy is angry",
    id = 27745, badge = "28236", published = "18/08/2015 19:19:04", modified = "31/08/2021 23:34:05",
    trigger = byte(0x00519B) == 51 && byte(0x0069D2) >= 11 && byte(0x0069D2) <= 12 && byte(0x005144) != 255 &&
              once(byte(0x00572A) == 46) && once(byte(0x00572C) == 30) && never(byte(0x0050B8) == 255) &&
              never(byte(0x0050D0) == 128) && unless(byte(0x00512A) != 7) && never(byte(0x0050C0) == 7)
)

achievement(
    title = "Scratch Beneath the Surface", points = 1,
    description = "Hang off of a ledge and take care of an itch",
    id = 27747, badge = "28193",
    trigger = notAnyCheat() && inGame() && 
              prev(word(0x00519E)) == 0x1707 && word(0x00519E) == 0x279D // From idle to scratching their butt
)

achievement(
    title = "DEMOTED AS UNWELCOME CONCEPT - The Ol' Can o' Worms", points = 10,
    description = "Use a continue",
    id = 27746, badge = "28237", published = "18/08/2015 19:19:07", modified = "26/12/2025 02:13:35",
    trigger = byte(0x006B8E) == 0 && low4(0x005162) == 2 && byte(0x00516C) < prev(byte(0x00516C))
)
