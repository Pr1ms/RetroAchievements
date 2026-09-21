// Tony Hawk's Proving Ground
// #ID = 20820

rich_presence_display("Highest combo: {0} - Playtime {1}",
                      rich_presence_value("Value", dword(dword(0x57fe04) + 0x398), "VALUE"),
                      rich_presence_value("Seconds", float(dword(0x5c9af4) + 0x2e4), "SECS")                     
)   
