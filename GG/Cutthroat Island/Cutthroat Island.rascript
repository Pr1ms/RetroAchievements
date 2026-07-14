// Cutthroat Island
// #ID = 31789

level = {
    0x01: "fighting her way through His Majesty's Prison",
    0x02: "riding a loose cart in the Quarry",
    0x03: "cutting pirates in Spittalfield",
    0x04: "cleaning the vermin from Spittalfield Tavern",
    0x05: "fencing and dodging hurdles in the Carriage Chase",
    0x06: "trying to get aboard a ship in Spittalfield Harbor",
    0x07: "violently stowing away Morning Star",
    0x08: "playing cat and mouse in Cutthroat Island Jungle",
    0x09: "exploring a cave in Cutthroat Island Jungle",
    0x0a: "exploring a cave in Cutthroat Island Jungle",
    0x0b: "exploring a cave in Cutthroat Island Jungle",
    0x0c: "climbing down the Cliff",
    0x0d: "exploring the Treasure Cavern",
    0x0e: "exploring the Treasure Cavern",
    0x0f: "exploring the Treasure Cavern",
    0x10: "climbing down more Cliffs",
    0x11: "fighting under an orange sky in the Cove",
    0x12: "cuttin hey way through the Sea Battle Finale",
    0x13: "fighting Dawg Brown for the treasure",
    0x14: "has won the riches of a lifetime",
    0x16: "just escaped the Trasure Cavern"
}

function score() => 10 * byte(0x1c27) + 2560 * byte(0x1c28)

rich_presence_conditional_display(byte(0x135e)==0, "In Main Menu")
rich_presence_conditional_display(byte(0x135e)>0, "Morgan is {0} - Lives: {1} - Score: {2} - Continues: {3}",
                                  rich_presence_lookup("Level", byte(0x135e), level),
                                  rich_presence_value("Unsigned", byte(0x1c23), "VALUE"),
                                  rich_presence_value("Unsigned", score(), "VALUE"),
                                  rich_presence_value("Unsigned", byte(0x09dc), "VALUE")
)
rich_presence_display("Playing Cutthroat Island")


// Achievements
function inGame() => byte(0x1beb) > 0

achievement("Prison Break", description="Beat Stage 1: His Majesty's Prison", 
            points=5,
            type="progression",
            trigger=inGame() && byte(0x135e) == 0x01 && byte(0x1db3) == 1 && // Using the map piece count to prevent triggering from cutscene
                    prev(byte(0x1d05)) == 0 && byte(0x1d05) == 1
)

achievement("Maybe Add Brakes Next Time", description="Beat Stage 2: Quarry", 
            points=5, 
            type="progression",
            trigger=inGame() && byte(0x135e) == 0x02 && 
                    prev(byte(0x1d05)) == 0 && byte(0x1d05) == 1
)

achievement("Streets of Arrrr-age", description="Beat Stage 3: Spittalfield", 
            points=10, 
            type="progression",
            trigger=inGame() && byte(0x135e) == 0x03 && 
                    prev(byte(0x1d05)) == 0 && byte(0x1d05) == 1
)

achievement("Bar Fight", description="Beat Stage 4: Spittalfield Tavern", 
            points=10, 
            type="progression",
            trigger=inGame() && byte(0x135e) == 0x04 && 
                    prev(byte(0x1d05)) == 0 && byte(0x1d05) == 1
)

achievement("Fencing Meets Hurdle", description="Beat Stage 5: Carriage Chase", 
            points=10, 
            type="progression",
            trigger=inGame() && byte(0x135e) == 0x05 && 
                    prev(byte(0x1d05)) == 0 && byte(0x1d05) == 1
)

achievement("I Need to Catch My Ferry", description="Beat Stage 6: Spittalfield Harbor", 
            points=10, 
            type="progression",
            trigger=inGame() && byte(0x135e) == 0x06 && 
                    prev(byte(0x1d05)) == 0 && byte(0x1d05) == 1
)

achievement("Turbulent Stowaway", description="Beat Stage 7: Morning Star", 
            points=10, 
            type="progression",
            trigger=inGame() && byte(0x135e) == 0x07 && 
                    prev(byte(0x1d05)) == 0 && byte(0x1d05) == 1
)

achievement("Upscaled Game of Cat and Mouse", description="Beat Stage 8: Cutthroat Island Jungle", 
            points=5, 
            type="progression",
            trigger=inGame() && byte(0x135e) == 0x08 && 
                    prev(byte(0x1d05)) == 0 && byte(0x1d05) == 1
)

achievement("Going Down", description="Beat Stage 9: Cliff", 
            points=10, 
            type="progression",
            trigger=inGame() && prev(byte(0x135e) == 0x0c) && 
                    byte(0x135e) == 0x0d
)

achievement("With a Name Like That You'd Think There Was a Treasure", description="Beat Stage 10: Treasure Cavern", 
            points=10, 
            type="progression",
            trigger=inGame() && byte(0x135e) == 0x0f && 
                    prev(byte(0x1d05)) == 0 && byte(0x1d05) == 1
)

achievement("How Is It Still Going Down?", description="Beat Stage 11: Cliffs", 
            points=10,
            type="progression",
            trigger=inGame() && prev(byte(0x135e)) == 0x10 && 
                                byte(0x135e) == 0x11
)

achievement("It's a Pretty Sky to Die Under", description="Beat Stage 12: Cove", 
            points=5, 
            type="progression",
            trigger=inGame() && byte(0x135e) == 0x11 && 
                    prev(byte(0x1d05)) == 0 && byte(0x1d05) == 1
)

achievement("Sorry for Barging In", description="Beat Stage 13: Sea Battle Finale", 
            points=10, 
            type="progression",
            trigger=inGame() && byte(0x135e) == 0x12 && 
                    prev(byte(0x1d05)) == 0 && byte(0x1d05) == 1
)

achievement("I Prefer Doc Brown Anyway", description="Beat Dawg Brown and Win the Game", 
            points=25, 
            type="win_condition",
            trigger=inGame() && byte(0x135e) == 0x13 && 
                    prev(byte(0x1d05)) == 0 && byte(0x1d05) == 1
)

achievement("This Sword Ain't No Feather Duster", description="Clear any stage with an Accuracy of at least 80%", 
            points=5, 
            trigger=inGame() && byte(0x1dce) >= 80 &&
                    prev(byte(0x1dce)) != byte(0x1dce)
)

achievement("I'd Have More Chances Cutting Myself Shaving", description="Clear any Stage with 100% Health remaining", 
            points=3, 
            trigger=inGame() && byte(0x1dd1) == 100 &&
                    prev(byte(0x1dd1)) < 100
)

achievement("You're Not Worth Sullying My Blade", description="Beat The Warden without pressing the Sword button", 
            points=5, 
            type="missable",
            trigger=inGame() && once(byte(0x135e) == 0x01 && word(0x0f32) == 0x28) &&
                    disable_when(bit5(0x12ad) == 1) && 
                    (always_false() || never(byte(0x1beb) == 0x00) || never(prev(word(0x0f32)) < 0x28 && word(0x0f32) == 0x28)) && 
                    prev(word(0x0f32)) >  0x00 &&
                    trigger_when(word(0x0f32) == 0x00)
                    
)

achievement("Hollywood Acrobatics", description="Pick up the Fruits in Spittalfield Tavern", 
            points=1, 
            type="missable",
            trigger=inGame() && byte(0x135e) == 0x04 &&
                    prev(byte(0x09cd)) == 0x00 && trigger_when(byte(0x09cd) == 0x01)
)

achievement("Cave Explorer", description="Pick up Fruits and an Extra Life in Cutthroat Island Jungle's caves", 
            points=3, 
            type="missable",
            trigger=inGame() && byte(0x135e) >= 0x08 && byte(0x135e) <= 0x0b &&
                    prev(byte(0x09d5) + byte(0x09d6)) == 1 &&
                    trigger_when(measured(byte(0x09d5) + byte(0x09d6) == 2, when=byte(0x135e) >= 0x08 && byte(0x135e) <= 0x0b))
)

achievement("Try This Shortcut!", description="Throw 5 ennemies off the Cliffs", 
            points=5, 
            type="missable",
            trigger=inGame() && never(byte(0x135e) != 0x10) && 
                    trigger_when(measured(tally(5, prev(word(0x0f32)) == word(0x0f32) && prev(word(0x0ef6)) <= 0x10 + word(0x0e8e) && word(0x0ef6) > 0x10 + word(0x0e8e)), when=byte(0x135e) == 0x10)) // Enemy did not change AND current enemy is well below Morgan's level and falling
) 

achievement("Why Would You Hide This Here?", description="Consume the Life Potion in the first section of Treasure Cavern", 
            points=3, 
            type="missable",
            trigger=inGame() && byte(0x135e) == 0x0d &&
                    prev(byte(0x09cc)) == 0x00 &&
                    trigger_when(byte(0x09cc) == 0x01)
)

achievement("Never-Ending Pests", description="Kill 10 bats in the first section of Treasure Cavern", 
            points=2, 
            type="missable",
            trigger=inGame() && never(byte(0x135e) != 0x0d) &&                    
                    trigger_when(measured(tally(10, 150 + prev(score()) == score()), when=byte(0x135e) == 0x0d))
)

achievement("I Don't Need No Afterlife", description="Win the game without using a continue", 
            points=25, 
            type="missable",
            trigger=inGame() && byte(0x135e) == 0x13 && 
                    disable_when(prev(byte(0x09dc)) > byte(0x09dc), until = byte(0x135e) == 0x00) &&
                    prev(byte(0x1d05)) == 0 && byte(0x1d05) == 1 
)

// Leaderboard 
leaderboard("Total Score", description="Reach the highest score you can in a complete playthrough",
            format="SCORE",
            start=inGame() && prev(byte(0x135e)) == 0x13 && byte(0x135e) == 0x14,
            submit=always_true(),
            cancel=always_false(),
            value=score()

)
