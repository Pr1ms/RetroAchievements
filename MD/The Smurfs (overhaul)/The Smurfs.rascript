// The Smurfs
// #ID = 4436


acts = {
    0x01: "The Village",
    0x02: "The Forest",
    0x03: "The Bridge",
    0x04: "The Black Forest",
    0x05: "The Lake",
    0x06: "The Field",
    0x07: "The Dam",
    0x08: "The Swamp",
    0x09: "The Cave",
    0x0a: "The Mountain",
    0x0b: "The Mine",
    0x0c: "The Volcano",
    0x0d: "The Descent",
    0x0e: "The Cliff",
    0x0f: "Gargamel's Manor House"
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
function act() => byte(0xfc8a) 
function map() => byte(0xf34e) 
function difficulty() => byte(0xf351) 
function hp() => byte(0xf377)
function gameOver() => byte(0xf370) == 0x09 && byte(0xf371) == 0x09

rich_presence_conditional_display(byte(0xf372) == 0x09 && byte(0xf373) == 0x09, "In Main Menu")
rich_presence_conditional_display(byte(0xfc8a) > 0, "Playing {0} ({1}) - Lives: {2} - Score: {3}{4}",
                                  rich_presence_lookup("Act", byte(0xfc8a), acts),
                                  rich_presence_lookup("Difficulty", byte(0xf351), difficulties),
                                  rich_presence_value("Number", lives()),
                                  rich_presence_value("Score", score(), "SCORE"),
                                  rich_presence_lookup("Debug", byte(0x4849), debug, fallback="")
)

rich_presence_display("Playing The Smurfs")

achievement(
    title = "The Village", points = 5, type="progression",
    description = "Finish the act 1",
    id = 26795, badge = "27239", 
    trigger = noDebugMode() && act() == 1 && prev(map()) == 0x00 && map() == 0x01
)

achievement(
    title = "The Forest", points = 5,
    description = "Finish the act 2",
    id = 26796, badge = "27242", 
    trigger = noDebugMode() && act() == 2 && prev(map()) == 0x02 && map() == 0x03
)

achievement(
    title = "The Bridge", points = 5, type="progression",
    description = "Finish the act 3",
    id = 26797, badge = "27243", 
    trigger = noDebugMode() && act() == 3 && prev(map()) == 0x03 && map() == 0x04
)

achievement(
    title = "The Black Forest", points = 5, type="progression",
    description = "Finish the act 4",
    id = 26798, badge = "27244", 
    trigger = noDebugMode() && prev(map()) == 0x05 && map() == 0x06
)

achievement(
    title = "The Lake", points = 5, type="progression",
    description = "Finish the act 5",
    id = 26799, badge = "27245", 
    trigger = noDebugMode() && act() == 5 && prev(map()) == 0x07 && map() == 0x08
)

achievement(
    title = "The Field", points = 5, type="progression",
    description = "Finish the act 6",
    id = 26800, badge = "27246", 
    trigger = noDebugMode() && act() == 6 && prev(map()) == 0x09 && map() == 0x0a
)

achievement(
    title = "The Dam", points = 5, type="progression",
    description = "Finish the act 7",
    id = 26801, badge = "27247", 
    trigger = noDebugMode() && act() == 7 && prev(map()) == 0x0a && map() == 0x0b
)

achievement(
    title = "The Swamp", points = 5, type="progression",
    description = "Finish the act 8",
    id = 26802, badge = "27248", 
    trigger = noDebugMode() && act() == 8 && prev(map()) == 0x0c && map() == 0x0d
)

achievement(
    title = "The Cave", points = 5, type="progression",
    description = "Finish the act 9",
    id = 26803, badge = "27250", 
    trigger = noDebugMode() && act() == 9 && prev(map()) == 0x0e && map() == 0x0f
)

achievement(
    title = "The Mountain", points = 5, type="progression",
    description = "Finish the act 10",
    id = 26804, badge = "27301", 
    trigger = noDebugMode() && act() == 10 && prev(map()) == 0x10 && map() == 0x11
)

achievement(
    title = "The Mine", points = 5, type="progression",
    description = "Finish the act 11",
    id = 26805, badge = "27270", 
    trigger = noDebugMode() && act() == 11 && prev(map()) == 0x11 && map() == 0x12
)

achievement(
    title = "The Volcano", points = 5, type="progression",
    description = "Finish the act 12",
    id = 26806, badge = "27276", 
    trigger = noDebugMode() && act() == 12 && prev(map()) == 0x14 && map() == 0x15
)

achievement(
    title = "The Descent", points = 5, type="progression",
    description = "Finish the act 13",
    id = 26807, badge = "27269", 
    trigger = noDebugMode() && act() == 13 && prev(map()) == 0x15 && map() == 0x16
)

achievement(
    title = "The Cliff", points = 5, type="progression",
    description = "Finish the act 14",
    id = 26808, badge = "27268", 
    trigger = noDebugMode() && act() == 14 && prev(map()) == 0x16 && map() == 0x17
)

achievement(
    title = "Gargamel's manor", points = 5, type="win_condition",
    description = "Finish the act 15",
    id = 26809, badge = "27266", 
    trigger = noDebugMode() && act() == 15 && prev(map()) == 0x1a && map() == 0x00
)

achievement(
    title = "You won't see me again", points = 10,
    description = "Finish the act 1 (hard mode)",
    id = 26810, badge = "27272", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 1 && prev(map()) == 0x00 && map() == 0x01
)

achievement(
    title = "Call me Tarzan", points = 10,
    description = "Finish the act 2 (hard mode)",
    id = 26811, badge = "27273", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 2 && prev(map()) == 0x02 && map() == 0x03
)

achievement(
    title = "It would be better by plane", points = 10,
    description = "Finish the act 3 (hard mode)",
    id = 26812, badge = "27283", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 3 && prev(map()) == 0x03 && map() == 0x04
)

achievement(
    title = "Surprise motherf*cker", points = 10,
    description = "Finish the act 4 (hard mode)",
    id = 26813, badge = "27326", 
    trigger = noDebugMode() && difficulty() == 2 && prev(map()) == 0x05 && map() == 0x06
)

achievement(
    title = "Faster than light", points = 10,
    description = "Finish the act 5 (hard mode)",
    id = 26814, badge = "27280", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 5 && prev(map()) == 0x07 && map() == 0x08
)

achievement(
    title = "It's like Sonic spinball", points = 10,
    description = "Finish the act 6 (hard mode)",
    id = 26815, badge = "27281", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 6 && prev(map()) == 0x09 && map() == 0x0a
)

achievement(
    title = "I am the barrage", points = 10,
    description = "Finish the act 7 (hard mode)",
    id = 26816, badge = "27279", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 7 && prev(map()) == 0x0a && map() == 0x0b
)

achievement(
    title = "I'm not a light", points = 10,
    description = "Finish the act 8 (hard mode)",
    id = 26817, badge = "27282", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 8 && prev(map()) == 0x0c && map() == 0x0d
)

achievement(
    title = "Alone in the dark", points = 10,
    description = "Finish the act 9 (hard mode)",
    id = 26818, badge = "27271", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 9 && prev(map()) == 0x0e && map() == 0x0f
)

achievement(
    title = "Again we are back to Tibet", points = 10,
    description = "Finish the act 10 (hard mode)",
    id = 26819, badge = "27263", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 10 && prev(map()) == 0x10 && map() == 0x11
)

achievement(
    title = "Donkey Kong would be proud", points = 10,
    description = "Finish the act 11 (hard mode)",
    id = 26820, badge = "27314", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 11 && prev(map()) == 0x11 && map() == 0x12
)

achievement(
    title = "The cake is not a lie", points = 10,
    description = "Finish the act 12 (hard mode)",
    id = 26821, badge = "27302", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 12 && prev(map()) == 0x14 && map() == 0x15
)

achievement(
    title = "SSX style", points = 10,
    description = "Finish the act 13 (hard mode)",
    id = 26822, badge = "27315", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 13 && prev(map()) == 0x15 && map() == 0x16
)

achievement(
    title = "Knock on wood", points = 10,
    description = "Finish the act 14 (hard mode)",
    id = 26823, badge = "27317", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 14 && prev(map()) == 0x16 && map() == 0x17
)

achievement(
    title = "Ecraser Detruire Annihiler", points = 25,
    description = "Finish the act 15 (hard mode)",
    id = 26824, badge = "27401", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 15 && prev(map()) == 0x1a && map() == 0x00
)

achievement(
    title = "Snake charmer", points = 10,
    description = "Kill the snake in one try and without getting hit (hard mode)",
    id = 26825, badge = "27325", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 8 && prev(map()) == 0x0c && trigger_when(map() == 0x0d) && disable_when(hp() < prev(hp()), until=prev(map()) != map())
)

achievement(
    title = "Dragon hunter", points = 10,
    description = "Kill the dragon in one try and without getting hit (hard mode)",
    id = 26826, badge = "27267", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 12 && prev(map()) == 0x14 && trigger_when(map() == 0x15) && disable_when(hp() < prev(hp()), until=prev(map()) != map())
)

achievement(
    title = "True Survivor", points = 10,
    description = "Kill Gargamel in one try and without getting hit (hard mode)",
    id = 26827, badge = "27275", 
    trigger = noDebugMode() && difficulty() == 2 && act() == 15 && prev(map()) == 0x1a && trigger_when(map() == 0x00) && disable_when(hp() < prev(hp()), until=prev(map()) != map())
)

achievement(
    title = "Gardening routine", points = 10,
    description = "Kill the carnivorous plant in one try and without getting hit (hard mode)",
    id = 26828, badge = "27363", 
    trigger = noDebugMode() && difficulty() == 2 && prev(map()) == 0x05 && trigger_when(map() == 0x06) && disable_when(hp() < prev(hp()), until=prev(map()) != map())
)

achievement(
    title = "Immortal Smurf", points = 10,
    description = "Have 20 lifes",
    id = 26829, badge = "27316", 
    trigger = noDebugMode() && prev(lives()) == 19 && lives() == 20
)

achievement(
    title = "Cead Mile Failte", points = 10,
    description = "Get a score of 100 000",
    id = 26830, badge = "27358", 
    trigger = noDebugMode() && prev(byte(0xf369)) == 0 && byte(0xf369) == 1
)

achievement(
    title = "I'm better than Indiana", points = 10,
    description = "Finish the act 11 without dying",
    id = 26831, badge = "27356", 
    trigger = noDebugMode() && act() == 11 && prev(map()) == 0x11 && trigger_when(map() == 0x12) && disable_when(lives() < prev(lives()), until=prev(act()) != act())
)

achievement(
    title = "I scared the yeti", points = 10,
    description = "Finish the act 13 without dying",
    id = 26832, badge = "27361", 
    trigger = noDebugMode() && act() == 13 && prev(map()) == 0x15 && trigger_when(map() == 0x16) && disable_when(lives() < prev(lives()), until=prev(act()) != act())
)

achievement(
    title = "Overdose", points = 10,
    description = "Collect 100 leafs in a single playthrough",
    id = 26833, badge = "27360", 
    trigger = noDebugMode() && prev(byte(0xf36e)) == 9 && prev(byte(0xf36f)) == 9 && byte(0xf36e) == 0 && byte(0xf36f) == 0
)

achievement(
    title = "Mario would be proud", points = 10,
    description = "Get 50 stars in a single playthrough",
    id = 26834, badge = "27362", 
    trigger = noDebugMode() && prev(byte(0xf375)) == 4 && byte(0xf375) == 5
)

achievement(
    title = "The raft of the Smurf", points = 10,
    description = "Get 4 life in the bonus stage raft",
    id = 26835, badge = "27402", 
    trigger = noDebugMode() && byte(0x00f34f) == 0x1c && repeated(4, lives() > prev(lives())) && never(byte(0x00f34f) != 0x1c)
)

achievement(
    title = "I forgot the baby", points = 10,
    description = "Get 5 life in the bonus stage stork",
    id = 26836, badge = "27357", 
    trigger =noDebugMode() && byte(0x00f34f) == 0x1b && repeated(5, lives() > prev(lives())) && never(byte(0x00f34f) != 0x1b)
)

achievement(
    title = "Can i have a little Smurf?", points = 25,
    description = "Finish the game without using passwords and with 20 lifes or more (hard mode)",
    id = 28015, badge = "29602", 
    trigger = noDebugMode() && once(act() == 1 && map() == 0x00) && byte(0xf371) >= 2 && difficulty() == 2 && act() == 15 && prev(map()) == 0x1a && map() == 0x00 &&
              never(gameOver()) // Game Over
)

leaderboard("Highscore: Easy",
            "Highest possible score upon winning the game or going game over on Easy Level",
            start=noDebugMode() && difficulty() == 0 && (act() == 15 && prev(map()) == 0x1a && map() == 0x00 || // Win
                  prev(byte(0xf371)) != 0x9 && gameOver()), // Game Over
            cancel=always_false(),
            submit=always_true(),
            format="SCORE",
            value=score()
)

leaderboard("Highscore: Medium",
            "Highest possible score upon winning the game or going game over on Medium Level",
            start=noDebugMode() && difficulty() == 1 && (act() == 15 && prev(map()) == 0x1a && map() == 0x00 || // Win
                  prev(byte(0xf371)) != 0x9 && gameOver()), // Game Over
            cancel=always_false(),
            submit=always_true(),
            format="SCORE",
            value=score()
)

leaderboard("Highscore: Hard",
            "Highest possible score upon winning the game or going game over on Hard Level",
            start=noDebugMode() && difficulty() == 2 && (act() == 15 && prev(map()) == 0x1a && map() == 0x00 || // Win
                  prev(byte(0xf371)) != 0x9 && gameOver()), // Game Over
            cancel=always_false(),
            submit=always_true(),
            format="SCORE",
            value=score()
)