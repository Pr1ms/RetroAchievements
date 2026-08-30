// The Smurfs
// #ID = 4436


maps = {
    0x00: "Exploring The Village",
    0x01: "Strolling in The Forest",
    0x02: "Climbing a tree in The Forest",
    0x03: "Crossing The Bridge",
    0x04: "Exploring The Black Forest",
    0x05: "Fighting the Carnivorous Plant in The Black Forest",
    0x06: "Crossing The Lake",
    0x07: "Braving a storm in The Lake",
    0x08: "Crossing The Fields",
    0x09: "Crossing The Fields",
    0x0a: "Finding their way to the other side of The Dam",
    0x0b: "Avoiding Bugs in The Swamp",
    0x0c: "Fighting the Snake in The Swamp",
    0x0d: "Setting dynamite off in The Cave",
    0x0e: "Setting dynamite off in The Cave",
    0x0f: "Climbing The Mountain",
    0x10: "Climbing The Mountain",
    0x11: "Riding a minecart in The Mine",
    0x12: "Trying to outrun lava in The Volcano",
    0x13: "Trying to outrun lava in The Volcano",
    0x14: "Fighting the Dragon in The Volcano",
    0x15: "Riding a sleigh in The Descent",
    0x16: "Exploring The Cliff",
    0x17: "Riding bubbles through Gargamel's Manor House's Garden",
    0x18: "Making their way through Gargamel's Manor House",
    0x19: "Climbing a big staircase in Gargamel's Manor House",
    0x1a: "Fighting Gargamel in Gargamel's Manor House"
}

difficulties = {
    0x00: "Easy",
    0x01: "Medium",
    0x02: "Hard"
}

debug = {
    0xff: " - Debug Cheat"
}

function lives()
{
    return 10 * byte(0xf371) + byte(0xf370)
}

function score()
{
    return 100000 * byte(0xf369) + 10000 * byte(0xf368) + 1000 * byte(0xf36b) +
           100 * byte(0xf36a) + 10 * byte(0xf36d) + byte(0xf36c)
}

function noDebugMode() => byte(0x4849) != 0xff
function map() => byte(0xf34e) 
function difficulty() => byte(0xf351) 
function hp() => byte(0xf377)
function gameOver() => byte(0xf371) == 0x09 
function inGame() => byte(0xf371) < 0x09

rich_presence_conditional_display(byte(0xf372) == 0x09 && byte(0xf373) == 0x09, "In Main Menu")
rich_presence_conditional_display(byte(0xfc8a) > 0, "{0} ({1}) - Lives: {2} - Score: {3}{4}",
                                  rich_presence_lookup("Map", byte(0xf34e), maps),
                                  rich_presence_lookup("Difficulty", byte(0xf351), difficulties),
                                  rich_presence_value("Number", lives()),
                                  rich_presence_value("Score", score(), "SCORE"),
                                  rich_presence_lookup("Debug", byte(0x4849), debug, fallback="")
)

rich_presence_display("Playing The Smurfs")

achievement(
    title = "There Is a Place, a Place That Knows No Sadness...", points = 5, type="progression",
    description = "Complete Act 1: The Village",
    id = 26795, badge = "27239", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x00 && map() == 0x01
)

achievement(
    title = "Always Begin with the Familiar Places", points = 5,
    description = "Complete Act 2: The Forest",
    id = 26796, badge = "27242", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x02 && map() == 0x03
)

achievement(
    title = "A Smurf Has No Fears!", points = 5, type="progression",
    description = "Complete Act 3: The Bridge",
    id = 26797, badge = "27243", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x03 && map() == 0x04
)

achievement(
    title = "Hey Hefty, What's Back There...?", points = 5, type="progression",
    description = "Complete Act 4: The Black Forest",
    id = 26798, badge = "27244", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x05 && map() == 0x06
)

achievement(
    title = "Jokey Smurf and the Duckies", points = 5, type="progression",
    description = "Complete Act 5: The Lake",
    id = 26799, badge = "27245", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x07 && map() == 0x08
)

achievement(
    title = "We Keep Our Fields Nice and Peaceful", points = 5, type="progression",
    description = "Complete Act 6: The Field",
    id = 26800, badge = "27246", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x09 && map() == 0x0a
)

achievement(
    title = "Dam You Gargamel!", points = 5, type="progression",
    description = "Complete Act 7: The Dam",
    id = 26801, badge = "27247", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x0a && map() == 0x0b
)

achievement(
    title = "Get Out of Our Swamp!", points = 5, type="progression",
    description = "Complete Act 8: The Swamp",
    id = 26802, badge = "27248", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x0c && map() == 0x0d
)

achievement(
    title = "Cave Diving for the Missing Smurfs!", points = 5, type="progression",
    description = "Complete Act 9: The Cave",
    id = 26803, badge = "27250", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x0e && map() == 0x0f
)

achievement(
    title = "We'd Climb Any Mountain for Smurfette", points = 5, type="progression",
    description = "Complete Act 10: The Mountain",
    id = 26804, badge = "27301", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x10 && map() == 0x11
)

achievement(
    title = "Smurfs Thrive in the Mines!", points = 5, type="progression",
    description = "Complete Act 11: The Mine",
    id = 26805, badge = "27270", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x11 && map() == 0x12
)

achievement(
    title = "Are Smurfs Fireproof?", points = 5, type="progression",
    description = "Complete Act 12: The Volcano",
    id = 26806, badge = "27276", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x14 && map() == 0x15
)

achievement(
    title = "What's an Adventure Without a Little Fall?", points = 5, type="progression",
    description = "Complete Act 13: The Descent",
    id = 26807, badge = "27269", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x15 && map() == 0x16
)

achievement(
    title = "Us Smurfs Must Brave the Cliff", points = 5, type="progression",
    description = "Complete Act 14: The Cliff",
    id = 26808, badge = "27268", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x16 && map() == 0x17
)

achievement(
    title = "One Small Step for Smurf, One Giant Leap for Smurfkind", points = 5, type="win_condition",
    description = "Defeat the Evil Lord Gargamel and save Smurfette!",
    id = 26809, badge = "27266", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x1a && map() == 0x00
)

achievement(
    title = "You Won't See Me Again", points = 10,
    description = "Complete Act 1: The Village on Hard difficulty",
    id = 26810, badge = "27272", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x00 && map() == 0x01
)

achievement(
    title = "Call Me Tarzan", points = 10,
    description = "Complete Act 2: The Forest on Hard difficulty",
    id = 26811, badge = "27273", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x02 && map() == 0x03
)

achievement(
    title = "It Would Be Better by Plane", points = 10,
    description = "Complete Act 3: The Bridge on Hard difficulty",
    id = 26812, badge = "27283", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x03 && map() == 0x04
)

achievement(
    title = "Quite the Hefty Surprise", points = 10,
    description = "Complete Act 4: The Black Forest on Hard difficulty",
    id = 26813, badge = "27326", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x05 && map() == 0x06
)

achievement(
    title = "Faster Than Light", points = 10,
    description = "Complete Act 5: The Lake on Hard difficulty",
    id = 26814, badge = "27280", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x07 && map() == 0x08
)

achievement(
    title = "It's Like Sonic's Spinball!", points = 10,
    description = "Complete Act 6: The Field on Hard difficulty",
    id = 26815, badge = "27281", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x09 && map() == 0x0a
)

achievement(
    title = "I'm the Barrage", points = 10,
    description = "Complete Act 7: The Dam on Hard difficulty",
    id = 26816, badge = "27279", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x0a && map() == 0x0b
)

achievement(
    title = "Sometimes All It Needs Is a Smurf's Touch", points = 10,
    description = "Complete Act 8: The Swamp on Hard difficulty",
    id = 26817, badge = "27282", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x0c && map() == 0x0d
)

achievement(
    title = "All Alone in the Dark", points = 10,
    description = "Complete Act 9: The Cave on Hard difficulty",
    id = 26818, badge = "27271", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x0e && map() == 0x0f
)

achievement(
    title = "Hefty Smurf the Mountaineer", points = 10,
    description = "Complete Act 10: The Mountain on Hard difficulty",
    id = 26819, badge = "27263", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x10 && map() == 0x11
)

achievement(
    title = "The Ride of a Smurf's Life", points = 10,
    description = "Complete Act 11: The Mine on Hard difficulty",
    id = 26820, badge = "27314", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x11 && map() == 0x12
)

achievement(
    title = "The Cake Isn't a Lie", points = 10,
    description = "Complete Act 12: The Volcano on Hard difficulty",
    id = 26821, badge = "27302", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x14 && map() == 0x15
)

achievement(
    title = "SSX Style", points = 10,
    description = "Complete Act 13: The Descent on Hard difficulty",
    id = 26822, badge = "27315", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x15 && map() == 0x16
)

achievement(
    title = "Knock on Wood", points = 10,
    description = "Complete Act 14: The Cliff on Hard difficulty",
    id = 26823, badge = "27317", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x16 && map() == 0x17
)

achievement(
    title = "Crushing, Destroying, and Annihilating You!", points = 25,
    description = "Complete Act 15: Gargamel's Manor House on Hard difficulty",
    id = 26824, badge = "27401", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x1a && map() == 0x00
)

achievement(
    title = "Snake Charmer", points = 10,
    description = "Defeat the Snake without getting hit on Hard difficulty",
    id = 26825, badge = "27325", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x0c && trigger_when(map() == 0x0d) && disable_when(hp() < prev(hp()), until=prev(map()) != map())
)

achievement(
    title = "Dragon Hunter", points = 10,
    description = "Defeat the Dragon without getting hit on Hard difficulty",
    id = 26826, badge = "27267", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x14 && trigger_when(map() == 0x15) && disable_when(hp() < prev(hp()), until=prev(map()) != map())
)

achievement(
    title = "True Survivor", points = 10,
    description = "Defeat Gargamel without getting hit on Hard difficulty",
    id = 26827, badge = "27275", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x1a && trigger_when(map() == 0x00) && disable_when(hp() < prev(hp()), until=prev(map()) != map())
)

achievement(
    title = "Gardening Routine", points = 10,
    description = "Defeat the Carnivorous Plant without getting hit on Hard difficulty",
    id = 26828, badge = "27363", 
    trigger = noDebugMode() && inGame() && difficulty() == 2 && prev(map()) == 0x05 && trigger_when(map() == 0x06) && disable_when(hp() < prev(hp()), until=prev(map()) != map())
)

achievement(
    title = "Immortal Smurf", points = 10,
    description = "Obtain 20 lives",
    id = 26829, badge = "27316", 
    trigger = noDebugMode() && inGame() && prev(lives()) == 19 && lives() == 20
)

achievement(
    title = "A Hundred Thousand Welcomes", points = 10,
    description = "Score 100,000 points",
    id = 26830, badge = "27358", 
    trigger = noDebugMode() && inGame() && prev(byte(0xf369)) == 0 && byte(0xf369) == 1
)

achievement(
    title = "I'm Better Than Indiana", points = 10,
    description = "Complete Act 11: The Mine without dying",
    id = 26831, badge = "27356", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x11 && trigger_when(map() == 0x12) && disable_when(lives() < prev(lives()), until=prev(map()) != 0x12)
)

achievement(
    title = "I Think I Scared the Yeti", points = 10,
    description = "Complete Act 13: The Descent without dying",
    id = 26832, badge = "27361", 
    trigger = noDebugMode() && inGame() && prev(map()) == 0x15 && trigger_when(map() == 0x16) && disable_when(lives() < prev(lives()), until=prev(map()) != 0x16)
)

achievement(
    title = "Overdose", points = 10,
    description = "Obtain 100 Sarsaparilla Leaves",
    id = 26833, badge = "27360", 
    trigger = noDebugMode() && inGame() && prev(byte(0xf36e)) == 9 && prev(byte(0xf36f)) == 9 && byte(0xf36e) == 0 && byte(0xf36f) == 0
)

achievement(
    title = "You Know, Mario Would Be Proud...", points = 10,
    description = "Obtain 50 Stars",
    id = 26834, badge = "27362", 
    trigger = noDebugMode() && inGame() && prev(byte(0xf375)) == 4 && byte(0xf375) == 5
)

achievement(
    title = "The Raft of the Smurf", points = 10,
    description = "Obtain 4 Smurf Dolls in The Raft Ride",
    id = 26835, badge = "27402", 
    trigger = noDebugMode() && inGame() && byte(0x00f34f) == 0x1c && repeated(4, lives() > prev(lives())) && never(byte(0x00f34f) != 0x1c)
)

achievement(
    title = "I Forgot the Baby!", points = 10,
    description = "Obtain 5 Smurf Dolls in The Stork Journey",
    id = 26836, badge = "27357", 
    trigger =noDebugMode() && inGame() && byte(0x00f34f) == 0x1b && repeated(5, lives() > prev(lives())) && never(byte(0x00f34f) != 0x1b)
)

achievement(
    title = "Holy Smurf!", points = 25,
    description = "Beat the game with at least 20 lives and without using passwords on Hard difficulty",
    id = 28015, badge = "29602", 
    trigger = noDebugMode() && inGame() && once(prev(map()) == 0x00) && byte(0xf371) >= 2 && difficulty() == 2 && prev(map()) == 0x1a && map() == 0x00 &&
              never(gameOver()) // Game Over
)

leaderboard("Highscore: Easy",
            "Highest possible score upon winning the game or going game over on Easy Level",
            start=noDebugMode() && difficulty() == 0 && (inGame() && prev(map()) == 0x1a && map() == 0x00 || // Win
                  prev(byte(0xf371)) != 0x9 && gameOver()), // Game Over
            cancel=always_false(),
            submit=always_true(),
            format="SCORE",
            value=score()
)

leaderboard("Highscore: Medium",
            "Highest possible score upon winning the game or going game over on Medium Level",
            start=noDebugMode() && difficulty() == 1 && (inGame() && prev(map()) == 0x1a && map() == 0x00 || // Win
                  prev(byte(0xf371)) != 0x9 && gameOver()), // Game Over
            cancel=always_false(),
            submit=always_true(),
            format="SCORE",
            value=score()
)

leaderboard("Highscore: Hard",
            "Highest possible score upon winning the game or going game over on Hard Level",
            start=noDebugMode() && difficulty() == 2 && (inGame() && prev(map()) == 0x1a && map() == 0x00 || // Win
                  prev(byte(0xf371)) != 0x9 && gameOver()), // Game Over
            cancel=always_false(),
            submit=always_true(),
            format="SCORE",
            value=score()
)