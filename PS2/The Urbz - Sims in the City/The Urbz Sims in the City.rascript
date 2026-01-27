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

function WillIAmRep(offset) => dword(dword(dword(dword(dword(dword(dword(dword(0x04c05b4) + 0x1b0) + offset) + 0x10) + 0x4) + 0x4) + 0x0) + 0x0)

rich_presence_conditional_display(dword(0x4bfb38) == 0 , "Loading...")
rich_presence_conditional_display(dword(0x4bfb38) != 0 && dword(0x4bebc8) == 0 , "In main menu")

rich_presence_conditional_display(dword(0x4bebc8) != 0 && word(0x4c5304) == 1, "{4} - Simulation time {0} {1} - Money {2} - Reputation {3} - WIA {5}",                      
                      rich_presence_value("Seconds", 60 * (((word(0x01ab2b84) + 11) % 12 + 12) % 12 + 1) + word(0x01ab2b8e), "SECS"),
                      rich_presence_lookup("Postfix", word(0x01ab2b84) / 12, postfix),
                      rich_presence_value("Signed", dword(0x01ab2be4), "VALUE"),
                      rich_presence_value("Signed", ReputationUrb1(), "VALUE"),
                      rich_presence_lookup("Locations", dword(0x4bebd0), locations),
                      rich_presence_value("Signed", WillIAmRep(0x84), "VALUE")
)

rich_presence_conditional_display(dword(0x4bebc8) != 0 && word(0x4c5304) == 2, "{4} - Simulation time {0} {1} - Money {2} - Reputation {3} - WIA {5}",                      
                      rich_presence_value("Seconds", 60 * (((word(0x01ab2b84) + 11) % 12 + 12) % 12 + 1) + word(0x01ab2b8e), "SECS"),
                      rich_presence_lookup("Postfix", word(0x01ab2b84) / 12, postfix),
                      rich_presence_value("Signed", dword(0x01ab2be4), "VALUE"),
                      rich_presence_value("Signed", ReputationUrb2(), "VALUE"),
                      rich_presence_lookup("Locations", dword(0x4bebd0), locations),
                      rich_presence_value("Signed", WillIAmRep(0xEc), "VALUE")
)

rich_presence_conditional_display(dword(0x4bebc8) != 0 && word(0x4c5304) == 3, "{4} - Simulation time {0} {1} - Money {2} - Reputation {3} - WIA {5}",                      
                      rich_presence_value("Seconds", 60 * (((word(0x01ab2b84) + 11) % 12 + 12) % 12 + 1) + word(0x01ab2b8e), "SECS"),
                      rich_presence_lookup("Postfix", word(0x01ab2b84) / 12, postfix),
                      rich_presence_value("Signed", dword(0x01ab2be4), "VALUE"),
                      rich_presence_value("Signed", ReputationUrb3(), "VALUE"),
                      rich_presence_lookup("Locations", dword(0x4bebd0), locations),
                      rich_presence_value("Signed", WillIAmRep(0x100), "VALUE")
)

rich_presence_conditional_display(dword(0x4bebc8) != 0 && word(0x4c5304) == 4, "{4} - Simulation time {0} {1} - Money {2} - Reputation {3} - WIA {5}",                      
                      rich_presence_value("Seconds", 60 * (((word(0x01ab2b84) + 11) % 12 + 12) % 12 + 1) + word(0x01ab2b8e), "SECS"),
                      rich_presence_lookup("Postfix", word(0x01ab2b84) / 12, postfix),
                      rich_presence_value("Signed", dword(0x01ab2be4), "VALUE"),
                      rich_presence_value("Signed", ReputationUrb4(), "VALUE"),
                      rich_presence_lookup("Locations", dword(0x4bebd0), locations),
                      rich_presence_value("Signed", WillIAmRep(0x104), "VALUE")
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
                                                        
// TODO: refine this if bit0(0x1913) preves always 0!
function villainJustBeaten(offset) => ZeroToOne(bit1(dword(dword(0x4c0a0c) + offset) + 0x1913)) ||        
                                      ZeroToOne(bit2(dword(dword(0x4c0a0c) + offset) + 0x1913)) ||
                                      ZeroToOne(bit3(dword(dword(0x4c0a0c) + offset) + 0x1913)) ||
                                      ZeroToOne(bit4(dword(dword(0x4c0a0c) + offset) + 0x1913)) ||
                                      ZeroToOne(bit5(dword(dword(0x4c0a0c) + offset) + 0x1913)) ||
                                      ZeroToOne(bit6(dword(dword(0x4c0a0c) + offset) + 0x1913)) ||
                                      ZeroToOne(bit7(dword(dword(0x4c0a0c) + offset) + 0x1913)) ||
                                      ZeroToOne(bit0(dword(dword(0x4c0a0c) + offset) + 0x1914)) ||
                                      ZeroToOne(bit1(dword(dword(0x4c0a0c) + offset) + 0x1914))
                            
// TODO: refine this if bit0(0x1913) preves always 0!
function villainsBeaten(offset) => bit1(dword(dword(0x4c0a0c) + offset) + 0x1913) +         
                                   bit2(dword(dword(0x4c0a0c) + offset) + 0x1913) +
                                   bit3(dword(dword(0x4c0a0c) + offset) + 0x1913) +
                                   bit4(dword(dword(0x4c0a0c) + offset) + 0x1913) +
                                   bit5(dword(dword(0x4c0a0c) + offset) + 0x1913) +
                                   bit6(dword(dword(0x4c0a0c) + offset) + 0x1913) +
                                   bit7(dword(dword(0x4c0a0c) + offset) + 0x1913) +
                                   bit0(dword(dword(0x4c0a0c) + offset) + 0x1914) +
                                   bit1(dword(dword(0x4c0a0c) + offset) + 0x1914)

function UnlockedDistricts(offset) => bitcount(dword(dword(0x4c0a0c) + offset) + 0x1908) + bit0(dword(dword(0x4c0a0c) + offset) + 0x1909)

function UnlockedPets(offset) => bit7(dword(dword(0x4c0a0c) + offset) + 0x1917) + 
                                 bit0(dword(dword(0x4c0a0c) + offset) + 0x1918) + 
                                 bit1(dword(dword(0x4c0a0c) + offset) + 0x1918)

function InGame() => dword(0x4bebc8) != 0

function UnlockedGreetSocials(offset) => bit1(dword(dword(0x4c0a0c) + offset) + 0x192f) + bit6(dword(dword(0x4c0a0c) + offset) + 0x192f) + bit7(dword(dword(0x4c0a0c) + offset) + 0x192f) +
                                         bit3(dword(dword(0x4c0a0c) + offset) + 0x1930) + bit0(dword(dword(0x4c0a0c) + offset) + 0x1931) + bit5(dword(dword(0x4c0a0c) + offset) + 0x1931) +
                                         bit2(dword(dword(0x4c0a0c) + offset) + 0x1932) + bit3(dword(dword(0x4c0a0c) + offset) + 0x1932) + bit7(dword(dword(0x4c0a0c) + offset) + 0x1932) +
                                         bit4(dword(dword(0x4c0a0c) + offset) + 0x1933) + bit5(dword(dword(0x4c0a0c) + offset) + 0x1933) + bit1(dword(dword(0x4c0a0c) + offset) + 0x1934) +
                                         bit5(dword(dword(0x4c0a0c) + offset) + 0x1934)

function UnlockedFriendlySocials(offset) => bit2(dword(dword(0x4c0a0c) + offset) + 0x192f) + bit2(dword(dword(0x4c0a0c) + offset) + 0x1930) + bit4(dword(dword(0x4c0a0c) + offset) + 0x1930) +
                                            bit7(dword(dword(0x4c0a0c) + offset) + 0x1930) + bit1(dword(dword(0x4c0a0c) + offset) + 0x1931) + bit4(dword(dword(0x4c0a0c) + offset) + 0x1931) +
                                            bit1(dword(dword(0x4c0a0c) + offset) + 0x1932) + bit6(dword(dword(0x4c0a0c) + offset) + 0x1932) + bit0(dword(dword(0x4c0a0c) + offset) + 0x1933) +
                                            bit3(dword(dword(0x4c0a0c) + offset) + 0x1933) + bit0(dword(dword(0x4c0a0c) + offset) + 0x1934) + bit2(dword(dword(0x4c0a0c) + offset) + 0x1934) +
                                            bit6(dword(dword(0x4c0a0c) + offset) + 0x1934) + 2
                                            
function UnlockedMeanSocials(offset) => bit4(dword(dword(0x4c0a0c) + offset) + 0x192f) + bit1(dword(dword(0x4c0a0c) + offset) + 0x1930) + bit6(dword(dword(0x4c0a0c) + offset) + 0x1930) +
                                        bit3(dword(dword(0x4c0a0c) + offset) + 0x1931) + bit6(dword(dword(0x4c0a0c) + offset) + 0x1931) + bit0(dword(dword(0x4c0a0c) + offset) + 0x1932) +
                                        bit5(dword(dword(0x4c0a0c) + offset) + 0x1932) + bit2(dword(dword(0x4c0a0c) + offset) + 0x1933) + bit7(dword(dword(0x4c0a0c) + offset) + 0x1933) +                                            
                                        bit4(dword(dword(0x4c0a0c) + offset) + 0x1934) + 2
                                            
function UnlockedRomanticSocials(offset) => bit3(dword(dword(0x4c0a0c) + offset) + 0x192f) + bit0(dword(dword(0x4c0a0c) + offset) + 0x1930) + bit5(dword(dword(0x4c0a0c) + offset) + 0x1930) +
                                            bit2(dword(dword(0x4c0a0c) + offset) + 0x1931) + bit7(dword(dword(0x4c0a0c) + offset) + 0x1931) + bit4(dword(dword(0x4c0a0c) + offset) + 0x1932) +
                                            bit1(dword(dword(0x4c0a0c) + offset) + 0x1933) + bit6(dword(dword(0x4c0a0c) + offset) + 0x1933) + bit3(dword(dword(0x4c0a0c) + offset) + 0x1934) + 1
                                            

achievement(title="Great Greeter",
            description="Unlock all 13 \"Greet\" social moves",
            points=5,
            trigger= (dword(0x4c5304) == 4 && prev(UnlockedGreetSocials(0x288)) == 12 && measured(UnlockedGreetSocials(0x288) == 13, when=InGame()) ||
                      dword(0x4c5304) == 3 && prev(UnlockedGreetSocials(0x2a0)) == 12 && measured(UnlockedGreetSocials(0x2a0) == 13, when=InGame()) ||
                      dword(0x4c5304) == 2 && prev(UnlockedGreetSocials(0x2a4)) == 12 && measured(UnlockedGreetSocials(0x2a4) == 13, when=InGame()) ||
                      dword(0x4c5304) == 1 && prev(UnlockedGreetSocials(0x2b4)) == 12 && measured(UnlockedGreetSocials(0x2b4) == 13, when=InGame()))
            )
            
achievement(title="Outgoing Citizen",
            description="Unlock all 15 \"Act Friendly\" social moves",
            points=5,
            trigger= (dword(0x4c5304) == 4 && prev(UnlockedFriendlySocials(0x288)) == 14 && measured(UnlockedFriendlySocials(0x288) == 15, when=InGame()) ||
                      dword(0x4c5304) == 3 && prev(UnlockedFriendlySocials(0x2a0)) == 14 && measured(UnlockedFriendlySocials(0x2a0) == 15, when=InGame()) ||
                      dword(0x4c5304) == 2 && prev(UnlockedFriendlySocials(0x2a4)) == 14 && measured(UnlockedFriendlySocials(0x2a4) == 15, when=InGame()) ||
                      dword(0x4c5304) == 1 && prev(UnlockedFriendlySocials(0x2b4)) == 14 && measured(UnlockedFriendlySocials(0x2b4) == 15, when=InGame()))
            )
            
achievement(title="Public Enemy",
            description="Unlock all 12 \"Act Mean\" social moves",
            points=5,
            trigger= (dword(0x4c5304) == 4 && prev(UnlockedMeanSocials(0x288)) == 11 && measured(UnlockedMeanSocials(0x288) == 12, when=InGame()) ||
                      dword(0x4c5304) == 3 && prev(UnlockedMeanSocials(0x2a0)) == 11 && measured(UnlockedMeanSocials(0x2a0) == 12, when=InGame()) ||
                      dword(0x4c5304) == 2 && prev(UnlockedMeanSocials(0x2a4)) == 11 && measured(UnlockedMeanSocials(0x2a4) == 12, when=InGame()) ||
                      dword(0x4c5304) == 1 && prev(UnlockedMeanSocials(0x2b4)) == 11 && measured(UnlockedMeanSocials(0x2b4) == 12, when=InGame()))
            )            
           
achievement(title="Dirty Romantic",
            description="Unlock all 10 \"Act Romantic\" social moves",
            points=5,
            trigger= (dword(0x4c5304) == 4 && prev(UnlockedRomanticSocials(0x288)) == 9 && measured(UnlockedRomanticSocials(0x288) == 10, when=InGame()) ||
                      dword(0x4c5304) == 3 && prev(UnlockedRomanticSocials(0x2a0)) == 9 && measured(UnlockedRomanticSocials(0x2a0) == 10, when=InGame()) ||
                      dword(0x4c5304) == 2 && prev(UnlockedRomanticSocials(0x2a4)) == 9 && measured(UnlockedRomanticSocials(0x2a4) == 10, when=InGame()) ||
                      dword(0x4c5304) == 1 && prev(UnlockedRomanticSocials(0x2b4)) == 9 && measured(UnlockedRomanticSocials(0x2b4) == 10, when=InGame()))
            )           
                                     
achievement(title="Caring Pet Owner",
            description="Feed a pet",
            points=1,
            trigger= InGame() && (dword(0x4c5304) == 4 && word(dword(dword(0x4c0a0c) + 0x288) + 0x18E6) > prev(word(dword(dword(0x4c0a0c) + 0x288) + 0x18E6)) ||
                                  dword(0x4c5304) == 3 && word(dword(dword(0x4c0a0c) + 0x2a0) + 0x18E6) > prev(word(dword(dword(0x4c0a0c) + 0x2a0) + 0x18E6)) ||
                                  dword(0x4c5304) == 2 && word(dword(dword(0x4c0a0c) + 0x2a4) + 0x18E6) > prev(word(dword(dword(0x4c0a0c) + 0x2a4) + 0x18E6)) ||
                                  dword(0x4c5304) == 1 && word(dword(dword(0x4c0a0c) + 0x2b4) + 0x18E6) > prev(word(dword(dword(0x4c0a0c) + 0x2b4) + 0x18E6)))
            )
            
achievement(title="Casanova",
            description="Be part of at least 5 romances",
            points=5,
            trigger= InGame() && (dword(0x4c5304) == 4 && word(dword(dword(0x4c0a0c) + 0x288) + 0x18F0) > prev(word(dword(dword(0x4c0a0c) + 0x288) + 0x18F0)) &&
                                     word(dword(dword(0x4c0a0c) + 0x288) + 0x18F0) >= 3 ||
                                  dword(0x4c5304) == 3 && word(dword(dword(0x4c0a0c) + 0x2a0) + 0x18F0) > prev(word(dword(dword(0x4c0a0c) + 0x2a0) + 0x18F0)) &&
                                     word(dword(dword(0x4c0a0c) + 0x2a0) + 0x18F0) >= 3 ||
                                  dword(0x4c5304) == 2 && word(dword(dword(0x4c0a0c) + 0x2a4) + 0x18F0) > prev(word(dword(dword(0x4c0a0c) + 0x2a4) + 0x18F0)) &&
                                     word(dword(dword(0x4c0a0c) + 0x2a4) + 0x18F0) >= 3 ||
                                  dword(0x4c5304) == 1 && word(dword(dword(0x4c0a0c) + 0x2b4) + 0x18F0) > prev(word(dword(dword(0x4c0a0c) + 0x2b4) + 0x18F0)) &&
                                     word(dword(dword(0x4c0a0c) + 0x2b4) + 0x18F0) >= 3)
            )      
            
achievement(title="Can't Please Everyone",
            description="Make at least three enemies",
            points=2,
            trigger= InGame() && (dword(0x4c5304) == 4 && word(dword(dword(0x4c0a0c) + 0x288) + 0x18F4) > prev(word(dword(dword(0x4c0a0c) + 0x288) + 0x18F4)) &&
                                     word(dword(dword(0x4c0a0c) + 0x288) + 0x18F4) >= 3 ||
                                  dword(0x4c5304) == 3 && word(dword(dword(0x4c0a0c) + 0x2a0) + 0x18F4) > prev(word(dword(dword(0x4c0a0c) + 0x2a0) + 0x18F4)) &&
                                     word(dword(dword(0x4c0a0c) + 0x2a0) + 0x18F4) >= 3 ||
                                  dword(0x4c5304) == 2 && word(dword(dword(0x4c0a0c) + 0x2a4) + 0x18F4) > prev(word(dword(dword(0x4c0a0c) + 0x2a4) + 0x18F4)) &&
                                     word(dword(dword(0x4c0a0c) + 0x2a4) + 0x18F4) >= 3 ||
                                  dword(0x4c5304) == 1 && word(dword(dword(0x4c0a0c) + 0x2b4) + 0x18F4) > prev(word(dword(dword(0x4c0a0c) + 0x2b4) + 0x18F4)) &&
                                     word(dword(dword(0x4c0a0c) + 0x2b4) + 0x18F4) >= 3)
            )        
            
achievement(title="Redemption",
            description="Make amends with an enemy and repair your relationship",
            points=2,
            trigger= InGame() && (dword(0x4c5304) == 4 && word(dword(dword(0x4c0a0c) + 0x288) + 0x18F6) > prev(word(dword(dword(0x4c0a0c) + 0x288) + 0x18F6)) ||
                                  dword(0x4c5304) == 3 && word(dword(dword(0x4c0a0c) + 0x2a0) + 0x18F6) > prev(word(dword(dword(0x4c0a0c) + 0x2a0) + 0x18F6)) ||
                                  dword(0x4c5304) == 2 && word(dword(dword(0x4c0a0c) + 0x2a4) + 0x18F6) > prev(word(dword(dword(0x4c0a0c) + 0x2a4) + 0x18F6)) ||
                                  dword(0x4c5304) == 1 && word(dword(dword(0x4c0a0c) + 0x2b4) + 0x18F6) > prev(word(dword(dword(0x4c0a0c) + 0x2b4) + 0x18F6)))
            )               
            
achievement(title="One Down, Eight to Go",
            description="Emerge victorious from a villain encounter",
            points=3,
            type="progression",
            trigger= InGame() && (dword(0x4c5304) == 4 && villainJustBeaten(0x288) ||
                                  dword(0x4c5304) == 3 && villainJustBeaten(0x2a0) ||
                                  dword(0x4c5304) == 2 && villainJustBeaten(0x2a4) ||
                                  dword(0x4c5304) == 1 && villainJustBeaten(0x2b4))
            )

achievement(title="Your Basic Disney Hero",
            description="Emerge victorious from all villain encounters",
            points=5,
            type="progression",
            trigger= (dword(0x4c5304) == 4 && measured(villainsBeaten(0x288) == 9, when=InGame()) && prev(villainsBeaten(0x288)) == 8 ||
                      dword(0x4c5304) == 3 && measured(villainsBeaten(0x2a0) == 9, when=InGame()) && prev(villainsBeaten(0x2a0)) == 8 ||
                      dword(0x4c5304) == 2 && measured(villainsBeaten(0x2a4) == 9, when=InGame()) && prev(villainsBeaten(0x2a4)) == 8 ||
                      dword(0x4c5304) == 1 && measured(villainsBeaten(0x2b4) == 9, when=InGame()) && prev(villainsBeaten(0x2b4)) == 8 )
            )

achievement(title="Got to Pay for This Lifestyle", 
            description="Earn your first paycheck",
            points=1,
            type="progression",
            trigger= InGame() && (dword(0x4c5304) == 4 && firstLevelJobUnlock(0x288) ||
                                  dword(0x4c5304) == 3 && firstLevelJobUnlock(0x2a0) ||
                                  dword(0x4c5304) == 2 && firstLevelJobUnlock(0x2a4) ||
                                  dword(0x4c5304) == 1 && firstLevelJobUnlock(0x2b4)))

achievement(title="Wildlife Preservation", 
            description="Unlock all three pets",
            points=2,
            trigger=(dword(0x4c5304) == 4 && measured(UnlockedPets(0x288) == 3, when=InGame()) && prev(UnlockedPets(0x288)) == 2 ||
                     dword(0x4c5304) == 3 && measured(UnlockedPets(0x2a0) == 3, when=InGame()) && prev(UnlockedPets(0x2a0)) == 2 ||
                     dword(0x4c5304) == 2 && measured(UnlockedPets(0x2a4) == 3, when=InGame()) && prev(UnlockedPets(0x2a4)) == 2 ||
                     dword(0x4c5304) == 1 && measured(UnlockedPets(0x2b4) == 3, when=InGame()) && prev(UnlockedPets(0x2b4)) == 2)
)

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
            
         
