// LEGO Indiana Jones: The Original Adventures
// #ID = 15352


gameMode = {
    0: "Story",
    1: "Free Play"
}

rich_presence_conditional_display(always_true(), "({1}) Studs: {0}",
                                  rich_presence_value("Number", 10 * dword(0x15bb54)),
                                  rich_presence_lookup("GameMode", byte(0x15bb0c), gameMode)
)
rich_presence_display("Playing LEGO Indiana Jones: The Original Adventures")
