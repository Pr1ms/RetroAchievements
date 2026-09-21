// Namida no Sokouban Special
// #ID = 39000



//rich_presence_display(always_true(), "Katasuke-kun")

GameModes = {
    0: "Game Mode (Story)",
    1: "Puzzle Mode",
    2: "Editor"
}

function levelScore() => low4(0x0281) * 10000 + low4(0x0285) * 1000 + low4(0x0289) * 100 + low4(0x028d) * 10 + low4(0x0291)

function currentSlotId() => byte(0x004a)
function totalScore(slotId){
    score = 0
    pow_accumulator = 1
    for i in range(7, 0, -1)
    {
        score = score + pow_accumulator * low4(0x9acd + slotId * 14 + i)
        pow_accumulator = 10 * pow_accumulator
    }
    return score
}

function inGameMode() => byte(0x0034) == 0
function inPuzzleMode() => byte(0x0034) == 1

function won() => prev(byte(0x00e6)) == 0x7a && byte(0x00e6) == 0x2c
function fellAsleep() => prev(byte(0x00e6)) == 0x7a && byte(0x00e6) == 0x2c
function triggerWon() => prev(byte(0x00e6)) == 0x7a && trigger_when(byte(0x00e6) == 0x2c)

rich_presence_conditional_display(byte(0x00e6) == 0x00, "Booting up the game")
rich_presence_conditional_display(byte(0x00e6) == 0xa6, "In the Menus")

rich_presence_conditional_display(inGameMode(), "Katasuke-kun is tidying up in Game Mode - Level {0} - Level Score: {1} - Total Score: {2}",
                                  rich_presence_value("Unsigned", byte(0x002e), "VALUE"),
                                  rich_presence_value("Score", levelScore(), "SCORE"),
                                  rich_presence_value("Score", totalScore(currentSlotId()), "SCORE")                                                                                                     
)

rich_presence_conditional_display(inPuzzleMode(), "Katasuke-kun is tidying up in Puzzle Mode - Level {0} - Level Score: {1}",
                                  rich_presence_value("Unsigned", byte(0x002e), "VALUE"),
                                  rich_presence_value("Score", levelScore(), "SCORE")                                                                                                
)

rich_presence_conditional_display(byte(0x0034) == 2, "Building a level in the Editor")                                                                                                     


rich_presence_display("Playing Namida no Sokouban Special")


progressionAchievements = [
    ["Level 10", 10],
    ["Level 20", 20],
    ["Level 30", 30],
    ["Level 40", 40],
    ["Level 50", 50],
    ["Level 60", 60],
    ["Level 70", 70],
    ["Level 80", 80],
    ["Level 90", 90],
    ["Level 100", 100],
    ["Level 110", 110],
    ["Level 120", 120],
    ["Level 130", 130],
    ["Level 140", 140],
]

for progressionAchievement in progressionAchievements
{
    achievement(title=progressionAchievement[0], type="progression", points=10,
                description="In Game Mode, beat Level " + progressionAchievement[1],
                trigger=inGameMode() && byte(0x002e) == progressionAchievement[1] && won()
    )
}

achievement(title="Level 150", type="win_condition", points=25,
                description="In Game Mode, beat Level 150",
                trigger=inGameMode() && byte(0x002e) == 150 && won()
)

maxMovesAchievements = [
    [125, 3851, 25],
    [139, 3156, 25],
    [143, 2540, 25],
    [150, 2253, 10],
    [76, 2225, 10],
    [108, 2149, 10],
    [135, 2132, 10],
    [66, 2013, 10],
    [77, 1991, 10],
    [115, 1923, 10],
]

achievement(title="Sleeping on the Job", points=1,
                description="Fall asleep and hear the special sleeping song",
                trigger=(inGameMode() || inPuzzleMode()) && prev(byte(0x00e6)) == 0x7a && byte(0x00e6) == 0x50
)


for maxMovesAchievement in maxMovesAchievements
{
    achievement(title="Placeholder max moves " + maxMovesAchievement[0], points=maxMovesAchievement[2],
                description="In Puzzle Mode, beat Level " + maxMovesAchievement[0] + " in at most " + maxMovesAchievement[1] + " moves",
                trigger=inPuzzleMode() && levelScore() <= maxMovesAchievement[1] && byte(0x002e) == maxMovesAchievement[0] && triggerWon()
    )
}

