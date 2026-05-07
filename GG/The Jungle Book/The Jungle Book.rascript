// The Jungle Book
// #ID = 26224


function score() => byte(0x0822) * 1000000 + byte(0x0823) * 100000 + byte(0x0824) * 10000 + byte(0x0825) * 1000 +
                    byte(0x0826) * 100 + byte(0x0827) * 10 + byte(0x0828) 

level = {
    0x00: "collecting Gems in the Jungle (Day)",
    0x01: "collecting Gems by the Great Tree",
    0x02: "fighting against Kaa",
    0x03: "overtaking the Dawn Patrol",
    0x04: "looking for Bagheera by the River",
    0x05: "drifting on Baloo in the River to reach Bagheera",
    0x06: "looking for Bagheera in the Tree Village",
    0x07: "looking for Bagheera in King Louie's",
    0x08: "fighting King Louie for the first time",
    0x09: "looking for Bagheera in the Falling Ruins",
    0x0A: "fighting King Louie for the second time",
    0x0B: "collecting Gems in the Jungle (Sunset)",
    0x0C: "collecting Gems in the Jungle (Night)",
    0x0D: "fighting Shere Khan in The Wastelands",
    0x0E: "finally safe among his people"
}

difficulty = {
    0: "Easy",
    1: "Normal",
    2: "Hard"
}

rich_presence_conditional_display(byte(0x082f) == 0 && (score() > 0 || byte(0x082C) > 0), "Game Over ({2}) - Score: {1} - Continues: {0}",
                                  rich_presence_value("VALUE", byte(0x082B), "Value"),
                                  rich_presence_value("SCORE", score(), "Score"),
                                  rich_presence_lookup("Difficulty", byte(0x0814), difficulty)
)

rich_presence_conditional_display(byte(0x082f) == 0, "In main menu")

rich_presence_conditional_display(byte(0x082f) > 0, "Mowgli is {0} ({3}) - Lives: {1} - Score: {2}",
                                  rich_presence_lookup("Level", byte(0x0829), level, fallback="exploring the Jungle"),
                                  rich_presence_value("VALUE", byte(0x082F), "Value"),
                                  rich_presence_value("SCORE", score(), "Score"),
                                  rich_presence_lookup("Difficulty", byte(0x0814), difficulty)
)

rich_presence_display("Playing The Jungle Book")
