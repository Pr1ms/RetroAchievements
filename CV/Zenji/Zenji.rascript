// Zenji
// #ID = 9579

function inGame() => byte(0x001A) == 0x01
function score() => bcd(byte(0x01B3)) * 1000000 + bcd(byte(0x01B4)) * 10000 + bcd(byte(0x01B5)) * 100 + bcd(byte(0x01B6))

rich_presence_conditional_display(inGame(), "Player {2} - Solved Puzzles: {3} - Faces: {0} - Score: {1}",
                                  rich_presence_value("VALUE", bcd(byte(0x01B1)), "Value"),
                                  rich_presence_value("SCORE", score(), "Score"),
                                  rich_presence_value("VALUE", bcd(byte(0x01A7)), "Value"),
                                  rich_presence_value("VALUE", bcd(byte(0x01B0)), "Value")
)
rich_presence_conditional_display(byte(0x001D) == 0x0D, "In Main Menu")
rich_presence_conditional_display(byte(0x001D) == 0x0B || byte(0x001D) == 0x0C, "On the Scoreboard")
rich_presence_display("Playing Zenji")

achievement("Zen Little Puzzle Game",
            description="Beat a 4 x 3 Level", 
            type="progression",
            points=5, 
            trigger=inGame() && (byte(0x01B0) == 0x00 || byte(0x01B0) == 0x01) &&
                    prev(byte(0x001D)) == 0x04 && byte(0x001D) == 0x05
)

achievement("Fire in the Maze", 
            description="Beat a 5 x 4 Level", 
            type="progression",
            points=10, 
            trigger=inGame() && (byte(0x01B0) == 0x02 || byte(0x01B0) == 0x31) &&
                    prev(byte(0x001D)) == 0x04 && byte(0x001D) == 0x05
)

achievement("Twice the Danger", 
            description="Beat a 6 x 5 Level", 
            type="progression",
            points=10, 
            trigger=inGame() && (byte(0x01B0) == 0x04 || byte(0x01B0) == 0x05) &&
                    prev(byte(0x001D)) == 0x04 && byte(0x001D) == 0x05
)

achievement("Mental Pressure", 
            description="Beat a 7 x 6 Level", 
            type="win_condition",
            points=25,
            trigger=inGame() && byte(0x01B0) >= 0x06 && 
                    prev(byte(0x001D)) == 0x04 && byte(0x001D) == 0x05
)

achievement("It's Okay, I Can Wait", 
            description="Beat a Level by having the last not connected Tile disappear on its own", 
            points=10, 
            trigger=inGame() && once(prev(byte(0x01B8)) > 0x00 && byte(0x01B8) == 0x00) &&
                    never(byte(0x001D) == 0x02) &&
                    prev(byte(0x001D)) == 0x04 && byte(0x001D) == 0x05    
)

achievement("Luck and a Keen Eye", 
            description="Beat a Level by doing a single Tile rotation", 
            points=10, 
            trigger=inGame() && 
                    disable_when(repeated(2, prev(byte(0x001D)) == 0x01 && byte(0x001D) == 0x02)) &&
                    (always_false() || never(byte(0x001D) == 0x00 || byte(0x001D) == 0x07)) &&
                    prev(byte(0x001D)) == 0x04 && byte(0x001D) == 0x05
)

achievement("Don't You Disappear on Me", 
            description="Collect a Timed Tile in time", 
            points=5, 
            trigger=inGame() && byte(0x01B8) > 0 && prev(byte(0x00E9)) != byte(0x01BD) && byte(0x00E9) == byte(0x01BD)
)

achievement("Getting some Mileage", 
            description="Score 5,000 points", 
            points=5, 
            trigger=inGame() && 
                    prev(byte(0x01B3)) == 0 && prev(byte(0x01B4)) == 0 && prev(byte(0x01B5)) < 0x50 && 
                    score() >= 5000
)        

achievement("I'll Keep This in a Jar by the Door", 
            description="Get an Extra Face by scoring 10,000 points", 
            points=10, 
            trigger=inGame() && 
                    prev(byte(0x01B3)) == 0 && prev(byte(0x01B4)) == 0 &&
                    score() >= 10000
)

achievement("I Could Go on Forever", 
            description="Get another Extra Face by scoring 30,000 points", 
            points=10, 
            trigger=inGame() && 
                    prev(byte(0x01B3)) == 0 && prev(byte(0x01B4)) < 0x03 &&
                    score() >= 30000
)    

// Leaderboards
leaderboard("Highscore",
            description="Get the highest score you can in a single run",            
            format="SCORE",
            start=prev(byte(0x001D)) == 0x0A && byte(0x001D) == 0x0B,
            cancel=always_false(),
            submit=always_true(),
            value=score()
)

leaderboard("Levels Beaten",
            description="Beat as many puzzles as you can in a single run",            
            start=prev(byte(0x001D)) == 0x0A && byte(0x001D) == 0x0B,
            cancel=always_false(),
            submit=always_true(),
            value=byte(0x01B0)
)