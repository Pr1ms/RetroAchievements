// Blodia
// #ID = 7289

function inDemoMode() => byte(0xd001) == 0x0f

gameModes = {
    0: "1 Play",
    1: "2 Play",
    2: "1 Edit",
    3: "2 Edit"
}

puzzleTiers = {
    0: "Warm Up",
    1: "Hurry",
    2: "Maze",
    3: "Hard"
}

function score() => high4(0xd013) * 100000 + low4(0xd013) * 10000 + high4(0xd014) * 1000 + low4(0xd014) * 100 + high4(0xd015) * 10 + low4(0xd015)

function outOfTrack() => prev(byte(0xd012)) == 0 && byte(0xd012) == 1
function levelWon() => outOfTrack() && byte(0xffc7) == 0
function levelLost() => outOfTrack() && byte(0xffc7) > 0
function tier() => byte(0xd002)
function puzzleId() => byte(0xd003)

rich_presence_conditional_display(inDemoMode(), "In Demo Mode")
rich_presence_conditional_display(always_true(), "{0} - {1} {2} - Score: {3}",
                                  rich_presence_lookup("GameMode", low4(0xd011), gameModes),
                                  rich_presence_lookup("PuzzleTier", tier(), puzzleTiers),
                                  rich_presence_value("Unsigned", puzzleId(), "VALUE"),                                  
                                  rich_presence_value("Score", score(), "SCORE")
                                  
)
rich_presence_display("Playing Blodia")

tiers = [
    [0, [["Tissue Prep", 5, 1, 5], ["Raising Body Temperature", 5, 6, 10], ["Dynamic Mobility", 5, 11, 15], ["Muscle Activation", 5, 16, 20], ["Potentiation", 4, 20, 24]]],
    [1, [["Marathon", 5, 1, 5], ["Sprint", 5, 6, 10], ["Light Speed", 5, 11, 15], ["Ridiculous Speed", 5, 16, 20], ["Ludicrous Speed", 4, 20, 24]]],
    [2, [["Straying", 5, 1, 5], ["Going off Course", 5, 6, 10], ["Losing Bearings", 5, 11, 15], ["Total Disorientation", 5, 16, 20], ["Lost in the Woods", 4, 20, 24]]],
    [3, [["Punishing", 5, 1, 5], ["Relentless", 5, 6, 10], ["Apocalyptic", 5, 11, 15], ["Sadistic", 5, 16, 20], ["Unforgiving", 4, 20, 24]]]
]    

function makeCheckpoints(aTier, start, end)
{
    condition = always_true()
    
    for puzzle in range(start, end)
    {
        condition = condition && once(tier() == aTier && puzzleId() == puzzle && levelWon())
    }
    
    return condition
}

for tier in tiers {
    
    for milestone in tier[1]
    {
          achievement(title=milestone[0], points=milestone[1],
                      description="Clear puzzles " + milestone[2] + " through " + milestone[3] + " of the " + puzzleTiers[tier[0]] + " Block in a single session",
                      trigger=makeCheckpoints(tier[0], milestone[2], milestone[3])    
          )  
    }    
}

achievement(title="If This Was Only the Warm Up, I'm Gonna Be Sore Tomorrow!", points=10, type="progression",
            description="Clear the Warm Up Block",
            trigger=tier() == 0 && puzzleId() == 25 && prev(bit0(0xd008)) == 0 && bit0(0xd008) == 1
)  

achievement(title="I Ran I Fast as I Could... Are We There Yet?", points=10, type="progression",
            description="Clear the Hurry Block",
            trigger=tier() == 1 && puzzleId() == 25 && prev(bit1(0xd008)) == 0 && bit1(0xd008) == 1
)  

achievement(title="I Read the Map Wrong and Got Lost a Couple of Times", points=10, type="progression",
            description="Clear the Maze Block",
            trigger=tier() == 2 && puzzleId() == 25 && prev(bit2(0xd008)) == 0 && bit2(0xd008) == 1
)  

achievement(title="After the Maze Block, I Though I Knew Hard Already... I Didn't!", points=10, type="progression",
            description="Clear the Hard Block",
            trigger=tier() == 3 && puzzleId() == 25 && prev(bit3(0xd008)) == 0 && bit3(0xd008) == 1
)  

achievement(title="My Brain Has Melted but at Least I Got a Nice Bouquet", points=10, type="win_condition",
            description="Have all four Blocks Cleared at once",
            trigger=puzzleId() == 25 && prev(bit0(0xd008) + bit1(0xd008) + bit2(0xd008) + bit3(0xd008)) == 3 && bit0(0xd008) + bit1(0xd008) + bit2(0xd008) + bit3(0xd008) == 4
)  

// TODO: High score per tier (reset when going back to main menu)

for tier in range(0, 3)
{
    for puzzle in range(1, 25)
    {
        leaderboard(title=puzzleTiers[tier] + " " + puzzle + " Efficiency Run",
                    description="Clear " + puzzleTiers[tier] + " " + puzzle + "in as few moves as possible",
                    start=tier() == tier && puzzleId() == puzzle && prev(byte(0xffc7)) == 0 && byte(0xffc7) > 0,
                    cancel=levelLost(),
                    submit=levelWon(),
                    value=prev(byte(0xffe2)) != byte(0xffe2)
        )
    }
}