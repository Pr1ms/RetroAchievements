// The Urbz: Sims in the City
// #ID = 19374

function NoCheatsEnabled() => byte(0x004c507a) == 0 && byte(0x004c507b) == 0
function ReputationUrb1() => word(dword(dword(dword(0x04c05b4) + 0x1b0) + 0x84) + 0x1c)
function ReputationUrb2() => word(dword(dword(dword(0x04c05b4) + 0x1b0) + 0xEc) + 0x1c)
function ReputationUrb3() => word(dword(dword(dword(0x04c05b4) + 0x1b0) + 0x100) + 0x1c)
function ReputationUrb4() => word(dword(dword(dword(0x04c05b4) + 0x1b0) + 0x104) + 0x1c)

function Reputation() => word(0x4c5304) == 1 && ReputationUrb1()

locations = {
0x1b: "Chilling at 98th Ave, 3rd Floor",
0x2a: "Chilling at Blankwood Towers",
0x6e: "Owning the City in South Side Bridge",
0x74: "Owning the City in Skyline Beach",
0x7c: "Chilling in their Darius' Penthouse",
0x82: "Owning the City in Diamond Heights",
0x92: "Owning the City in Kicktail Park",
0x99: "Owning the City in Neon East",
0x9c: "Owning the City in Gasoline Row",
0xab: "Owning the City in Cozmo Street",
0xc6: "Owning the City in The Foundry",
0xf6: "Owning the City in Central Station",
}

// RP
postfix =  {
    0x00: "am",
    0x01: "pm",
}


rich_presence_conditional_display(dword(0x4bfb38) == 0 , "On loading screen...")
rich_presence_conditional_display(dword(0x4bfb38) != 0 && dword(0x4bebc8) == 0 , "In main menu")

rich_presence_conditional_display(dword(0x4bebc8) != 0 && word(0x4c5304) == 1, "{4} - Simulation time {0} {1} - Money {2} - Reputation {3}",                      
                      rich_presence_value("Seconds", 60 * (((word(0x01ab2b84) + 11) % 12 + 12) % 12 + 1) + word(0x01ab2b8e), "SECS"),
                      rich_presence_lookup("Postfix", word(0x01ab2b84) / 12, postfix),
                      rich_presence_value("Signed", dword(0x01ab2be4), "VALUE"),
                      rich_presence_value("Signed", ReputationUrb1(), "VALUE"),
                      rich_presence_lookup("Locations", dword(0x4bebd0), locations)
)
rich_presence_conditional_display(dword(0x4bebc8) != 0 && word(0x4c5304) == 2, "{4} - Simulation time {0} {1} - Money {2} - Reputation {3}",                      
                      rich_presence_value("Seconds", 60 * (((word(0x01ab2b84) + 11) % 12 + 12) % 12 + 1) + word(0x01ab2b8e), "SECS"),
                      rich_presence_lookup("Postfix", word(0x01ab2b84) / 12, postfix),
                      rich_presence_value("Signed", dword(0x01ab2be4), "VALUE"),
                      rich_presence_value("Signed", ReputationUrb2(), "VALUE"),
                      rich_presence_lookup("Locations", dword(0x4bebd0), locations)
)
rich_presence_conditional_display(dword(0x4bebc8) != 0 && word(0x4c5304) == 3, "{4} - Simulation time {0} {1} - Money {2} - Reputation {3}",                      
                      rich_presence_value("Seconds", 60 * (((word(0x01ab2b84) + 11) % 12 + 12) % 12 + 1) + word(0x01ab2b8e), "SECS"),
                      rich_presence_lookup("Postfix", word(0x01ab2b84) / 12, postfix),
                      rich_presence_value("Signed", dword(0x01ab2be4), "VALUE"),
                      rich_presence_value("Signed", ReputationUrb3(), "VALUE"),
                      rich_presence_lookup("Locations", dword(0x4bebd0), locations)
)
rich_presence_conditional_display(dword(0x4bebc8) != 0 && word(0x4c5304) == 4, "{4} - Simulation time {0} {1} - Money {2} - Reputation {3}",                      
                      rich_presence_value("Seconds", 60 * (((word(0x01ab2b84) + 11) % 12 + 12) % 12 + 1) + word(0x01ab2b8e), "SECS"),
                      rich_presence_lookup("Postfix", word(0x01ab2b84) / 12, postfix),
                      rich_presence_value("Signed", dword(0x01ab2be4), "VALUE"),
                      rich_presence_value("Signed", ReputationUrb4(), "VALUE"),
                      rich_presence_lookup("Locations", dword(0x4bebd0), locations)
)

rich_presence_display("Playing The Urbz: Sims in the City")

