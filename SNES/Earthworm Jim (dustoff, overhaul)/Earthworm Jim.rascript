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
function notAnyCheat() => disable_when(word(0x50B8) == 0xFFFF) && // Map View Mode Cheat
                          disable_when(word(0x5142) == 0xFFFF) && // Debug View: Freezeability
                          disable_when(word(0x5144) == 0xFFFF) && // Debug View: Cheat Mode 
                          disable_when(high4(0x6620) == 0 && word(0x512A) > 0x0000) && // Level select from debug view
                          disable_when(prev(word(0x50C0)) == 0x0007 && repeated(20, word(0x50C0) == 0xFFFF)) && // Any cheat being input                             
                          (always_false() || never(high4(0x6620) == 0 && word(0x512A) == 0x0000)) // This ensures we go back to main menu and no level was selected through the Debug View

function debugRoomLevelSelectOnly() => disable_when(word(0x50B8) == 0xFFFF) && // Map View Mode Cheat
                                       disable_when(word(0x5142) == 0xFFFF) && // Debug View: Freezeability
                                       disable_when(word(0x5144) == 0xFFFF) && // Debug View: Cheat Mode 
                                       disable_when(prev(word(0x50C0)) == 0x0007 && repeated(5, word(0x50C0) == 0xFFFF)) && // Any cheat being input                             
                                       (always_false() || never(high4(0x6620) == 0)) // This ensures we go back to main menu only

// For map selection, there are several possibilities
// - via the debug menu we end up in the main menu with a non 0x00 level value AND word(0x50C0) == 0xFFFF
// - via a specific level cheat we have word(0x50C0) == 0xFFFF during the whole win/loading screens
// - via the level skip cheat we have word(0x50C0) == 0xFFFF during the whole win/loading screens
// Protection for progression achievements then only consist in checking word(0x50C0) not being 0xFFFF,

// Since some traces of cheats only last a few freames we cannot track it in RP. Instead we will use hidden leaderboards to prevent wrongful tickets in the future

//function notAnyCheat() => notCommonForbiddenCodes() && disable_when(high4(0x6620) == 0 )
function health() => low4(0x6627) * 100 + low4(0x6628) * 10 + low4(0x6629) 

// TODO: find a mainMenu/in game flag
rich_presence_conditional_display(high4(0x6620) == 0, "In Main Menu")
rich_presence_conditional_display(byte(0x6B8E) == 1, "In Demo Mode")
 
rich_presence_conditional_display(inGame() && word(0x512A) == 0x0008 && word(0x6890) == 0x10FA && word(0x6892) == 0x0153 && word(0x6894) == 0xFFFF,
                                  "Jim just won the game on {0}",
                                  rich_presence_lookup("Difficulty", word(0x5146), difficulty)
)
  
rich_presence_conditional_display(inGame() && (word(0x50B8) == 0xFFFF || word(0x5142) == 0xFFFF || word(0x5144) == 0xFFFF || word(0x50C0) == 0xFFFF), "Jim is {0} ({1}) - HP: {2}% - Lives: {3} - Using Cheats",
                                  rich_presence_lookup("Level", word(0x512A), level),
                                  rich_presence_lookup("Difficulty", word(0x5146), difficulty),
                                  rich_presence_value("VALUE", health()),
                                  rich_presence_value("VALUE",low4(0x5162))
)

rich_presence_conditional_display(inGame(), "Jim is {0} ({1}) - HP: {2}% - Lives: {3}",
                                  rich_presence_lookup("Level", word(0x512A), level),
                                  rich_presence_lookup("Difficulty", word(0x5146), difficulty),
                                  rich_presence_value("VALUE", health()),
                                  rich_presence_value("VALUE",low4(0x5162))
)

rich_presence_display("Playing Earthworm Jim")

achievement(
    title = "Not-So-Ground Beef", points = 5, type="progression",
    description = "Launch the cow in New Junk City",
    id = 27712, badge = "28222",
    trigger = notAnyCheat() && inGame() && word(0x512A) == 0x0000 && 
              word(0x6890) == 0x0370 && word(0x6892) == 0x0215 && // Camera scripted position for the event (before that the fridge is invincible)
              prev(word(0x6894)) == 0xFFFF && word(0x6894) == 0x0000 // Lifting the camera lock
)

achievement(
    title = "The Rotten Apple", points = 10, type="progression",
    description = "Complete New Junk City",
    id = 27713, badge = "28190", 
    trigger = notAnyCheat() && inGame() && prev(word(0x512A)) == 0x0000 && word(0x512A) == 0x000F // from New Junk City to the correct Andy Asteroids? level
)

// Winning a race amounts to not going to the Psycrow fight after it
achievement(
    title = "Galactic Rodeo", points = 10, 
    type="missable",
    description = "Win an Andy Asteroids? race",
    id = 27714, badge = "28196", 
    trigger = notAnyCheat() && inGame() && (
              prev(word(0x512A)) == 0x000F && word(0x512A) == 0x0001 ||
              prev(word(0x512A)) == 0x0010 && word(0x512A) == 0x000D ||
              prev(word(0x512A)) == 0x0011 && word(0x512A) == 0x0004 ||
              prev(word(0x512A)) == 0x0012 && word(0x512A) == 0x000A ||
              prev(word(0x512A)) == 0x0013 && word(0x512A) == 0x0007 ||
              prev(word(0x512A)) == 0x0014 && word(0x512A) == 0x0009)
)              

achievement(
    title = "Fire and Jimstone", points = 10, type="progression",
    description = "Complete What the Heck?",
    id = 27715, badge = "28197", 
    trigger = notAnyCheat() && inGame() && prev(word(0x512A)) == 0x0003 && word(0x512A) == 0x0010 // from Evil Cat to the correct Andy Asteroids? level
)

achievement(
    title = "Slippery When Wet", points = 10, type="progression",
    description = "Complete Down the Tubes",
    id = 27716, badge = "28183", 
    trigger = notAnyCheat() && inGame() && prev(word(0x512A)) == 0x000D && word(0x512A) == 0x000E // from Down the Tubes to Tube Race
)

achievement(
    title = "Bowl-ing Alley", points = 10, type="progression",
    description = "Complete Tube Race",
    id = 27717, badge = "28198", 
    trigger = notAnyCheat() && inGame() && prev(word(0x512A)) == 0x000E && word(0x512A) == 0x0011 // from Tube Race to the correct Andy Asteroids? level
)

achievement(
    title = "Every Once in a Bile", points = 10, type="progression",
    description = "Complete Snot a Problem",
    id = 27718, badge = "28191", 
    trigger = notAnyCheat() && inGame() && prev(word(0x512A)) == 0x0006 && word(0x512A) == 0x0012 // from Snot a Problem: Round 3 to the correct Andy Asteroids? level
)

achievement(
    title = "I Smell a Lab Rat", points = 10, type="progression",
    description = "Complete Level 5",
    id = 27719, badge = "28192", 
    trigger = notAnyCheat() && inGame() && prev(word(0x512A)) == 0x000B && word(0x512A) == 0x0013 // from Chicken Wing to the correct Andy Asteroids? level
)

achievement(
    title = "Left in the Dark", points = 10,
    description = "Complete Who Turned Out the Lights?",
    type = "missable",
    id = 27720, badge = "28194", 
    trigger = notAnyCheat() && inGame() && prev(word(0x512A)) == 0x00019 && word(0x512A) == 0x000A // from the last map of Who Turn Out the Lights to the main Level 5 map
)

achievement(
    title = "Beware of Dog", points = 10, type="progression",
    description = "Complete For Pete's Sake",
    id = 27721, badge = "28195", 
    trigger = notAnyCheat() && inGame() && prev(word(0x512A)) == 0x0007 && word(0x512A) == 0x0014 // from For Pete's Sake to the correct Andy Asteroids? level
)

achievement(
    title = "The (Rear) End", points = 25, type="win_condition",
    description = "Complete Buttville and beat the game",
    id = 27722, badge = "28223", 
    trigger = notAnyCheat() && inGame() && word(0x512A) == 0x0008 && 
              word(0x6890) == 0x10FA && word(0x6892) == 0x0153 && // Camera scripted position for the Queen explosion event
              prev(word(0x6894)) == 0x0000 && word(0x6894) == 0xFFFF // The camera locks-on
)

achievement(
    title = "Re-tire-ment Plan", points = 10,
    description = "Defeat Billy the Bin on Difficult mode",
    id = 27723, badge = "28224",
    trigger = notAnyCheat() && inGame() && word(0x00512A) == 0x0000 && word(0x5146) == 0x0002 &&  
              word(0x6890) == 0x11D0 && word(0x6892) == 0x0098 && // Camera scripted position for the fight
              prev(word(0x6894)) == 0xFFFF && word(0x6894) == 0x0000 // Lifting the camera lock
)

achievement(
    title = "Junk Food", points = 10,
    description = "Defeat Chuck on Difficult mode",
    id = 27724, badge = "28225", 
    trigger = notAnyCheat() && inGame() && word(0x5146) == 0x0002 && 
              prev(word(0x512A)) == 0x0000 && word(0x512A) == 0x000F // from New Junk City to the correct Andy Asteroids? level
)

// "Defeating" Psy-Crow amounts to surviving the fight to see the next map
achievement(
    title = "As the Crow Flies", points = 10,
    description = "Defeat Psy-Crow",
    id = 27725, badge = "28179", 
    trigger = notAnyCheat() && inGame() && prev(word(0x512A)) == 0x001A && (
              word(0x512A) == 0x0001 || word(0x512A) == 0x000D ||
              word(0x512A) == 0x0004 || word(0x512A) == 0x000A ||
              word(0x512A) == 0x0007 || word(0x512A) == 0x0009)    
)

achievement(
    title = "A Snowball's Chance", points = 10,
    description = "Defeat Rusty the Snowman on Difficult mode",
    type="missable",
    id = 27726, badge = "28226", 
    trigger = notAnyCheat() && inGame() && word(0x5146) == 0x0002 && 
              prev(word(0x512A)) == 0x0002 && word(0x512A) == 0x0001 // from Rusty the Snowman's map to the general What The Heck map
)

achievement(
    title = "Pussyfooting", points = 10,
    description = "Defeat Evil the Cat on Difficult mode",
    id = 27727, badge = "28181", 
    trigger = notAnyCheat() && inGame() && word(0x5146) == 0x0002 && 
              prev(word(0x512A)) == 0x0003 && word(0x512A) == 0x0010 // from Evil Cat to the correct Andy Asteroids? level
)

achievement(
    title = "Fish out of Water", points = 10,
    description = "Defeat Bob on Difficult mode... without taking damage?!",
    id = 27728, badge = "28180", 
    trigger = notAnyCheat() && inGame() && word(0x5146) == 0x0002 && 
              prev(word(0x512A)) == 0x000E && word(0x512A) == 0x0011 // from Tube Race to the correct Andy Asteroids? level
)

achievement(
    title = "Phlegm Cell Research", points = 10,
    description = "Defeat Major Mucus on Difficult mode",
    id = 27729, badge = "28199", 
    trigger = notAnyCheat() && inGame() && word(0x5146) == 0x0002 && 
              prev(word(0x512A)) == 0x0006 && word(0x512A) == 0x0012 // from Snot a Problem: Round 3 to the correct Andy Asteroids? level
)

achievement(
    title = "Flightless Birdbrain", points = 10,
    description = "Defeat Chicken Wing on Difficult mode",
    id = 27730, badge = "28227", 
    trigger = notAnyCheat() && inGame() && word(0x5146) == 0x0002 && 
              prev(word(0x512A)) == 0x000B && word(0x512A) == 0x0013 // from Chicken Wing to the correct Andy Asteroids? level
)

achievement(
    title = "Buttville Slugger", points = 25,
    description = "Defeat J. Alfred Maggot on Difficult mode",
    id = 27731, badge = "28228", 
    trigger = notAnyCheat() && inGame() && word(0x00512A) == 0x0008 && word(0x5146) == 0x0002 &&  
              word(0x6890) == 0x1759 && word(0x6892) == 0x0172 && // Camera scripted position for the fight
              prev(word(0x6894)) == 0xFFFF && word(0x6894) == 0x0000 // Lifting the camera lock
)

achievement(
    title = "The Grooviest Victory!", points = 50,
    description = "Defeat Queen Pulsating, Bloated, Festering, Sweaty, Pus-Filled, Malformed Slug-for-a-Butt on Difficult mode... whew!",
    id = 27732, badge = "28229", 
    trigger = notAnyCheat() && inGame() && word(0x512A) == 0x0008 && word(0x5146) == 0x0002 &&  
              word(0x6890) == 0x10FA && word(0x6892) == 0x0153 && // Camera scripted position for the Queen explosion event
              prev(word(0x6894)) == 0x0000 && word(0x6894) == 0xFFFF // The camera locks-on
)

achievement(
    title = "Kicking Some Asteroid", points = 10,
    description = "Win the first Andy Asteroids? race while collecting at least 60 fuel pods - level select from the debug menu is allowed",
    id = 27734, badge = "28189", 
    trigger = debugRoomLevelSelectOnly() && inGame() && word(0x006B4E) >= 60 &&
              prev(word(0x512A)) == 0x000F && word(0x512A) == 0x0001
)

achievement(
    title = "Invincible Invertebrate", points = 25,
    description = "Earn 9 lives",
    id = 27738, badge = "28188", 
    trigger = notAnyCheat() && inGame() && 
             prev(low4(0x005162)) == 8 && low4(0x005162) == 9
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
    description = "Pause the game and press Y, A, B, B, A, Y, A, B - this will block ALL other achievements as will most cheats!",
    id = 27743, badge = "28187", 
    trigger = inGame() && word(0x50c2) == 0x4000 && word(0x50c4) == 0x0080 && word(0x50c6) == 0x8000 && word(0x50c8) == 0x8000 &&
                          word(0x50ca) == 0x0080 && word(0x50cc) == 0x4000 && word(0x50ce) == 0x0080 && prev(word(0x50d0)) == 0x0000 && word(0x50d0) == 0x8000
)    

achievement(
    title = "Scratch Beneath the Surface", points = 1,
    description = "Hang off of a ledge and take care of an itch",
    id = 27747, badge = "28193",
    trigger = notAnyCheat() && inGame() && 
              prev(word(0x00519E)) == 0x1707 && word(0x00519E) == 0x279D // From idle to scratching their butt
)

achievement(
    title = "Down in the Dumps", points = 5,
    description = "Use a Warp Toilet",
    id = 27733, badge = "28230", 
    trigger = notAnyCheat() && inGame() && word(0x00512A) == 0x0000 &&  
              prev(word(0x5174)) < 0x70 && prev(word(0x5176)) > 0x250 && prev(word(0x5176)) < 0x270 && // Bounding box for the origin
              word(0x5174) == 0x13EB && word(0x5176) == 0x03F2// Scripted destination
)

// HARDER ONES (may have to keep a checkpoint here ?!)
achievement(
    title = "Worms in Glass Houses", points = 25,
    description = "Complete Tube Race without hitting any walls - level select from the debug menu is allowed",
    id = 27735, badge = "28184", 
    trigger = debugRoomLevelSelectOnly() && inGame() && once(word(0x00512A) == 0x000E &&              
              word(0x5174) == 0x01A0 && word(0x5176) == 0x021B) && // scripted starting point
              never(word(0x005AEA) == 0x0000 && word(0x005A6A) == 0x0000) &&
              ((once(word(0x005AEA) == 0xFFFF) && disable_when(word(0x005AD4) > 0)) ||
               (once(word(0x005A6A) == 0xFFFF) && disable_when(word(0x005A54) > 0))) &&
               trigger_when(word(0x5174) >= 0x0C50) && trigger_when(word(0x5174) <= 0x0CA0) && trigger_when(prev(word(0x5176)) < 0x04A0 && word(0x5176) >= 0x04A0) // arrival conservative bounding box (which cannot be reached from the bottom)
)

// NOTE: the current way was to tell players to reset the game if they were hit, the following will reset when going to main menu, which is the very same
achievement(
    title = "Thoughtful Pet Owner", points = 25,
    description = "Complete For Pete's Sake without making Peter Puppy angry - level select from the debug menu is allowed",
    id = 27736, badge = "28231", 
    trigger = debugRoomLevelSelectOnly() && inGame() && once(word(0x00512A) == 0x0007 && word(0x5174) == 0x0070 && word(0x5176) == 0x0195) && // never(repeated(2, word(0x00512A) != 0x0007)) && // checkpoint on starting the level
              disable_when(byte(0x0069D2) == 11) &&
              prev(word(0x512A)) == 0x0007 && trigger_when(word(0x512A) == 0x0014) // from For Pete's Sake to the correct Andy Asteroids? level    
)

achievement(
    title = "Dog-Eat-Worm World", points = 25,
    description = "Complete For Pete's Sake while Peter Puppy is angry - level select from the debug menu is allowed",
    id = 27745, badge = "28236", 
    trigger = debugRoomLevelSelectOnly() && inGame() && word(0x512A) == 0x0007 &&
              (byte(0x0069D2) == 11 || byte(0x0069D2) == 12) && 
              prev(byte(0x519B)) != 0x33 && byte(0x519B) == 0x33 // New delta check
)

achievement(
    title = "Heading for Trouble", points = 25,
    description = "Complete the \"Use Your Head!\" section of Buttville without taking damage - level select from the debug menu is allowed",
    id = 27737, badge = "28232", 
    trigger = debugRoomLevelSelectOnly() && inGame() && once(word(0x00512A) == 0x0009 && word(0x5174) == 0x0120 && word(0x5176) == 0x017F) && 
              never(prev(health()) > health()) &&
              prev(word(0x00512A)) == 0x0009 && trigger_when(word(0x00512A) == 0x0008)
)

achievement(
    title = "When Heck Freezes Over", points = 25,
    type="missable",
    description = "Reach Evil the Cat's fight without fighting Rusty the Snowman beforehand in What the Heck?",
    id = 27744, badge = "28235", 
    trigger = notAnyCheat() && inGame() && once(word(0x00512A) == 0x0001 && word(0x5174) == 0x007c && word(0x5176) == 0x0630) && // chekpoint upon starting the level
              never(word(0x00512A) == 0x0002) && // entered the snowman fight = reset
              prev(word(0x00512A)) == 0x0001 && trigger_when(word(0x00512A) == 0x0003) // unlocked when moving the the Evil the Cat fight
)

// Leaderboards to track cheat usage (will be hidden)
leaderboard(
    title="Cheat usage detected",
    description="Player used a cheat",
    // IMPORTANT: manually add a "And Next" on the first line
    start=byte(0x6B8E) == 0 && prior(word(0x50C0)) == 0x0007 && repeated(20, word(0x50C0) == 0xFFFF) && never(high4(0x6620) == 0 && word(0x512A) == 0x0000) && never(word(0x50C0) == 0x0000),
    cancel=always_false(),
    submit=always_true(),
    value=1    
)

leaderboard(
    title="Level select detected",
    description="Player started a level from main menu using the debug view level select",
    start=byte(0x6B8E) == 0 && prev(high4(0x6620)) == 0 && high4(0x6620) == 3 && word(0x512A) > 0x0000,
    cancel=always_false(),
    submit=always_true(),
    value=1 
)
