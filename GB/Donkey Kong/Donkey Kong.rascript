// Donkey Kong
// #ID = 692

WorldNameLookup = {
    0x00: "in The Construction Zone",
    0x01: "in The Big-City",
    0x02: "in The Forest",
    0x03: "on The Ship",
    0x04: "in The Jungle",
    0x05: "in The Desert",
    0x06: "in The Airplane",
    0x07: "on The Iceberg",
    0x08: "in The Rocky-Valley",
    0x09: "in The Tower",
}

function world() => byte(0x00C860)
function stage() => byte(0x00C861)
function lives() => byte(0x00DA43)
function stageComplete() => prev(byte(0x00C160)) == 0 && byte(0x00C160) == 1

rich_presence_conditional_display(stage() == 0, "In Main Menu")
rich_presence_conditional_display(prev(word(0xdef7)) != word(0xdef7), "In Demo Mode")

rich_presence_conditional_display(stage() > 0, "Mario is battling Donkey Kong {0}, Stage {1}, {2} Lives",
    rich_presence_lookup("WorldName", world(), WorldNameLookup),
    rich_presence_value("StageNumber", stage()),
    rich_presence_value("Lives", lives())
)
rich_presence_display("Playing Donkey Kong")


achievement(
    title = "Broken Hearts", points = 5, type="progression",
    description = "Complete Stage 0-4 and beat the game... or not!",
    id = 4602, badge = "17587", published = "27/01/2014 13:32:19",
    trigger = world() == 0 && stage() == 4 && stageComplete()
)

achievement(
    title = "Learn How to Platform", points = 5, type="progression",
    description = "Complete Stage 1-4",
    id = 12870, badge = "17588", published = "11/09/2014 19:11:18",
    trigger = world() == 1 && stage() == 4 && stageComplete()
)

achievement(
    title = "DK Has Some Leverage", points = 5, type="progression",
    description = "Complete Stage 1-8 and clear the Big-City",
    id = 4603, badge = "17590", published = "27/01/2014 13:32:21",
    trigger = world() == 1 && stage() == 8 && stageComplete()
)

achievement(
    title = "Mario's American Handstand", points = 5, type="progression",
    description = "Complete Stage 2-4",
    id = 18169, badge = "17591", published = "03/12/2014 14:45:25", 
    trigger = world() == 2 && stage() == 4 && stageComplete()
)

achievement(
    title = "DK Has No Brakes", points = 5, type="progression",
    description = "Complete Stage 2-8",
    id = 18170, badge = "17592", published = "03/12/2014 14:56:25", 
    trigger = world() == 2 && stage() == 8 && stageComplete()
)

achievement(
    title = "Mario's a Swinger", points = 5, type="progression",
    description = "Complete Stage 2-12 and clear the Forest",
    id = 4604, badge = "17594", published = "27/01/2014 13:32:23",
    trigger = world() == 2 && stage() == 12 && stageComplete()
)

achievement(
    title = "Hi! Jump!", points = 5, type="progression",
    description = "Complete Stage 3-4",
    id = 18175, badge = "17595", published = "03/12/2014 15:32:26", 
    trigger = world() == 3 && stage() == 4 && stageComplete()
)

achievement(
    title = "Mario's Triple Rock Jump", points = 5, type="progression",
    description = "Complete Stage 3-8 and clear the Ship",
    id = 4605, badge = "17596", published = "27/01/2014 13:32:25", 
    trigger = world() == 3 && stage() == 8 && stageComplete()
)

achievement(
    title = "A Fungus Among Us", points = 5, type="progression",
    description = "Complete Stage 4-4",
    id = 18177, badge = "17597", published = "03/12/2014 15:56:10",
    trigger = world() == 4 && stage() == 4 && stageComplete()
)

achievement(
    title = "Stop! Hammer Time!", points = 5, type="progression",
    description = "Complete Stage 4-8",
    id = 18178, badge = "17598", published = "03/12/2014 16:06:39", 
    trigger = world() == 4 && stage() == 8 && stageComplete()
)

achievement(
    title = "A Smashing Good Time", points = 10, type="progression",
    description = "Complete Stage 4-12 and clear the Jungle",
    id = 4606, badge = "17601", published = "27/01/2014 13:32:27", 
    trigger = world() == 4 && stage() == 12 && stageComplete()
)

achievement(
    title = "Low Clearance", points = 5, type="progression",
    description = "Complete Stage 5-4",
    id = 18180, badge = "17630", published = "04/12/2014 05:46:00", 
    trigger = world() == 5 && stage() == 4 && stageComplete()
)

achievement(
    title = "Mario and His Mummy", points = 5, type="progression",
    description = "Complete Stage 5-8",
    id = 18181, badge = "17632", published = "04/12/2014 05:53:39", 
    trigger = world() == 5 && stage() == 8 && stageComplete()
)

achievement(
    title = "A Wing and a Prayer", points = 10, type="progression",
    description = "Complete Stage 5-12 and clear the Desert",
    id = 4607, badge = "17633", published = "27/01/2014 13:32:29", 
    trigger = world() == 5 && stage() == 12 && stageComplete()
)

achievement(
    title = "Mario Under Fire", points = 5, type="progression",
    description = "Complete Stage 6-4",
    id = 18182, badge = "17634", published = "04/12/2014 06:16:06", 
    trigger = world() == 6 && stage() == 4 && stageComplete()
)

achievement(
    title = "Fire and Ice", points = 10, type="progression",
    description = "Complete Stage 6-8 and clear the Airplane",
    id = 4608, badge = "17635", published = "27/01/2014 13:32:31", 
    trigger = world() == 6 && stage() == 8 && stageComplete()
)

achievement(
    title = "Between a Rock and a Sharp Place", points = 5, type="progression",
    description = "Complete Stage 7-4",
    id = 18206, badge = "17636", published = "04/12/2014 06:36:45", 
    trigger = world() == 7 && stage() == 4 && stageComplete()
)

achievement(
    title = "That Sinking Feeling", points = 5, type="progression",
    description = "Complete Stage 7-8",
    id = 18207, badge = "17637", published = "04/12/2014 06:44:44", 
    trigger = world() == 7 && stage() == 8 && stageComplete()
)

achievement(
    title = "He's Still Tailing You, Big Guy", points = 10, type="progression",
    description = "Complete Stage 7-12 and clear the Iceberg",
    id = 4609, badge = "17638", published = "27/01/2014 13:32:33",
    trigger = world() == 7 && stage() == 12 && stageComplete()
)

achievement(
    title = "It's Called Rocky Valley for a Reason", points = 5, type="progression",
    description = "Complete Stage 8-4",
    id = 18209, badge = "17639", published = "04/12/2014 07:36:28", 
    trigger = world() == 8 && stage() == 4 && stageComplete()
)

achievement(
    title = "Iwata Fall", points = 5, type="progression",
    description = "Complete Stage 8-8",
    id = 18210, badge = "17641", published = "04/12/2014 07:50:26",
    trigger = world() == 8 && stage() == 8 && stageComplete()
)

achievement(
    title = "CAUTION - LAVA MAY BE HOT", points = 5, type="progression",
    description = "Complete Stage 8-12",
    id = 18211, badge = "17642", published = "04/12/2014 07:58:43", 
    trigger = world() == 8 && stage() == 12 && stageComplete()
)

achievement(
    title = "GET IN DA TOWA!", points = 10, type="progression",
    description = "Complete Stage 8-16 and clear the Rocky-Valley",
    id = 4610, badge = "17643", published = "27/01/2014 13:32:36", 
    trigger = world() == 8 && stage() == 16 && stageComplete()
)

achievement(
    title = "Despite All My Rage, I'm Just a Chimp in a Cage", points = 5, type="progression",
    description = "Complete Stage 9-4",
    id = 18212, badge = "17645", published = "04/12/2014 08:17:02", 
    trigger = world() == 9 && stage() == 4 && stageComplete()
)

achievement(
    title = "Game Over?", points = 10, type="progression",
    description = "Complete Stage 9-8 and beat the game... wait, what?!",
    id = 18213, badge = "17646", published = "04/12/2014 08:23:14",
    trigger = world() == 9 && stage() == 8 && stageComplete()
)

achievement(
    title = "No More Monkey Business", points = 25, type="win_condition",
    description = "Defeat Giant Donkey Kong in Stage 9-9 and beat the game",
    id = 8498, badge = "17647", published = "23/05/2014 07:54:26",
    trigger = world() == 9 && stage() == 9 && stageComplete()
)

// Time attacks
timeAttacksData = [
    // [title, points, world, stage of unlock, start offset in the time array, end offset in the time array]
    ["Fight through the Construction Site", 5, 365, 0, 4, 0, 3],
    ["Blitz through the Big-City I", 5, 535, 1, 4, 4, 7],
    ["Blitz through the Big-City II", 10, 635, 1, 8, 8, 11],
    ["Frenzy Through the Forest I", 5, 520, 2, 4, 12, 15],
    ["Frenzy Through the Forest II", 5, 545, 2, 8, 16, 19],
    ["Frenzy Through the Forest III", 10, 520, 2, 12, 20, 23],
    ["Sprint through the Ship I", 5, 635, 3, 4, 24, 27],
    ["Sprint through the Ship II", 10, 635, 3, 8, 28, 31],
    ["Jaunt through the Jungle I", 5, 620, 4, 4, 32, 35],
    ["Jaunt through the Jungle II", 5, 630, 4, 8, 36, 39],
    ["Jaunt through the Jungle III", 10, 770, 4, 12, 40, 43],
    ["Dash through the Desert I", 5, 570, 5, 4, 44, 47],
    ["Dash through the Desert II", 5, 445, 5, 8, 48, 51],
    ["Dash through the Desert III", 10, 745, 5, 12, 52, 55],
    ["Advancing through the Airplane I", 5, 650, 6, 4, 56, 59],
    ["Advancing through the Airplane II", 10, 575, 6, 8, 60, 63],
    ["Creep through the Cold I", 5, 475, 7, 4, 64, 67],
    ["Creep through the Cold II", 5, 680, 7, 8, 68, 71],
    ["Creep through the Cold III", 10, 620, 7, 12, 72, 75],
    ["Run through the Rocky-Valley I", 5, 690, 8, 4, 76, 79],
    ["Run through the Rocky-Valley II", 5, 655, 8, 8, 80, 83],
    ["Run through the Rocky-Valley III", 5, 670, 8, 12, 84, 87],
    ["Run through the Rocky-Valley IV", 10, 600, 8, 16, 88, 91],
    ["Powering through the Tower I", 5, 710, 9, 4, 92, 95],
    ["Powering through the Tower II", 10, 710, 9, 8, 96, 100]
]

for index in range(0, length(timeAttacksData) - 1) {
    element = timeAttacksData[index]
    timeTarget = element[2]
    world = element[3]
    stage = element[4]
    startOffset = element[5]
    endOffset = element[5] 
    achievement(title = element[0], points = element[1], 
                description = "Complete Stages " + world + "-" + (stage - 3) + " through " + world + "-" + stage + " with at least " + timeTarget + " total seconds remaining",
                trigger = world() == world && stage() == stage &&
                          byte(0xa190 + 4 * startOffset) + byte(0xa190 + 4 * (startOffset + 1)) + byte(0xa190 + 4 * (startOffset + 2)) + byte(0xa190 + 4 * (startOffset + 3)) >= timeTarget &&
                          prev(byte(0xa190 + 4 * (startOffset + 3))) == 0 && byte(0xa190 + 4 * (startOffset + 3)) > 0
    )
}

achievement(
    title = "The King of Kong", points = 10,
    description = "Score 500,000 points",
    id = 112805, badge = "128104", published = "06/06/2020 22:42:19", 
    trigger = stage() != 0 && prev(word(0x00DA41)) < 5000 && word(0x00DA41) >= 5000
)

// This one is set aside because it is different: one item per level, no bonus stage
achievement(
    title = "Pauline's Prizes - Construction Site", points = 1,
    description = "Collect all of Pauline's items in World 0 in one session",
    id = 112796, badge = "12776", published = "06/06/2020 22:41:29", 
    trigger = never(byte(0xd847) == 0) && measured(tally(3, 
                       once(stage() == 2 && bit0(0x00C859) == 1 && stageComplete()),
                       once(stage() == 3 && bit2(0x00C859) == 1 && stageComplete()), 
                       once(stage() == 4 && bit1(0x00C859) == 1 && stageComplete())), when=world() == 0)                                           
)

paulineChallenges = [
    // [title, points, stagesCount]
    ["Big-City", 4, 8],
    ["Forest", 10, 12],
    ["Ship", 5, 8],
    ["Jungle", 10, 12],
    ["Desert", 10, 12],
    ["Airplane", 5, 8],
    ["Iceberg", 10, 12],
    ["Rocky-Valley", 10, 16]
]

for index in range(0, length(paulineChallenges) - 1) {
    challenge = paulineChallenges[index]
    
    tallyConds = []
    for stage in range(1, challenge[2])
    {
        if (stage % 4 > 0)
        {
            array_push(tallyConds, stage() == stage && byte(0x00C859) == 7 && stageComplete())
        }
    }
    
    achievement(
    title = "Pauline's Prizes - " + challenge[0], points = challenge[1],
    description = "Collect all of Pauline's items in World " + (index + 1) + " in one session",
    trigger = never(byte(0xd847) == 0) && measured(tally((challenge[2] / 4) * 3, tallyConds), when=world() == (index + 1))
    )
}

achievement(
    title = "One Plumber vs. the World (and an Ape)", points = 25,
    description = "Clear World 9 without losing any lives",
    id = 112807, badge = "122761", published = "06/06/2020 22:42:28",
    trigger = world() == 9 &&
              trigger_when(repeated(9, world() == 9 && byte(0x00C160) == 1 && prev(byte(0x00C160)) == 0)) &&
              disable_when(world() == 9 && byte(0x00DA43) < prev(byte(0x00DA43))) &&
              (always_false() || (never(byte(0x00c861) == 0 && byte(0x00D847) == 0)))
)


for index in range(0, length(timeAttacksData) - 1) {
    element = timeAttacksData[index]
    timeTarget = element[2]
    world = element[3]
    stage = element[4]
    stage_string = world + "-" + stage
    startOffset = element[5]
    endOffset = element[5] 

    leaderboard(
        title = "Speedrun Stage " + stage_string,
        description = "Beat stage " + stage_string + " with the highest total time you can",
        start  = world() == world && stage() == stage && prev(byte(0xa190 + 4 * (startOffset + 3))) == 0 && byte(0xa190 + 4 * (startOffset + 3)) > 0,
        cancel = always_false(),
        submit = always_true(),
        value  = byte(0xa190 + 4 * startOffset) + byte(0xa190 + 4 * (startOffset + 1)) + byte(0xa190 + 4 * (startOffset + 2)) + byte(0xa190 + 4 * (startOffset + 3)),
        format = "VALUE"
    )
}

leaderboard(
    id = 9076, title = "Beat the Game",
    description = "Beat the game in one session as fast as you can (must start from 0-1 with four lives)",
    start  = world() == 0 && byte(0x00DA43) == 4 && prev(stage()) == 0 && stage() == 1,
    cancel = stage() == 0 && byte(0x0000d847) == 0,
    submit = world() == 9 && stage() == 9 && byte(0x00C160) == 1 && prev(byte(0x00C160)) == 0,
    value  = measured(tally(0, always_true())),
    format = "FRAMES", lower_is_better = true
)


