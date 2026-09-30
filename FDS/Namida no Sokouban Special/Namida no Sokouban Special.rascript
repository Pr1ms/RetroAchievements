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

function wonGameMode() => (prev(byte(0x00e6)) == 0x7a || prev(byte(0x00e6)) == 0x60) && byte(0x00e6) == 0x2c
function wonPuzzleMode() => prev(byte(0x00e6)) == 0x7a && byte(0x00e6) == 0x2c
function fellAsleep() => (prev(byte(0x00e6)) == 0x7a || prev(byte(0x00e6)) == 0x60) && byte(0x00e6) == 0x2c
function triggerWonGameMode() => (prev(byte(0x00e6)) == 0x7a || prev(byte(0x00e6)) == 0x60) && trigger_when(byte(0x00e6) == 0x2c)
function triggerWonPuzzleMode() => prev(byte(0x00e6)) == 0x7a && trigger_when(byte(0x00e6) == 0x2c)
function restart() => (prev(byte(0x00e6)) == 0x7a || prev(byte(0x00e6)) == 0x60) && byte(0x00e6) == 0x12
function gameOver() => (prev(byte(0x00e6)) == 0x7a || prev(byte(0x00e6)) == 0x60) && byte(0x00e6) == 0x16
function usedBellPowerUp() => prev(byte(0x00e6)) == 0x7a && byte(0x00e6) == 0x60

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
    ["Tidier", 10],
    ["Straightener", 20],
    ["Sorter", 30],
    ["Pusher", 40],
    ["Stacker", 50],
    ["Organizer", 60],
    ["Stocker", 70],
    ["Storekeeper", 80],
    ["Custodian", 90],
    ["Steward", 100],
    ["Quartermaster", 110],
    ["Warehouseman", 120],
    ["Logistics Ace", 130],
    ["Master Organizer", 140],
]

for progressionAchievement in progressionAchievements
{
    achievement(title=progressionAchievement[0], type="progression", points=10,
                description="In Game Mode, beat level " + progressionAchievement[1],
                trigger=inGameMode() && byte(0x002e) == progressionAchievement[1] && wonGameMode()
    )
}

achievement(title="Warehouse Wizard", type="win_condition", points=25,
                description="In Game Mode, beat level 150",
                trigger=inGameMode() && byte(0x002e) == 150 && wonGameMode()
)

maxMovesAchievements = [
    [115, 1923, 10, "The Year the USSR Was Established"],
    [77, 1991, 10, "The Year the USSR Was Disolved"],
    [66, 2013, 10, "The Year the Harlem Shake Went Viral"],
    [135, 2132, 10, "The RFC for DHCP Options"],
    [108, 2149, 10, "The Starting Year of Terra Nova"],
    [76, 2225, 10, "The Year of Infinite Ryvius"],
    [150, 2253, 10, "The Year Spock Joined the Enterprise Under Pike's Command"],
    [143, 2540, 25, "The Year of Doctor Who's Frontier in Space"],
    [139, 3156, 25, "The ID of the Ellington Asteriod"],    
    [125, 3851, 25, "The ID of the Alhambra Asteriod"]
]

achievement(title="Sleeping on the Job", points=1,
                description="Fall asleep and hear the special sleeping song",
                trigger=(inGameMode() || inPuzzleMode()) && (prev(byte(0x00e6)) == 0x7a || prev(byte(0x00e6)) == 0x60) && byte(0x00e6) == 0x50
)


for maxMovesAchievement in maxMovesAchievements
{
    achievement(title=maxMovesAchievement[3], points=maxMovesAchievement[2],
                description="In Puzzle Mode, beat level " + maxMovesAchievement[0] + " in at most " + maxMovesAchievement[1] + " moves",
                trigger=inPuzzleMode() && levelScore() <= maxMovesAchievement[1] && byte(0x002e) == maxMovesAchievement[0] && triggerWonPuzzleMode()
    )
}

function magnetCount() => byte(0x2a)
function ropeCount() => byte(0x2b)
function bellCount() => byte(0x2c)
function oilCanCount() => byte(0x2d)

achievement(title="I’d Rather Win Fair and Square", type="missable", points=5,
            description="In Game Mode, have all Power-ups at once on you and win a level without using any",
            trigger=inGameMode() && magnetCount() >= 1 && ropeCount() >= 1 && bellCount() >= 1 && oilCanCount() >= 1 && triggerWonGameMode() &&
                    disable_when(prev(magnetCount()) > magnetCount()) && disable_when(prev(ropeCount()) > ropeCount()) &&
                    disable_when(prev(bellCount()) > bellCount()) && disable_when(prev(oilCanCount()) > oilCanCount()) &&
                    (always_false() || never(prev(byte(0x002e))!= byte(0x002e))) &&
                    (always_false() || never(restart())) &&
                    (always_false() || never(gameOver()))
)

achievement(title="Packing Heat", type="missable", points=10,
            description="In Game Mode, have at least 5 of each Power-up at once",
            trigger=inGameMode() && magnetCount() >= 5 && ropeCount() >= 5 && bellCount() >= 5 && oilCanCount() >= 5 &&
                    (prev(magnetCount()) == 4 || prev(ropeCount()) == 4 || prev(bellCount()) == 4 || prev(oilCanCount()) == 4)
)

achievement(title="Accio", type="missable", points=1,
            description="In Game Mode, successfully use a Magnet Power-up",
            trigger=inGameMode() && levelScore() + 300 == prev(levelScore())
)

achievement(title="I Found the Pull Button", type="missable", points=1,
            description="In Game Mode, successfully use a Rope Power-up",
            trigger=inGameMode() && levelScore() + 100 == prev(levelScore())
)

achievement(title="Wake Up!", type="missable", points=1,
            description="In Game Mode, successfully use a Bell Power-up",
            trigger=inGameMode() && usedBellPowerUp()
)

achievement(title="On Top of Elbow Grease", type="missable", points=1,
            description="In Game Mode, successfully use an Oil Can Power-up",
            trigger=inGameMode() && levelScore() + 500 == prev(levelScore())
)

achievement(title="Run, You Clever Boy", type="missable", points=10,
            description="Get a Perfect score on any bonus level",
            trigger=inGameMode() && prev(byte(0x00e6)) == 0x60 && trigger_when(byte(0x00e6) == 0x2c) && trigger_when(prev(levelScore()) + 5000 == levelScore())
)

for level in range(1, 150)
{
    leaderboard(title="Fewest Moves in Level " + level, lower_is_better=true,
                description="In Puzzle Mode, beeat level " + level + " using as few moves as you can",
                start=inPuzzleMode() && byte(0x002e) == level && wonPuzzleMode(),
                cancel=always_false(),
                submit=always_true(),
                value=levelScore()
    )
}