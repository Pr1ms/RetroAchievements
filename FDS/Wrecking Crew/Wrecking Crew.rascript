// Wrecking Crew
// #ID = 38446

function inGame() => byte(0x37) == 0
function score() => low4(0x86) * 100 + high4(0x86) * 1000 + low4(0x85) * 10000 + high4(0x85) * 100000
function lives() => byte(0x90)

rich_presence_conditional_display(byte(0x37) == 1 && byte(0x38) == 4, "In Demo Mode")
rich_presence_conditional_display(byte(0x37) == 1, "In Main Menu")
rich_presence_conditional_display(byte(0x37) == 0 && byte(0x38) == 0x08, "Game Over • Score: {0}",
                                  rich_presence_value("Score", score(), "SCORE")
)
rich_presence_conditional_display(byte(0x37) == 0, "Phase {0} (Started at {1}) • Score: {2} • Lives: {3}",
                                                   rich_presence_value("Number", byte(0x92) + 1, "VALUE"),
                                                   rich_presence_value("Number", byte(0x60) + 1, "VALUE"),
                                                   rich_presence_value("Score", score(), "SCORE"),
                                                   rich_presence_value("Number", lives(), "VALUE")                                                   

)
rich_presence_display("Playing Wrecking Crew")

progressions = [
    [1, 10, "Sledgehammer", 5],
    [11, 20, "Wrecker", 5],
    [21, 30, "Demolisher", 5],
    [31, 40, "Heavy Hitter", 5],
    [41, 50, "Building Breaker", 10],
    [51, 60, "Wrecking Ball", 10],
    [61, 70, "Demolition Expert", 10],
    [71, 80, "Structure Crusher", 10],
    [81, 90, "Master Wrecker", 10],
    [91, 100, "Wrecking Crew", 25],
]

/**
 measured(tally(5, once(byte(0x000035) == 0), once(byte(0x000036) == 0), once(byte(0x000037) == 0),
                  byte(0x000000) == 1)
              )
*/

collectionVerbs = [
    ["Finder", [1, 4, 6, 9, 10], [4, 6, 9, 10]],
    ["Seeker", [13, 15, 16, 18, 19, 20], [13, 15, 16]],
    ["Spotter", [23, 24, 26, 28 , 29, 30], [21, 22]],
    ["Scavenger", [32, 33, 34, 36, 37, 39, 40], [31, 34, 36, 39]],
    ["Gatherer", [43, 44, 45, 48 , 49], [43, 44, 47]],
    ["Picker", [52, 54, 55, 56, 58, 59, 60], [51, 55, 60]],
    ["Acquirer", [61, 62, 64, 66, 67, 68, 69, 70], [63, 66, 67, 69]],
    ["Prospector", [73, 74, 75, 76, 79], [75, 79]],
    ["Retriever", [82, 83, 86, 88], [81, 83, 84, 85, 86, 90]],
    ["Hoarder", [91, 92, 94, 96, 98, 100], [91, 94, 96, 97, 98, 100]]
]

function currentLevel() => byte(0x92)
function levelStarted() => prev(byte(0x38)) == 0x03 && byte(0x38) == 0x04
function paused() => byte(0x38) == 0x0b
function levelWon() => prev(byte(0x4c)) == 0x00 && byte(0x4c) == 0x01
function goingGameOver() => prev(byte(0x38)) == 0x07 && byte(0x38) == 0x08

function oneUp() => byte(0x38) == 4 && prev(byte(0x90)) + 1 == byte(0x90)
function pickedUpHammer() => (prev(byte(0x5c) == 0) && byte(0x5c) == 1) || (prev(score()) + 3200 == score())

for progression in progressions{
    achievement(title=progression[2], type="progression", points=progression[3],
                description="Beat Phases " + progression[0] + " through " + progression[1] + " without going back to Main Menu",
                trigger=inGame() && never(byte(0x37) == 1) && once(currentLevel() == progression[0] - 1) && currentLevel() == progression[1] - 1 && levelWon()
    )
}

for index in range(0, 9)
{
    progression = progressions[index]
    collectionVerb = collectionVerbs[index]
    
    checkpoints = []
    for levelId in collectionVerb[1] {
        array_push(checkpoints, once(currentLevel() == levelId - 1 && oneUp()))
    }
    
    achievement(title="Letters " + collectionVerb[0], points=10,
                description="Collect " + length(collectionVerb[1]) + " sets of MARIO letters between Phases " + progression[0] + " and " + progression[1] + " without going back to Main Menu",
                trigger=inGame() && never(byte(0x37) == 1) && measured(tally(length(collectionVerb[1]), checkpoints))
    )
}

for index in range(0, 9)
{
    progression = progressions[index]
    collectionVerb = collectionVerbs[index]
    
    checkpoints = []
    for levelId in collectionVerb[1] {
        array_push(checkpoints, once(currentLevel() == levelId - 1 && pickedUpHammer()))
    }
    
    achievement(title="Hammer " + collectionVerb[0], points=5,
                description="Collect " + length(collectionVerb[2]) + " Golden Hammers between Phases " + progression[0] + " and " + progression[1] + " without going back to Main Menu",
                trigger=inGame() && never(byte(0x37) == 1) && measured(tally(length(collectionVerb[2]), checkpoints))
    )
}

leaderboard(title="Highscore from Scratch", description="Get the highest Score possible from Phase 1 to Game Over",
            start=never(byte(0x37) == 1) && once(currentLevel() == 0) && goingGameOver(),
            cancel=always_false(),
            submit=always_true(),
            format="SCORE",
            value=score()
)

for levelId in range(1, 100)
{
    leaderboard(title="Phase " + levelId + " Speedrun", description="Win Phase " + levelId + " as fast as possible",
            start=currentLevel() == levelId - 1 && levelStarted(),
            cancel=prev(lives()) > lives(),
            submit=levelWon(),
            format="FRAMES",
            value=!paused()
    )
}