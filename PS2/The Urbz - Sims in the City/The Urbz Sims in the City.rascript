// The Urbz: Sims in the City
// #ID = 19374

// Common Utils
function ZeroToOne(bit)  => bit > prev(bit)

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


rich_presence_conditional_display(dword(0x4bfb38) == 0 , "Loading...")
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


// Achievements

function firstLevelJobUnlock(offset) => ZeroToOne(bit0(dword(dword(0x4c0a0c) + offset) + 0x1911)) || 
                                  ZeroToOne(bit2(dword(dword(0x4c0a0c) + offset) + 0x190e)) ||
                                  ZeroToOne(bit7(dword(dword(0x4c0a0c) + offset) + 0x190e)) ||
                                  ZeroToOne(bit3(dword(dword(0x4c0a0c) + offset) + 0x1910)) ||
                                  ZeroToOne(bit1(dword(dword(0x4c0a0c) + offset) + 0x1912)) ||                                  
                                  ZeroToOne(bit4(dword(dword(0x4c0a0c) + offset) + 0x1912)) ||
                                  ZeroToOne(bit2(dword(dword(0x4c0a0c) + offset) + 0x191b)) ||
                                  ZeroToOne(bit1(dword(dword(0x4c0a0c) + offset) + 0x1911)) ||
                                  ZeroToOne(bit6(dword(dword(0x4c0a0c) + offset) + 0x190f))

function UnlockedDistricts(offset) => bitcount(dword(dword(0x4c0a0c) + offset) + 0x1908) + bit0(dword(dword(0x4c0a0c) + offset) + 0x1909)

function InGame() => dword(0x4bebc8) != 0

achievement(title="Got to Pay for This Lifestyle", 
            description="Earn your first paycheck",
            points=1,
            type="progression",
            trigger= InGame() && (dword(0x4c5304) == 4 && firstLevelJobUnlock(0x288) ||
                                  dword(0x4c5304) == 3 && firstLevelJobUnlock(0x2a0) ||
                                  dword(0x4c5304) == 2 && firstLevelJobUnlock(0x2a4) ||
                                  dword(0x4c5304) == 1 && firstLevelJobUnlock(0x2b4)))

achievement(title="Tony Who?",
            description="Beat the Pro Skater Job",
            points=3,
            type="progression",
            trigger= InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit4(dword(dword(0x4c0a0c) + 0x288) + 0x190f)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit4(dword(dword(0x4c0a0c) + 0x2a0) + 0x190f)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit4(dword(dword(0x4c0a0c) + 0x2a4) + 0x190f)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit4(dword(dword(0x4c0a0c) + 0x2b4) + 0x190f)))
            )
            

achievement(title="Zoo Tycoon",
            description="Beat the Ferret Master Job",
            points=3,
            type="progression",
            trigger= InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit1(dword(dword(0x4c0a0c) + 0x288) + 0x190f)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit1(dword(dword(0x4c0a0c) + 0x2a0) + 0x190f)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit1(dword(dword(0x4c0a0c) + 0x2a4) + 0x190f)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit1(dword(dword(0x4c0a0c) + 0x2b4) + 0x190f)))
            )
            

achievement(title="I Used the Same Oil for Both",
            description="Beat the Chop Shop Master Job",
            points=3,
            type="progression",
            trigger= InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit5(dword(dword(0x4c0a0c) + 0x288) + 0x190e)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit5(dword(dword(0x4c0a0c) + 0x2a0) + 0x190e)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit5(dword(dword(0x4c0a0c) + 0x2a4) + 0x190e)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit5(dword(dword(0x4c0a0c) + 0x2b4) + 0x190e)))
            )
            

achievement(title="Knockoff Cartier",
            description="Beat the Master Piercer Job",
            points=3,
            type="progression",
            trigger= InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit3(dword(dword(0x4c0a0c) + 0x288) + 0x1912)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit3(dword(dword(0x4c0a0c) + 0x2a0) + 0x1912)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit3(dword(dword(0x4c0a0c) + 0x2a4) + 0x1912)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit3(dword(dword(0x4c0a0c) + 0x2b4) + 0x1912)))
            )

achievement(title="Better than Auguste Rodin",
            description="Beat the Master Sculptor Job",
            points=3,
            type="progression",
            trigger= InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit1(dword(dword(0x4c0a0c) + 0x288) + 0x1910)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit1(dword(dword(0x4c0a0c) + 0x2a0) + 0x1910)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit1(dword(dword(0x4c0a0c) + 0x2a4) + 0x1910)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit1(dword(dword(0x4c0a0c) + 0x2b4) + 0x1910)))
            )            
            

achievement(title="Impressing Gordon Ramsay",
            description="Beat the Master Chef Job",
            points=3,
            type="progression",
            trigger= InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit6(dword(dword(0x4c0a0c) + 0x288) + 0x1910)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit6(dword(dword(0x4c0a0c) + 0x2a0) + 0x1910)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit6(dword(dword(0x4c0a0c) + 0x2a4) + 0x1910)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit6(dword(dword(0x4c0a0c) + 0x2b4) + 0x1910)))
            )
            

achievement(title="King of Cocktails",
            description="Beat the Mixmaster Job",
            points=3,
            type="progression",
            trigger= InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit2(dword(dword(0x4c0a0c) + 0x288) + 0x1911)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit2(dword(dword(0x4c0a0c) + 0x2a0) + 0x1911)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit2(dword(dword(0x4c0a0c) + 0x2a4) + 0x1911)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit2(dword(dword(0x4c0a0c) + 0x2b4) + 0x1911)))
            )
            

achievement(title="Upstaging the Big Six",
            description="Beat the Super Model Job",
            points=3,
            type="progression",
            trigger= InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit7(dword(dword(0x4c0a0c) + 0x288) + 0x1911)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit7(dword(dword(0x4c0a0c) + 0x2a0) + 0x1911)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit7(dword(dword(0x4c0a0c) + 0x2a4) + 0x1911)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit7(dword(dword(0x4c0a0c) + 0x2b4) + 0x1911)))
            )
            

achievement(title="Ready for the Fourth of July",
            description="Beat the Master Pyro Job",
            points=3,
            type="progression",
            trigger= InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit3(dword(dword(0x4c0a0c) + 0x288) + 0x191d)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit3(dword(dword(0x4c0a0c) + 0x2a0) + 0x191d)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit3(dword(dword(0x4c0a0c) + 0x2a4) + 0x191d)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit3(dword(dword(0x4c0a0c) + 0x2b4) + 0x191d)))
            )    
      

achievement(title="Branching Out",
            description="Without using cheats, unlock four additional districts",
            points=5,
            type="progression",
            trigger= InGame() && (dword(0x4c5304) == 4 && UnlockedDistricts(0x288) == 5 && prev(UnlockedDistricts(0x288)) == 4 ||
                                  dword(0x4c5304) == 3 && UnlockedDistricts(0x2a0) == 5 && prev(UnlockedDistricts(0x2a0)) == 4 ||
                                  dword(0x4c5304) == 2 && UnlockedDistricts(0x2a4) == 5 && prev(UnlockedDistricts(0x2a4)) == 4 ||
                                  dword(0x4c5304) == 1 && UnlockedDistricts(0x2b4) == 5 && prev(UnlockedDistricts(0x2b4)) == 4)
            )   
            

achievement(title="City Mapper",
            description="Without using cheats, unlock all districts",
            points=10,
            type="progression",
            trigger= InGame() && bit4(0x004c507a) == 0 && (dword(0x4c5304) == 4 && UnlockedDistricts(0x288) == 9 && prev(UnlockedDistricts(0x288)) == 8 ||
                                  dword(0x4c5304) == 3 && UnlockedDistricts(0x2a0) == 9 && prev(UnlockedDistricts(0x2a0)) == 8 ||
                                  dword(0x4c5304) == 2 && UnlockedDistricts(0x2a4) == 9 && prev(UnlockedDistricts(0x2a4)) == 8 ||
                                  dword(0x4c5304) == 1 && UnlockedDistricts(0x2b4) == 9 && prev(UnlockedDistricts(0x2b4)) == 8)
            )        
            
            
function HappyUrb(){
    start = once(word(dword(0x4c05ac) + 0x14) == 0 && word(dword(0x4c05ac) + 0x1e) == 1 && prev(word(dword(0x4c05ac) + 0x14)) == 0 && prev(word(dword(0x4c05ac) + 0x1e)) == 0)
    cancel = never(float(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0xbc) <= 0.0 ||                    
                   float(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0xc4) <= 0.0 ||
                   float(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0xc8) <= 0.0 || 
                   float(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0xcc) <= 0.0 || 
                   float(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0xe4) <= 0.0 
    )                                        
    submit = trigger_when(word(dword(0x4c05ac) + 0x14) == 0 && word(dword(0x4c05ac) + 0x1e) == 0 && prev(word(dword(0x4c05ac) + 0x14)) == 0x17 && prev(word(dword(0x4c05ac) + 0x1e) == 0x3b))
    return start && cancel && submit            
}
            
achievement(title="Happy Urb",
            description="Without using cheats, keep each of your Urb needs above 50% from midnight to midnight",
            points=10,
            trigger= HappyUrb()
            )            
            
         
