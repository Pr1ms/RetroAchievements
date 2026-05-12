// The Jungle Book
// #ID = 26224


function score() => byte(0x0822) * 1000000 + byte(0x0823) * 100000 + byte(0x0824) * 10000 + byte(0x0825) * 1000 +
                    byte(0x0826) * 100 + byte(0x0827) * 10 + byte(0x0828) 

level = {
    0x00: "collecting Gems in the Jungle (Day)",
    0x01: "collecting Gems by the Great Tree",
    0x02: "fighting against Kaa",
    0x03: "overtaking the Dawn Patrol",
    0x04: "looking for Bagheera by the River",
    0x05: "drifting on Baloo in the River to reach Bagheera",
    0x06: "looking for Bagheera in the Tree Village",
    0x07: "looking for Bagheera in King Louie's",
    0x08: "fighting King Louie for the first time",
    0x09: "looking for Bagheera in the Falling Ruins",
    0x0A: "fighting King Louie for the second time",
    0x0B: "collecting Gems in the Jungle (Sunset)",
    0x0C: "collecting Gems in the Jungle (Night)",
    0x0D: "fighting Shere Khan in The Wastelands",
    0x0E: "finally safe among his people"
}

difficulty = {
    0: "Easy",
    1: "Normal",
    2: "Hard"
}

cheat = {
    0: "",
    1: "- Cheat mode"
}

rich_presence_conditional_display(byte(0x082f) == 0 && (score() > 0 || byte(0x082C) > 0), "Game Over ({2}) - Score: {1} - Continues: {0}",
                                  rich_presence_value("VALUE", byte(0x082B), "Value"),
                                  rich_presence_value("SCORE", score(), "Score"),
                                  rich_presence_lookup("Difficulty", byte(0x0814), difficulty)
)

rich_presence_conditional_display(byte(0x082f) == 0, "In main menu")

rich_presence_conditional_display(byte(0x082f) > 0, "Mowgli is {0} ({3}) - Lives: {1} - Score: {2} {4}",
                                  rich_presence_lookup("Level", byte(0x0829), level, fallback="exploring the Jungle"),
                                  rich_presence_value("VALUE", byte(0x082F), "Value"),
                                  rich_presence_value("SCORE", score(), "Score"),
                                  rich_presence_lookup("Difficulty", byte(0x0814), difficulty),
                                  rich_presence_lookup("Cheat", byte(0x080E), cheat)
)

rich_presence_display("Playing The Jungle Book")



function inGame() => byte(0x082F) > 0 && byte(0x080E) == 0
function inGameCheatsAllowed() => byte(0x082F) > 0


// Achievements

achievement("What a Nice Day for Gem Picking", 
            description="Clear Scene 1: Jungle by Day on any difficulty",  
            type="progression",
            points=5, 
            trigger=inGame() && prev(byte(0x0829) == 0x00) && byte(0x0829) == 0x01
)

achievement("This Neighbourhood Used to Be Much Safer", 
            description="Clear Scene 1: Jungle by Day on Hard difficulty", 
            points=10, 
            trigger=inGame() && byte(0x0814) == 0x02 && prev(byte(0x0829) == 0x00) && byte(0x0829) == 0x01
)

achievement("Imagine the Size of the Fruits", 
            description="Clear Scene 2: Great Tree on any difficulty",  
            type="progression",
            points=5, 
            trigger=inGame() && prev(byte(0x0829) == 0x01) && byte(0x0829) == 0x02
)

achievement("Dangerous Ascension", 
            description="Clear Scene 2: Great Tree on Hard difficulty",
            points=10, 
            trigger=inGame() && byte(0x0814) == 0x02 && prev(byte(0x0829) == 0x01) && byte(0x0829) == 0x02
)

achievement("Size Does Not Matter", 
            description="Defeat Kaa in Scene2: Act II on any difficulty",  
            type="progression",
            points=5, 
            trigger=inGame() && prev(byte(0x0829) == 0x02) && byte(0x0829) == 0x03
)

achievement("Not-So-Solid Snake", 
            description="Defeat Kaa in Scene2: Act II on Hard difficulty", 
            points=10, 
            trigger=inGame() && byte(0x0814) == 0x02 && prev(byte(0x0829) == 0x02) && byte(0x0829) == 0x03
)

achievement("Trust in Me", 
            description="Defeat Kaa without pressing the jump button on Hard difficulty - Level select is allowed", 
            points=10,
            trigger=inGameCheatsAllowed() && byte(0x0814) == 0x02 && 
                    disable_when(repeated(9, byte(0x08d0) == 0x01)) &&
                    (always_false() || never(byte(0x0830) == 0x00)) &&
                    (always_false() || never(prev(byte(0x0829) == 0x01) && byte(0x0829) == 0x02)) &&
                    prev(byte(0x0829) == 0x02) && 
                    trigger_when(byte(0x0829) == 0x03)
)

achievement("From Elephant to Elephant", 
            description="Pick up the Extra Life in Scene 3: Dawn Patrol and reach the end of the level on Hard difficulty - Level select is allowed", 
            points=10, 
            trigger=inGameCheatsAllowed() && byte(0x0814) == 0x02 && 
                    prev(byte(0x0829) == 0x03) && 
                    never(byte(0x0830) == 0x00) &&
                    trigger_when(once(1 + prev(byte(0x082f)) == byte(0x082f))) &&                    
                    trigger_when(byte(0x0829) == 0x04)
)

achievement("No Time to Dip My Toes", 
            description="Clear Scene 4: By the River on any difficulty",  
            type="progression",
            points=5, 
            trigger=inGame() && prev(byte(0x0829) == 0x04) && byte(0x0829) == 0x05
)

achievement("Did I Mention I Can't Swim?", 
            description="Clear Scene 4: By the River on Hard difficulty", 
            points=10, 
            trigger=inGame() && byte(0x0814) == 0x02 && prev(byte(0x0829) == 0x04) && byte(0x0829) == 0x05
)

achievement("This Boat Was Warm and Fluffy", 
            description="Clear Scene 5: In the River on any difficulty",  
            type="progression",
            points=5, 
            trigger=inGame() && prev(byte(0x0829) == 0x05) && byte(0x0829) == 0x06
)

achievement("Can't You Swim Around Those Whirlpools?", 
            description="Clear Scene 5: In the River on Hard difficulty",
            points=10,
            trigger=inGame() && byte(0x0814) == 0x02 && prev(byte(0x0829) == 0x05) && byte(0x0829) == 0x06
)

achievement("Traces of Civilization", 
            description="Clear Scene 6: Tree Village on any difficulty",  
            type="progression",
            points=5, 
            trigger=inGame() && prev(byte(0x0829) == 0x06) && byte(0x0829) == 0x07
)

achievement("What Do You Mean Not the Right Village?", 
            description="Clear Scene 6: Tree Village on Hard difficulty",
            points=10, 
            trigger=inGame() && byte(0x0814) == 0x02 && prev(byte(0x0829) == 0x06) && byte(0x0829) == 0x07
)

achievement("A Bit Fancy for Monkeys", 
            description="Clear Scene 7: King Louie's on any difficulty",  
            type="progression",
            points=5, 
            trigger=inGame() && prev(byte(0x0829) == 0x07) && byte(0x0829) == 0x08
)

achievement("Palace of the Apes", 
            description="Clear Scene 7: King Louie's on Hard difficulty", 
            points=10, 
            trigger=inGame() && byte(0x0814) == 0x02 && prev(byte(0x0829) == 0x07) && byte(0x0829) == 0x08
)

achievement("Ground Shaking Monkey", 
            description="Defeat King Louie in Scene 7: Act II on any difficulty",  
            type="progression",
            points=5, 
            trigger=inGame() && prev(byte(0x0829) == 0x08) && byte(0x0829) == 0x09
)

achievement("Man Beats Monkey", 
            description="Defeat King Louie in Scene 7: Act II on Hard difficulty", 
            points=10,
            trigger=inGame() && byte(0x0814) == 0x02 && prev(byte(0x0829) == 0x08) && byte(0x0829) == 0x09
)

achievement("Now Where's the Exit?", 
            description="Clear Scene 8: Falling Ruins on any difficulty",  
            type="progression",
            points=5, 
            trigger=inGame() && prev(byte(0x0829) == 0x09) && byte(0x0829) == 0x0A 
)

achievement("Crumbling Kingdom", 
            description="Clear Scene 8: Falling Ruins on Hard difficulty", 
            points=10,
            trigger=inGame() && byte(0x0814) == 0x02 && prev(byte(0x0829) == 0x09) && byte(0x0829) == 0x0A
)

achievement("No Way I Evolved from You", 
            description="Defeat King Louie in Scene 8: Act II on any difficulty",  
            type="progression",
            points=5, 
            trigger=inGame() && prev(byte(0x0829) == 0x0A) && byte(0x0829) == 0x0B
)

achievement("I Wan'ed to Be like You", 
            description="Defeat King Louie in Scene 8: Act II on Hard difficulty", 
            points=10,
            trigger=inGame() && byte(0x0814) == 0x02 && prev(byte(0x0829) == 0x0A) && byte(0x0829) == 0x0B
)

achievement("Weren't We Here Earlier?", 
            description="Clear Scene 9: Jungle at Sunset on any difficulty",  
            type="progression",
            points=5, 
            trigger=inGame() && prev(byte(0x0829) == 0x0B) && byte(0x0829) == 0x0C
)

achievement("Did You See the Size of Those Bats?", 
            description="Clear Scene 9: Jungle at Sunset on Hard difficulty", 
            points=10,
            trigger=inGame() && byte(0x0814) == 0x02 && prev(byte(0x0829) == 0x0B) && byte(0x0829) == 0x0C
)

achievement("At Least the Tiger Never Found Us", 
            description="Clear Scene 10: Jungle at Night on any difficulty", 
            type="progression",
            points=5,             
            trigger=inGame() && prev(byte(0x0829) == 0x0C) && byte(0x0829) == 0x0D
)

achievement("Don't Let the Fireflies Bite", 
            description="Clear Scene 10: Jungle at Night on Hard difficulty",
            points=10,
            trigger=inGame() && byte(0x0814) == 0x02 && prev(byte(0x0829) == 0x0C) && byte(0x0829) == 0x0D
)

achievement("Soft Kitty, Warm Kitty", 
            description="Defeat Shere Khan in Scene 11: The Wastelands on any difficulty", 
            type="win_condition",
            points=25, 
            trigger=inGame() && prev(byte(0x0829) == 0x0D) && byte(0x0829) == 0x0E
)

achievement("Weeping Tiger", 
            description="Defeat Shere Khan in Scene 11: The Wastelands on Hard difficulty", 
            points=10, 
            trigger=inGame() && byte(0x0814) == 0x02 && prev(byte(0x0829) == 0x0D) && byte(0x0829) == 0x0E
)

achievement("Rapid Fire", 
            description="Defeat Shere Khan in under 20 seconds on Hard difficulty - Level select is allowed",
            points=10, 
            trigger=inGameCheatsAllowed() && byte(0x0814) == 0x02 && 
                    disable_when(byte(0x082d) == 0x04 && byte(0x082e) == 0x00) &&
                    (always_false() || never(byte(0x0830) == 0x00)) &&
                    (always_false() || never(prev(byte(0x0829) == 0x0C) && byte(0x0829) == 0x0D)) &&
                    prev(byte(0x0829) == 0x0D) && 
                    trigger_when(byte(0x0829) == 0x0E)
)

achievement("Declawed Hunter", 
            description="Defeat Shere Khan without taking further damage than the start-of-the-fight free hit on Hard difficulty - Level select is allowed",
            points=10, 
            trigger=inGameCheatsAllowed() && byte(0x0814) == 0x02 && 
                    disable_when(byte(0x0830) < 0x04) &&
                    (always_false() || never(byte(0x0830) == 0x00)) &&
                    (always_false() || never(prev(byte(0x0829) == 0x0C) && byte(0x0829) == 0x0D)) &&
                    prev(byte(0x0829) == 0x0D) && 
                    trigger_when(byte(0x0829) == 0x0E)
)

/**
I deem this too hard for a game that already has its challenges. I'm removing it!

achievement("Survival of the Fittest", 
            description="Beat the game on Hard difficulty without using a Continue", 
            type="missable",
            points=50,             
            trigger=inGame() && byte(0x0814) == 0x02 && 
                    disable_when(prev(byte(0x082B)) > byte(0x082B)) &&
                    (always_false() || never(byte(0x082F) == 0x00 && byte(0x082C) == 0x00)) &&        
                    prev(byte(0x0829) == 0x0D) && byte(0x0829) == 0x0E
)
*/

achievement("I Think I Taught This Banana a Trick!", 
            description="Get the Boomerang",
            points=1,
            trigger=inGame() && prev(byte(0x0831)) != 0x81 && byte(0x0831) == 0x81
)

achievement("What’s My Head Doing Here?", 
            description="Pick up an Extra Life", 
            points=1, 
            trigger=inGame() && 1 + prev(byte(0x082f)) == byte(0x082f)
)

// Leaderboards
leaderboard("High Score",
            description="Get the highest score over a full game",
            start=inGame() && prev(byte(0x0829)) == 0x0D && byte(0x0829) == 0x0E,
            cancel=always_false(),
            value=score(),
            format="SCORE",
            submit=always_true()
)
