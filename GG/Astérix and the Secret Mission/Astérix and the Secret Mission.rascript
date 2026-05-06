// Astérix and the Secret Mission
// #ID = 24342

character = {
   0x00: "Astérix",
   0x01: "Obélix",
   0x02: "Dogmatix"
}

character_level = {
    0: "beating up Romans in the Village",
    1: "chasing a Roman for a Scroll",
    2: "crossing the Forest",
    3: "crossing the Forest",
    4: "exploring the Cave",
    5: "hovering through the Cave",
    6: "surfing towards Pirate Ships",
    7: "making his way to the Pirate Flagship",
    8: "making his way to the Pirate Flagship",
    9: "exploring the Pirate Flagship",
    10: "exploring the Pirate Flagship",
    11: "fighting the Pirate Duo",
    12: "crossing the Desert",
    13: "exploring the Egyptian Tomb",
    14: "exploring the Egyptian Tomb",
    15: "fighting the Fakir in the Tomb",   
    16: "making his way through the streets of Rome",
    17: "exploring the Roman Palace",
    18: "exploring the Roman Palace",
    19: "fighting the Roman Officer",
    20: "returning home to celebrate the Secret Mission's success!",
    21: "beating up Romans in the Village",
    22: "crossing the Waterfalls",
    23: "crossing the Waterfalls",
    24: "exploring the Cave",
    25: "hovering through the Cave",
    26: "taking a stroll Underwater",
    27: "making his way to the Pirate Flagship",
    28: "making his way to the Pirate Flagship",
    29: "exploring the Pirate Flagship",
    30: "fighting the Pirate Duo",
    31: "roaming the Snowy Mountains",
    32: "exploring the Ice Temple",
    33: "exploring the Ice Temple",
    34: "exploring the Ice Temple",
    35: "making his way through the streets of Rome",
    36: "exploring the Roman Palace",
    37: "exploring the Roman Palace",
    38: "fighting the Roman Officer",
    39: "returning home to celebrate the Secret Mission's success!",
    43: "gathering items in the Cave",
    44: "gathering items in the Cave",
    45: "gathering items in the Cave",
    49: "looting in the Pirate Flagship",
    50: "looting in the Pirate Flagship",
    51: "looting in the Pirate Flagship",
}


herbCount = {
    0: "0",
    1: "1",
    2: "2",                 
    3: "3",
    4: "4",
    5: "2",
    6: "5",
    7: "5",
    8: "6"
}

function inGame() => byte(0x00e4) >= 0x03 && byte(0x001e) == 0x00

rich_presence_conditional_display(byte(0x001e) == 0x01, "In Demo Mode") 
rich_presence_conditional_display(byte(0x00e4) == 0x00 || byte(0x00db) > 0x00 && byte(0x00e8) == 0x00, "In Main Menu") 
rich_presence_conditional_display(inGame(), "{0} is {1} - HP: {6}/{7} - Score: {2}{3}{4}{5}0 - Ingredients: {8}/6",
                                  rich_presence_lookup("CHARACTER", byte(0x001c), character),
                                  rich_presence_lookup("LEVEL", byte(0x001c) * 21 + byte(0x00db), character_level, 
                                                       fallback="wondering who should bgo look for the next ingredient"),
                                  rich_presence_value("VALUE", byte(0x00e0), "Value"),
                                  rich_presence_value("VALUE", byte(0x00df), "Value"),
                                  rich_presence_value("VALUE", byte(0x00de), "Value"),
                                  rich_presence_value("VALUE", byte(0x00dd), "Value"),             
                                  rich_presence_value("VALUE", byte(0x00e3), "Value"),
                                  rich_presence_value("VALUE", byte(0x00e4), "Value"),
                                  rich_presence_lookup("HERB_COUNT", byte(0x00e8), herbCount)
)

// rich_presence_conditional_display(byte(0x0001) == 0x0d, "Character Selection") 
// rich_presence_conditional_display(byte(0x0001) != 0x0b && byte(0x0001) != 0x0c && byte(0x0001) != 0x0d, "Loading...") 

rich_presence_display("Playing Astérix and the Secret Mission")

achievement("Wave Rider", 
            description="Complete the Surfing section without being hit",
            points=5, 
            trigger=inGame() && byte(0x001c) == 0x00 && once(byte(0x00db) == 0x06) &&
                    byte(0x00e8) == 0x03 &&
                    disable_when(byte(0x00e3) < prev(byte(0x00e3))) &&
                    prev(byte(0x00db)) == 0x06 && trigger_when(byte(0x00db) == 0x07) &&
                    (always_false() || (never(byte(0x0000E3) == 0x00))) // HACK: this forces the reset to an Alt
)

achievement("Really Getafix? It Was Right on Your Doorstep!",
            description="Pick the first Ingredient in the Village",
            type="progression",
            points=5,
            trigger=inGame() && byte(0x00db) == 0x00 && prev(byte(0x00e8)) == 0x00 && byte(0x00e8) == 0x01
)

achievement("Going Apple-Picking",
            description="Pick the second Ingredient in the Forest or the Cascades",
            type="progression",
            points=5,
            trigger=inGame() &&
                    prev(byte(0x00e8)) == 0x01 &&
                    (byte(0x001c) == 0x00 && byte(0x00db) == 0x02 && byte(0x00e8) == 0x02 || 
                     byte(0x001c) == 0x01 && byte(0x00db) == 0x01 && byte(0x00e8) == 0x05)
)

achievement("Underground Gardening",
            description="Pick the third Ingredient in the Cave",
            type="progression",
            points=5,
            trigger=inGame() &&       
                    (byte(0x001c) == 0x00 && byte(0x00db) == 0x05 || byte(0x001c) == 0x01 && byte(0x00db) == 0x04) && 
                    (prev(byte(0x00e8)) == 0x02 || prev(byte(0x00e8)) == 0x05) && byte(0x00e8) == 0x03
)

achievement("Unusual Booty",
            description="Pick the fourth Ingredient in the Pirate Flagship",
            type="progression",
            points=5,
            trigger=inGame() &&       
                    (byte(0x001c) == 0x00 && byte(0x00db) == 0x0A || byte(0x001c) == 0x01 && byte(0x00db) == 0x08) && 
                    prev(byte(0x00e8)) == 0x03 && byte(0x00e8) == 0x04
)

achievement("Relic of the Past",
            description="Pick the fifth Ingredient in the Egyptian Tomb or the Ice Temple",
            type="progression",
            points=5,
            trigger=inGame() &&
                    prev(byte(0x00e8)) == 0x04 && 
                    (byte(0x001c) == 0x00 && byte(0x00db) == 0x0e && byte(0x00e8) == 0x07 || 
                     byte(0x001c) == 0x01 && byte(0x00db) == 0x0d && byte(0x00e8) == 0x06)
)

achievement("Behind Enemy Lines",
            description="Pick the sixth and last Ingredient in the Roman Palace",
            type="progression",
            points=5,
            trigger=inGame() &&       
                    (byte(0x001c) == 0x00 && byte(0x00db) == 0x11 || byte(0x001c) == 0x01 && byte(0x00db) == 0x0F) && 
                    (prev(byte(0x00e8)) == 0x06 || prev(byte(0x00e8)) == 0x07) && byte(0x00e8) == 0x08
)

achievement("Home Is Where the Heart Is",
            description="Find a heart container in the Village",
            points=4,
            trigger=inGame() && byte(0x00db) == 0x00 && 
                    prev(byte(0x00ed)) == 0x00 && byte(0x00ed) == 0x01
)

achievement("Were Those Flying Guys Cupids?",
            description="Find a heart container in the Cave",
            points=2,
            trigger=inGame() && 
                    (byte(0x001c) == 0x00 && byte(0x00db) == 0x04 || byte(0x001c) == 0x01 && byte(0x00db) == 0x03) && 
                    prev(byte(0x00ed)) == 0x00 && byte(0x00ed) == 0x01
)

achievement("Cold Heart",
            description="Find a heart container in the Ice Temple",
            points=2,
            trigger=inGame() && byte(0x001c) == 0x01 && byte(0x00db) == 0x0a && 
                    prev(byte(0x00ed)) == 0x00 && byte(0x00ed) == 0x01
)

achievement("Roman...tic?", 
            description="Find a heart container in the Roman Palace", 
            points=4, 
            trigger=inGame() && 
                    (byte(0x001c) == 0x00 && byte(0x00db) == 0x12 || byte(0x001c) == 0x01 && byte(0x00db) == 0x10) && 
                    prev(byte(0x00ed)) == 0x00 && byte(0x00ed) == 0x01
)

achievement("In Don't Even Need This One", 
            description="Pick up a heart container while already maxed out", 
            points=5,
            type="missable",
            trigger=inGame() && prev(byte(0x00e4)) == 0x06 && prev(byte(0x00ed)) == 0x00 && 
                    byte(0x00e4) == 0x06 && byte(0x00ed) == 0x01
)            

achievement("You Know, in Case the Magic Potion Fails", 
            description="Have 9 extra lives", 
            points=3, 
            trigger=inGame() && prev(byte(0x00dc)) == 0x08 && byte(0x00dc) == 0x09
)

achievement("Nice Stroll Through the Forest",
            description="Clear the Village Stage as Astérix",
            points=5,
            trigger=inGame() && byte(0x001c) == 0x00 && prev(byte(0x00db)) == 0x02 && byte(0x00db) == 0x03
)

achievement("Refreshing Moment by the Waterfalls",
            description="Clear the Village Stage as Obélix",
            points=5,
            trigger=inGame() && byte(0x001c) == 0x01 && prev(byte(0x00db)) == 0x01 && byte(0x00db) == 0x02
)


achievement("I Came by Surfboard", 
            description="Clear the Pirate Stage as Astérix", 
            points=5, 
            trigger=inGame() && byte(0x001c) == 0x00 && prev(byte(0x00db)) == 0x0b && byte(0x00db) == 0x0c
)

achievement("Walking on Davy Jones's Locker", 
            description="Clear the Pirate Stage as Obélix", 
            points=5, 
            trigger=inGame() && byte(0x001c) == 0x01 && prev(byte(0x00db)) == 0x09 && byte(0x00db) == 0x0a
)

achievement("In the Steps of Lara Croft", 
            description="Clear the Egyptian Tomb Stage", 
            points=5, 
            trigger=inGame() && byte(0x001c) == 0x00 && prev(byte(0x00db)) == 0x0f && byte(0x00db) == 0x10
)
            
achievement("I Should Have Brought a Coat", 
            description="Clear the Ice Temple Stage", 
            points=5, 
            trigger=inGame() && byte(0x001c) == 0x01 && prev(byte(0x00db)) == 0x0d && byte(0x00db) == 0x0e
)

achievement("Can We Grow an Herb Garden for Next Time?", 
            description="Beat the Roman Officer and deliver the Ingredients to Getafix", 
            points=25, 
            type="win_condition",
            trigger=inGame() && 
                    (byte(0x001c) == 0x00 && prev(byte(0x00db)) == 0x13 && byte(0x00db) == 0x14 ||
                     byte(0x001c) == 0x01 && prev(byte(0x00db)) == 0x11 && byte(0x00db) == 0x12)
)            

// Boss challenges
function score() => 10 * byte(0x00dd) + 100 * byte(0x00de) + 1000 * byte(0x00df) + 10000 * byte(0x00e0)
achievement("Dodge Master", 
            description="Beat the Pirate Bosses without taking damage and without pressing the jump button more than twice during the fight",
            points=10, 
            trigger=inGame() &&                     
                    disable_when(byte(0x00e3) < prev(byte(0x00e3))) &&
                    disable_when(repeated(3, byte(0x051e) == 0x01 && prev(bit5(0x0206)) == 0 && bit5(0x0206) == 1)) &&
                    trigger_when(prev(score()) + 500 == score()) &&                    
                    ((byte(0x001c) == 0x00 && byte(0x00db) == 0x0b || byte(0x001c) == 0x01 && byte(0x00db) == 0x09) ||
                    always_false() && (never(byte(0x0000E3) == 0x00))) 
)

function score() => 10 * byte(0x00dd) + 100 * byte(0x00de) + 1000 * byte(0x00df) + 10000 * byte(0x00e0)
achievement("Jump in the Fire", 
            description="Beat the Fakir in the Egyptian Tomb without pressing the punch button more than twice during the fight",
            points=10, 
            trigger=inGame() &&         
                    byte(0x001c) == 0x00 && byte(0x00db) == 0x0f &&                    
                    disable_when(repeated(3, prev(bit4(0x0206)) == 0 && bit4(0x0206) == 1)) &&
                    trigger_when(prev(score()) + 500 == score()) &&
                    (always_false() || (never(byte(0x0000E3) == 0x00))) // HACK: this forces the reset to an Alt
)

// Bonus Levels challenges
achievement("Cave of Wonders", 
            description="Pick up all the items within the time limit in Dogmatix's Cave Bonus Stage", 
            points=5, 
            type="missable",
            trigger=inGame() &&         
                    byte(0x001c) == 0x02 &&
                    byte(0x029a) > 0x00 &&
                    (prev(byte(0x00db)) == 0x02 && trigger_when(byte(0x00db) == 0x03) || 
                     prev(byte(0x00db)) == 0x03 && trigger_when(byte(0x00db) == 0x04))
                    
)                    

achievement("Counter Piracy", 
            description="Pick up all the items within the time limit in Dogmatix's Pirate Bonus Stage", 
            points=5, 
            type="missable",
            trigger=inGame() &&         
                    byte(0x001c) == 0x02 &&
                    byte(0x029a) > 0x00 &&
                    (prev(byte(0x00db)) == 0x07 && trigger_when(byte(0x00db) == 0x08) || 
                     prev(byte(0x00db)) == 0x08 && trigger_when(byte(0x00db) == 0x09))
)

// Leaderboards

leaderboard("High Score",
            description="Get the highest score over a full game",
            start=inGame() &&  prev(byte(0x00e3)) == 0x01 && byte(0x00e3) == 0x00 &&
                   (byte(0x001c) == 0x00 && byte(0x00db) == 0x14||
                    byte(0x001c) == 0x01 && byte(0x00db) == 0x12),
            cancel=always_false(),
            value=100 + score(),
            format="SCORE",
            submit=always_true()
)
