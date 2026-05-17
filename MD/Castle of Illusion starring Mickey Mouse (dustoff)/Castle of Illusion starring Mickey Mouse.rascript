// Castle of Illusion starring Mickey Mouse
// #ID = 9

LevelxMap = {
    0:"in the Enchanted Forest",
    1:"in the Enchanted Forest",
    2:"in the Enchanted Forest",
    3:"in the Enchanted Forest",
    5: "fighting against the Old Oak Tree in the Enchanted Forest",
    10: "in Toyland",
    11: "in Toyland",
    12: "in Toyland",
    13: "fighting against the Jack-In-The-Box in Toyland",
    20: "in the Storm",
    21: "in the Storm",
    22: "in the Storm",
    23: "fighting against the Storm-Men in the Storm",
    30: "in the Library",
    31: "in the Library",
    34: "in the Library",
    38: "in the Library",
    37: "in the Library",
    39: "fighting against the Licorice Dragon in the Library",
    40: "in the Castle",
    41: "in the Castle",
    42: "in the Castle",
    43: "fighting against the Oafish Clock Maker in the Castle",
    50: "fighting Mizrabel to save Minnie",
}

Difficulty = {
    0: "Normal",
    1: "Hard",
    2: "Practice",
}

function score() => word(0x00F22C) * 65536 + word(0x00F22E)

rich_presence_conditional_display(byte(0x00F40B) == 1, "In Demo Mode")
rich_presence_conditional_display(word(0x00F300) <= 10, "In the Titles")

rich_presence_conditional_display(word(0x00F322) > 0, "Mickey is {0} ({2}) - Lives: {1} - Score: {3}",
    rich_presence_lookup("Location", word(0x00FF44) * 10 + word(0x00FF46), LevelxMap, fallback="on his way to save Minnie"),
    rich_presence_value("Value", word(0x00F324), "VALUE"),
    rich_presence_lookup("Difficulty", byte(0x00FF0C), Difficulty),
    rich_presence_value("Score", score(), "SCORE")
)

rich_presence_display("Playing Castle of Illusion starring Mickey Mouse")


function inGame() => byte(0xf40b) == 0x00 && word(0x00f322) > 0

// Removing the measured, 
achievement(
    title = "High-Powered Mouse", points = 5,
    description = "Raise your Power Gauge to 5 on Normal difficulty or higher",
    trigger = inGame() && byte(0x00FF0C) != 2 && prev(word(0x00F322)) == 4 && word(0x00F322) == 5
)

achievement(
    title = "Lucky Seven", points = 5,
    description = "Earn 7 lives",
    trigger = inGame() && word(0x00F324) - prev(word(0x00F324)) == 1 && word(0x00F324) >= 7
)

achievement(
    title = "Keeping the Doctor Away", points = 5,
    type = "missable",
    description = "Collect 30 apples",
    trigger = inGame() && (word(0x00FF44) == 0 || word(0x00FF44) == 3) && 
              trigger_when(prev(word(0x00F320)) < word(0x00F320) && prev(word(0x00F320)) >= 20 && word(0x00F320) == 30)
)

achievement(
    title = "Marble Madness", points = 5,
    type = "missable",
    description = "Collect 30 marbles",
    trigger = inGame() && (word(0x00FF44) == 1 || word(0x00FF44) == 2) && 
              trigger_when(prev(word(0x00F320)) < word(0x00F320) && prev(word(0x00F320)) >= 20 && word(0x00F320) == 30)
)

achievement(
    title = "Sorcerer's Apprentice", points = 10,
    type = "missable",
    description = "Collect 15 candles",
    trigger = inGame() && word(0x00FF44) == 4 &&
              trigger_when(prev(word(0x00F320)) < word(0x00F320) && prev(word(0x00F320)) >= 5 && word(0x00F320) >= 15)
)

achievement(
    title = "Rodent's Riches", points = 5,
    description = "Score at least 75,000 points",
    id = 4316, badge = "04944", 
    trigger = inGame() && score() >= 75000 && prev(score()) < score()
)

achievement(
    title = "Mouse-tacular", points = 5,
    description = "Score at least 150,000 points",
    trigger = inGame() && score() >= 150000 && prev(score()) < score()
)

achievement(
    title = "High-Scoring Mouse", points = 10,
    description = "Score at least 250,000 points on Normal difficulty or higher",
    trigger = inGame() && byte(0x00ff0c) !=2 && score() >= 250000 && prev(score()) < score()
)

achievement(
    title = "Sweet Dreams", points = 5,
    description = "Jump inside a milk bottle",
    trigger = inGame() && word(0x00FF44) == 3 && prev(word(0x00FF46)) == 0 && word(0x00FF46) == 8
)

achievement(
    title = "Secret Squeak", points = 5,
    description = "Earn a secret bonus of at least 25,000",
    trigger = inGame() && prev(word(0x00F270)) == 0 && word(0x00F270) >= 25000
)

achievement(
    title = "Terrific Technique", points = 10,
    description = "Earn a technical bonus at least 10,000",
    trigger = inGame() && prev(word(0x00F260)) == 0 && word(0x00F260) >= 10000
)

achievement(
    title = "Ravishing Ruby", points = 5, type="progression",
    description = "Collect the Red Gem",
    id = 4337, badge = "04971", 
    trigger = inGame() && word(0x00FF44) == 0x00 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0
)

achievement(
    title = "Divine Citrine", points = 5, type="progression",
    description = "Collect the Orange Gem",
    id = 4338, badge = "04962", 
    trigger = inGame() && word(0x00FF44) == 0x01 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0
)

achievement(
    title = "Beautiful Beryl", points = 10, type="progression",
    description = "Collect the Yellow Gem",
    id = 4339, badge = "04970", 
    trigger = inGame() && word(0x00FF44) == 0x02 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0
)

achievement(
    title = "Enamoring Emerald", points = 10, type="progression",
    description = "Collect the Green Gem",
    id = 4340, badge = "04968", 
    trigger = inGame() && word(0x00FF44) == 0x03 && word(0x00FF46) == 0x08 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0
)

achievement(
    title = "Lovely Lapis", points = 10, type="progression",
    description = "Collect the Blue Gem",
    id = 4342, badge = "04973", 
    trigger = inGame() && word(0x00FF44) == 0x03 && word(0x00FF46) == 0x09 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0
)

achievement(
    title = "Superb Sapphire", points = 10, type="progression",
    description = "Collect the Indigo Gem",
    id = 4344, badge = "04974",
    trigger = inGame() && word(0x00FF44) == 0x04 && word(0x00FF46) == 0x00 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0
)

achievement(
    title = "Amazing Amethyst", points = 10, type="progression",
    description = "Collect the Violet Gem",
    id = 4345, badge = "04975",
    trigger = inGame() && word(0x00FF44) == 0x04 && word(0x00FF46) == 0x03 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0
)

achievement(
    title = "Happily Ever After", points = 25, type="win_condition",
    description = "Rescue Minnie from Mizrabel",
    trigger = inGame() && prev(word(0x00F300)) == 0x2C && word(0x00F300) == 0x2E
)

achievement(
    title = "Mighty Mouse", points = 50,
    description = "Rescue Minnie from Mizrabel on Hard difficulty",
    id = 4347, badge = "04977", published = "04/01/2014 23:24:42", modified = "06/06/2020 10:41:18",
    trigger = inGame() && byte(0x00FF0C) == 1 && prev(word(0x00F300)) == 0x2C && word(0x00F300) == 0x2E
)

achievement(
    title = "Decaffeinated", points = 5,
    description = "Jump Inside A Coffee Cup",
    id = 4341, badge = "04969", published = "04/01/2014 22:08:38", modified = "26/09/2019 07:54:01",
    trigger = inGame() && word(0x00FF44) == 3 && prev(word(0x00FF46)) == 1 && word(0x00FF46) == 7
)

leaderboard(
    id = 142111, title = "Practice Mouse",
    description = "Obtain the highest score in Practice",
    start  = inGame() && byte(0x00FF0C) == 2 && prev(word(0x00FF44) == 0x02) && word(0x00FF44) == 0x03 && 
             ((prev(word(0x00F300)) == 38 && word(0x00F300) == 32) ||
              (prev(word(0x00F324)) == 1 && word(0x00F324) == 0)),
    cancel = always_false(),
    submit = always_true(),
    value  = measured((word(0x00F22C) * 65536 + word(0x00F22E))),
    format = "SCORE"
)

leaderboard(
    id = 142112, title = "Brave Mouse",
    description = "Obtain the highest score in Normal Difficulty",
    start  = inGame() && byte(0x00FF0C) == 0 &&
             ((prev(word(0x00F300)) == 44 && word(0x00F300) == 46) ||
              (prev(word(0x00F324)) == 1 && word(0x00F324) == 0)),
    cancel = always_false(),
    submit = always_true(),
    value  = measured((word(0x00F22C) * 65536 + word(0x00F22E))),
    format = "SCORE"
)

leaderboard(
    id = 142113, title = "Bravest Mouse",
    description = "Obtain the highest score in Hard Difficulty",
    start  = inGame() && byte(0x00FF0C) == 1 &&
             ((prev(word(0x00F300)) == 44 && word(0x00F300) == 46) ||
              (prev(word(0x00F324)) == 1 && word(0x00F324) == 0)),
    cancel = always_false(),
    submit = always_true(),
    value  = measured((word(0x00F22C) * 65536 + word(0x00F22E))),
    format = "SCORE"
)

leaderboard(
    id = 142114, title = "Fortress of Illusion Speedrun",
    description = "In Practice Difficulty, beat the game as fast as possible",
    start  = inGame() && prev(word(0x00F300)) == 12 && word(0x00F300) == 14 && byte(0x00FF0C) == 2,
    cancel = word(0x00F300) == 2,
    submit = inGame() && prev(word(0x00FF44) == 0x02) && word(0x00FF44) == 0x03 && 
             ((prev(word(0x00F300)) == 38 && word(0x00F300) == 32) ||
              (prev(word(0x00F324)) == 1 && word(0x00F324) == 0)),
    value  = measured(tally(0, byte(0x00F41C) == 0)),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 142115, title = "Castle of Illusion Speedrun",
    description = "In Normal/Hard Difficulty, beat the game as fast as possible",
    start  = inGame() && prev(word(0x00F300)) == 12 && word(0x00F300) == 14 && byte(0x00FF0C) != 2,
    cancel = word(0x00F300) == 2,
    submit = inGame() && inGame() && prev(word(0x00F300)) == 0x2C && word(0x00F300) == 0x2E,
    value  = measured(tally(0, byte(0x00F41C) == 0)),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 142116, title = "The Enchanted Forest Speedrun",
    description = "In Normal/Hard Difficulty, complete The Enchanted Forest as fast as possible",
    start  = inGame() && prev(word(0x00F300)) == 12 && word(0x00F300) == 14 && word(0x00FF44) == 0 && byte(0x00FF0C) != 2,
    cancel = word(0x00F300) == 2,
    submit = inGame() && word(0x00FF44) == 0x00 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0,
    value  = measured(tally(0, byte(0x00F41C) == 0)),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 142117, title = "ToyLand Speedrun",
    description = "In Normal/Hard Difficulty, complete ToyLand as fast as possible",
    start  = inGame() && prev(word(0x00F300)) == 12 && word(0x00F300) == 14 && word(0x00FF44) == 1 && byte(0x00FF0C) != 2,
    cancel = word(0x00F300) == 2,
    submit = inGame() && word(0x00FF44) == 0x01 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0,
    value  = measured(tally(0, byte(0x00F41C) == 0)),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 142118, title = "The Storm Speedrun",
    description = "In Normal/Hard Difficulty, complete The Storm as fast as possible",
    start  = inGame() && prev(word(0x00F300)) == 12 && word(0x00F300) == 14 && word(0x00FF44) == 2 && byte(0x00FF0C) != 2,
    cancel = word(0x00F300) == 2,
    submit = inGame() && word(0x00FF44) == 0x02 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0,
    value  = measured(tally(0, byte(0x00F41C) == 0)),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 142119, title = "The Library Speedrun",
    description = "In Normal/Hard Difficulty, complete The Library as fast as possible",
    start  = inGame() && prev(word(0x00F300)) == 12 && word(0x00F300) == 14 && word(0x00FF44) == 3 && byte(0x00FF0C) != 2,
    cancel = word(0x00F300) == 2,
    submit = inGame() && word(0x00FF44) == 0x03 && word(0x00FF46) == 0x09 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0,
    value  = measured(tally(0, byte(0x00F41C) == 0)),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 142120, title = "The Castle Speedrun",
    description = "In Normal/Hard Difficulty, complete The Castle as fast as possible",
    start  = inGame() && prev(word(0x00F300)) == 12 && word(0x00F300) == 14 && word(0x00FF44) == 4 && byte(0x00FF0C) != 2,
    cancel = word(0x00F300) == 2,
    submit = inGame() && word(0x00FF44) == 0x04 && word(0x00FF46) == 0x03 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0,
    value  = measured(tally(0, byte(0x00F41C) == 0)),
    format = "FRAMES", lower_is_better = true
)



