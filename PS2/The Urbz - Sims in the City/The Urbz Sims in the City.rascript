// The Urbz: Sims in the City
// #ID = 19374

// Common Utils
function ZeroToOne(bit)  => bit > prev(bit)

function CheatsEnabled() => byte(0x004c507a) == 0 && byte(0x004c507b) == 0
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
0x7c: "Chilling at Darius' Penthouse",
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

function relationshipCount(offset) => (dword(dword(dword(dword(dword(0x04c05b4) + 0x1b0) + offset) + 0x10) + 0x8) - dword(dword(dword(dword(dword(0x04c05b4) + 0x1b0) + offset) + 0x10) + 0x4)) / 4 - 1//(((dword(dword(dword(dword(dword(0x04c05b4) + 0x1b0) + offset) + 0x10) + 0x8) - dword(dword(dword(dword(dword(0x04c05b4) + 0x1b0) + offset) + 0x10) + 0x4)) -4) / 4

function InMainMenu() => dword(0x459b28) == 0

function InGame() => dword(0x4bfb38) == 1 && // Not Loading
                     !InMainMenu() // Not in Main Menu

function WillIAmRep(offset) => dword(dword(dword(dword(dword(dword(dword(dword(0x04c05b4) + 0x1b0) + offset) + 0x10) + 0x4) + 0x4) + 0x0) + 0x0)
function WillIAmMod(offset) => bit5(dword(dword(dword(dword(dword(dword(dword(0x04c05b4) + 0x1b0) + offset) + 0x10) + 0x4) + 0x4) + 0x0) + 0x4)

/**

dword(0x4c0530) != 0 && 
                dword(0x4bebc8) == 0 && // This one protects us from priming in main menu after quiting a game (memory not entirely cleaned up)
                dword(0x4bec40) == 0 && // This one protects against a flash prime during loading screens
*/

rich_presence_conditional_display(dword(0x4bfb38) == 0, "Loading...")
rich_presence_conditional_display(InMainMenu() || dword(0x4c5304) == 0 || dword(0x4c0530) == 0, "In main menu")
rich_presence_conditional_display(dword(0x4bfb38) == 1 && dword(0x4bebc8) == 0 && dword(0x4c0530) != 0 && dword(0x4bec40) == 0 && !InMainMenu(), "Picking their style")
rich_presence_conditional_display(byte(0x4c507a) > 0 || byte(0x4c507b) > 0, "You can't fake fame: Darius knows you cheated and locked you out of achievements! Don't save your game!")

rich_presence_conditional_display(dword(0x4bebc8) != 0 && dword(0x4c5304) == 1, "{4} - {0} {1} - §{2} - Reputation {3}",                      
                      rich_presence_value("Seconds", 60 * (((word(dword(0x4c05ac) + 0x14) + 11) % 12 + 12) % 12 + 1) + word(dword(0x4c05ac) + 0x1e), "SECS"),
                      rich_presence_lookup("Postfix", word(dword(0x4c05ac) + 0x14) / 12, postfix),
                      rich_presence_value("Number", dword(dword(0x4c05ac) + 0x74), "VALUE"),
                      rich_presence_value("Number", ReputationUrb1(), "VALUE"),
                      rich_presence_lookup("Locations", dword(0x4bebd0), locations))
                      

rich_presence_conditional_display(dword(0x4bebc8) != 0 && dword(0x4c5304) == 2, "{4} - {0} {1} - §{2} - Reputation {3}",                                
                      rich_presence_value("Seconds", 60 * (((word(dword(0x4c05ac) + 0x14) + 11) % 12 + 12) % 12 + 1) + word(dword(0x4c05ac) + 0x1e), "SECS"),
                      rich_presence_lookup("Postfix", word(dword(0x4c05ac) + 0x14) / 12, postfix),
                      rich_presence_value("Number", dword(dword(0x4c05ac) + 0x74), "VALUE"),
                      rich_presence_value("Number", ReputationUrb2(), "VALUE"),
                      rich_presence_lookup("Locations", dword(0x4bebd0), locations))

rich_presence_conditional_display(dword(0x4bebc8) != 0 && dword(0x4c5304) == 3, "{4} - {0} {1} - §{2} - Reputation {3}",                                   
                      rich_presence_value("Seconds", 60 * (((word(dword(0x4c05ac) + 0x14) + 11) % 12 + 12) % 12 + 1) + word(dword(0x4c05ac) + 0x1e), "SECS"),
                      rich_presence_lookup("Postfix", word(dword(0x4c05ac) + 0x14) / 12, postfix),
                      rich_presence_value("Number", dword(dword(0x4c05ac) + 0x74), "VALUE"),
                      rich_presence_value("Number", ReputationUrb3(), "VALUE"),
                      rich_presence_lookup("Locations", dword(0x4bebd0), locations))


rich_presence_conditional_display(dword(0x4bebc8) != 0 && dword(0x4c5304) == 4, "{4} - {0} {1} - §{2} - Reputation {3}",                                     
                      rich_presence_value("Seconds", 60 * (((word(dword(0x4c05ac) + 0x14) + 11) % 12 + 12) % 12 + 1) + word(dword(0x4c05ac) + 0x1e), "SECS"),
                      rich_presence_lookup("Postfix", word(dword(0x4c05ac) + 0x14) / 12, postfix),
                      rich_presence_value("Number", dword(dword(0x4c05ac) + 0x74), "VALUE"),
                      rich_presence_value("Number", ReputationUrb4(), "VALUE"),
                      rich_presence_lookup("Locations", dword(0x4bebd0), locations))


rich_presence_display("Playing The Urbz: Sims in the City")


// Achievements

function firstLevelJobUnlock(offset) => ZeroToOne(bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1911)) || 
                                  ZeroToOne(bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190e)) ||
                                  ZeroToOne(bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190e)) ||
                                  ZeroToOne(bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1910)) ||
                                  ZeroToOne(bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1912)) ||                                  
                                  ZeroToOne(bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1912)) ||
                                  ZeroToOne(bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191b)) ||
                                  ZeroToOne(bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1911)) ||
                                  ZeroToOne(bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190f))
                                                        
// TODO: refine this if bit0(0x1913) preves always 0!
function villainJustBeaten(offset) => ZeroToOne(bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913)) ||        
                                      ZeroToOne(bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913)) ||
                                      ZeroToOne(bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913)) ||
                                      ZeroToOne(bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913)) ||
                                      ZeroToOne(bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913)) ||
                                      ZeroToOne(bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913)) ||
                                      ZeroToOne(bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913)) ||
                                      ZeroToOne(bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1914)) ||
                                      ZeroToOne(bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1914))
                            
// TODO: refine this if bit0(0x1913) preves always 0!
function villainsBeaten(offset) => bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913) +         
                                   bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913) +
                                   bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913) +
                                   bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913) +
                                   bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913) +
                                   bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913) +
                                   bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913) +
                                   bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1914) +
                                   bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1914)

function UnlockedDistricts(offset) => bitcount(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1908) + bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1909)

function UnlockedPets(offset) => bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1917) + 
                                 bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1918) + 
                                 bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1918)

function DidNotCheat() => disable_when(byte(0x4c507a) > 0 || byte(0x4c507b) > 0, until=InMainMenu())


function UnlockedGreetSocials(offset) => bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x192f) + bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x192f) + bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x192f) +
                                         bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1930) + bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1931) + bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1931) +
                                         bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1932) + bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1932) + bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1932) +
                                         bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1933) + bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1933) + bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1934) +
                                         bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1934)

function UnlockedFriendlySocials(offset) => bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x192f) + bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1930) + bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1930) +
                                            bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1930) + bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1931) + bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1931) +
                                            bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1932) + bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1932) + bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1933) +
                                            bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1933) + bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1934) + bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1934) +
                                            bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1934) + 2
                                            
function UnlockedMeanSocials(offset) => bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x192f) + bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1930) + bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1930) +
                                        bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1931) + bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1931) + bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1932) +
                                        bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1932) + bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1933) + bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1933) +                                            
                                        bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1934) + 2
                                            
function UnlockedRomanticSocials(offset) => bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x192f) + bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1930) + bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1930) +
                                            bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1931) + bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1931) + bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1932) +
                                            bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1933) + bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1933) + bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1934) + 1
                                            

function achievedFoundryGoals(offset) => bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1908) + bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190e) + bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190e) +
                                         bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1910) + bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1912) + bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1914) +
                                         bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1917) + bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191a) + bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191b)
                 
                 
function achievedSkylineBeachGoals(offset) => bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1908) + bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1909) + bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190f) +
                                              bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1911) + bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913) + bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1918) +
                                              bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191a) + bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191c) + bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191d) +
                                              bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191f)

function achievedGasolineRowGoals(offset) => bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1908) + bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190e) + bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190f) +
                                             bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1911) + bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1912) + bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1912) +
                                             bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913) + bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1914) + bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1914) +
                                             bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191f)
                                         
function achievedCentralStationGoals(offset) => bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1908) + bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190e) + bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190e) +
                                                bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1912) + bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913) + bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1915) +
                                                bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191c) + bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191d) + bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191d) +
                                                bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191f)
                                         
function achievedKicktailParkGoals(offset) => bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1909) + bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190e) + bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190f) +
                                              bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190f) + bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1914) + bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1914) +
                                              bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1915) + bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1917) + bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1919) +
                                              bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191d) + bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191d)
                                         
function achievedNeonEastGoals(offset) => bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1908) + bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1910) + bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1910) +
                                          bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1912) + bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913) + bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1914) +
                                          bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1915) + bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1915) + bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1916) + 
                                          bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191b) + bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191c)
                                         
function achievedCozmoStreetGoals(offset) => bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1908) + bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190f) + bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190f) +
                                             bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190f) + bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1910) + bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1911) +
                                             bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1912) + bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1912) + bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913) +
                                             bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1916)
                                         
function achievedDiamondHeightsGoals(offset) => bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1908) + bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x190f) + bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1910) +
                                                bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1910) + bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1911) + bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913) +
                                                bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1915) + bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1917) + bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191c) +
                                                bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191e)
                                         
function achievedSouthSideBridgeGoals(offset) => bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1908) + bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1910) + bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1910) +
                                                 bit0(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1911) + bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1911) + bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1913) + 
                                                 bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1914) + bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x1917) + bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x191d)         
                 
function allGoals(offset) => UnlockedPets(offset) + achievedFoundryGoals(offset) + achievedSkylineBeachGoals(offset) + achievedGasolineRowGoals(offset) + achievedCentralStationGoals(offset) +
                             achievedKicktailParkGoals(offset) + achievedNeonEastGoals(offset) + achievedCozmoStreetGoals(offset) + achievedDiamondHeightsGoals(offset) + 
                             achievedSouthSideBridgeGoals(offset)
                  

function pickedUpPowerSocialInSlot(offset, slot) => byte(dword(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x38 + 4 * slot)) == 3 && (prev(dword(dword(dword(dword(0x4c05b4) + 0x1c0) + offset)  + 0x38 + 4 * slot)) == 0 || byte(dword(dword(dword(dword(0x4c05b4) + 0x1c0) + offset)  + 0x38 + 4 * slot) + 1) > prev(byte(dword(dword(dword(dword(0x4c05b4) + 0x1c0) + offset)  + 0x38 + 4 * slot) + 1)))

function pickedUpPowerSocial(offset){
    return pickedUpPowerSocialInSlot(offset, 0) || pickedUpPowerSocialInSlot(offset, 1) || pickedUpPowerSocialInSlot(offset, 2) || pickedUpPowerSocialInSlot(offset, 3) ||
           pickedUpPowerSocialInSlot(offset, 4) || pickedUpPowerSocialInSlot(offset, 5) || pickedUpPowerSocialInSlot(offset, 6) || pickedUpPowerSocialInSlot(offset, 7) ||
           pickedUpPowerSocialInSlot(offset, 8) || pickedUpPowerSocialInSlot(offset, 9) || pickedUpPowerSocialInSlot(offset, 10) || pickedUpPowerSocialInSlot(offset, 11) ||
           pickedUpPowerSocialInSlot(offset, 12) || pickedUpPowerSocialInSlot(offset, 13) || pickedUpPowerSocialInSlot(offset, 14) || pickedUpPowerSocialInSlot(offset, 15) ||
           pickedUpPowerSocialInSlot(offset, 16) || pickedUpPowerSocialInSlot(offset, 17) || pickedUpPowerSocialInSlot(offset, 18) || pickedUpPowerSocialInSlot(offset, 19) ||
           pickedUpPowerSocialInSlot(offset, 20) || pickedUpPowerSocialInSlot(offset, 21) || pickedUpPowerSocialInSlot(offset, 22) || pickedUpPowerSocialInSlot(offset, 23) ||
           pickedUpPowerSocialInSlot(offset, 24) || pickedUpPowerSocialInSlot(offset, 25) || pickedUpPowerSocialInSlot(offset, 26) || pickedUpPowerSocialInSlot(offset, 27) ||
           pickedUpPowerSocialInSlot(offset, 28) || pickedUpPowerSocialInSlot(offset, 29) || pickedUpPowerSocialInSlot(offset, 30) || pickedUpPowerSocialInSlot(offset, 31) ||
           pickedUpPowerSocialInSlot(offset, 32) || pickedUpPowerSocialInSlot(offset, 33) || pickedUpPowerSocialInSlot(offset, 34) || pickedUpPowerSocialInSlot(offset, 35)
 }
 
function newPowerSocialPickedUpInSlot(offset, slot) => byte(dword(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x38 + 4 * slot)) == 3 && prev(dword(dword(dword(dword(0x4c05b4) + 0x1c0) + offset)  + 0x38 + 4 * slot)) == 0
function newPowerSocialPickedUp(offset){
    return newPowerSocialPickedUpInSlot(offset, 0) || newPowerSocialPickedUpInSlot(offset, 1) || newPowerSocialPickedUpInSlot(offset, 2) || newPowerSocialPickedUpInSlot(offset, 3) ||
           newPowerSocialPickedUpInSlot(offset, 4) || newPowerSocialPickedUpInSlot(offset, 5) || newPowerSocialPickedUpInSlot(offset, 6) || newPowerSocialPickedUpInSlot(offset, 7) ||
           newPowerSocialPickedUpInSlot(offset, 8) || newPowerSocialPickedUpInSlot(offset, 9) || newPowerSocialPickedUpInSlot(offset, 10) || newPowerSocialPickedUpInSlot(offset, 11) ||
           newPowerSocialPickedUpInSlot(offset, 12) || newPowerSocialPickedUpInSlot(offset, 13) || newPowerSocialPickedUpInSlot(offset, 14) || newPowerSocialPickedUpInSlot(offset, 15) ||
           newPowerSocialPickedUpInSlot(offset, 16) || newPowerSocialPickedUpInSlot(offset, 17) || newPowerSocialPickedUpInSlot(offset, 18) || newPowerSocialPickedUpInSlot(offset, 19) ||
           newPowerSocialPickedUpInSlot(offset, 20) || newPowerSocialPickedUpInSlot(offset, 21) || newPowerSocialPickedUpInSlot(offset, 22) || newPowerSocialPickedUpInSlot(offset, 23) ||
           newPowerSocialPickedUpInSlot(offset, 24) || newPowerSocialPickedUpInSlot(offset, 25) || newPowerSocialPickedUpInSlot(offset, 26) || newPowerSocialPickedUpInSlot(offset, 27) ||
           newPowerSocialPickedUpInSlot(offset, 28) || newPowerSocialPickedUpInSlot(offset, 29) || newPowerSocialPickedUpInSlot(offset, 30) || newPowerSocialPickedUpInSlot(offset, 31) ||
           newPowerSocialPickedUpInSlot(offset, 32) || newPowerSocialPickedUpInSlot(offset, 33) || newPowerSocialPickedUpInSlot(offset, 34) || newPowerSocialPickedUpInSlot(offset, 35)
}


function powerSocialInSlot(offset, slot){
   return byte(dword(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x38 + 4 * slot)) / 3 
}


function powerSocialCount(offset) =>
    powerSocialInSlot(offset, 0) + powerSocialInSlot(offset, 1) + powerSocialInSlot(offset, 2) + powerSocialInSlot(offset, 3) +
    powerSocialInSlot(offset, 4) + powerSocialInSlot(offset, 5) + powerSocialInSlot(offset, 6) + powerSocialInSlot(offset, 7) +
    powerSocialInSlot(offset, 8) + powerSocialInSlot(offset, 9) + powerSocialInSlot(offset, 10) + powerSocialInSlot(offset, 11) +
    powerSocialInSlot(offset, 12) + powerSocialInSlot(offset, 13) + powerSocialInSlot(offset, 14) + powerSocialInSlot(offset, 15) +
    powerSocialInSlot(offset, 16) + powerSocialInSlot(offset, 17) + powerSocialInSlot(offset, 18) + powerSocialInSlot(offset, 19) +
    powerSocialInSlot(offset, 20) + powerSocialInSlot(offset, 21) + powerSocialInSlot(offset, 22) + powerSocialInSlot(offset, 23) +
    powerSocialInSlot(offset, 24) + powerSocialInSlot(offset, 25) + powerSocialInSlot(offset, 26) + powerSocialInSlot(offset, 27) +
    powerSocialInSlot(offset, 28) + powerSocialInSlot(offset, 29) + powerSocialInSlot(offset, 30) + powerSocialInSlot(offset, 31) +
    powerSocialInSlot(offset, 32) + powerSocialInSlot(offset, 33) + powerSocialInSlot(offset, 34) + powerSocialInSlot(offset, 35)


// function relationshipCount(offset) => (dword(dword(dword(dword(dword(0x04c05b4) + 0x1b0) + offset) + 0x10) + 0x8) - dword(dword(dword(dword(dword(0x04c05b4) + 0x1b0) + offset) + 0x10) + 0x4)) / 4 - 1//(((dword(dword(dword(dword(dword(0x04c05b4) + 0x1b0) + offset) + 0x10) + 0x8) - dword(dword(dword(dword(dword(0x04c05b4) + 0x1b0) + offset) + 0x10) + 0x4)) -4) / 4

function willGotInCrew(offset)
{
    return dword(dword(dword(dword(dword(0x04c05b4) + 0x1b0) + offset) + 0x10) + 0x8) != dword(dword(dword(dword(dword(0x04c05b4) + 0x1b0) + offset) + 0x10) + 0x4) && 
    WillIAmMod(offset) > prev(WillIAmMod(offset))
}


// This one has an extra ResetNextIf in the the actual logics, don't blindly resync it
/**
achievement(title="I'll Keep My Stuff, Thanks!",
            description="Pay your rent and prevent Maxis from reusing that FX from Bustin' Out",
            points=2,
            trigger= DidNotCheat() && InGame() && 
                     once(dword(dword(0x4c514c) + 0xec) != 0xffffffff) && // Checkpoint: there is a popup on screen
                     never(tally(6, dword(dword(0x4c514c) + 0xec) == 0xffffffff)) &&// Reset: if we are 0xffffffff again for at least 6 frames
                     (dword(dword(0x4c05ac) + 0x74) == prev(dword(dword(0x4c05ac) + 0x74)) - 300 || // Trigger condition: money is down 300 Simoleons (1st flat)
                      dword(dword(0x4c05ac) + 0x74) == prev(dword(dword(0x4c05ac) + 0x74)) - 1000 || // Trigger condition: money is down 1000 Simoleons (2nd flat)
                      dword(dword(0x4c05ac) + 0x74) == prev(dword(dword(0x4c05ac) + 0x74)) - 2400) // Trigger condition: money is down 1000 Simoleons (3rd flat)
            )
*/

achievement(title="The Man Who Showed Me the Ropes",
            description="Recruit will.i.am into your Crew",
            points=5,
            trigger= DidNotCheat() && InGame()  && (dword(0x4c5304) == 4 && willGotInCrew(0x104) || dword(0x4c5304) == 3 && willGotInCrew(0x100) ||
                                       dword(0x4c5304) == 2 && willGotInCrew(0xec) || dword(0x4c5304) == 1 && willGotInCrew(0x84)) 
            )

achievement(title="Don't Worry, I'm Packing Heat",
            description="Have all 9 Power Social items at once in your inventory",
            points=10,
            trigger= DidNotCheat() && InGame()  && (measured(powerSocialCount(0x8) == 9, when=dword(0x4c5304) == 4) && prev(powerSocialCount(0x8)) == 8 ||
                                       measured(powerSocialCount(0x20) == 9, when=dword(0x4c5304) == 3) && prev(powerSocialCount(0x20)) == 8 ||
                                       measured(powerSocialCount(0x24) == 9, when=dword(0x4c5304) == 2) && prev(powerSocialCount(0x24)) == 8 ||
                                       measured(powerSocialCount(0x34) == 9, when=dword(0x4c5304) == 1) && prev(powerSocialCount(0x34)) == 8)
            )
            

achievement(title="Virtuoso",
            description="Reach level 30 in Artistic Skill",
            type="progression",
            points=5,
            trigger= DidNotCheat() && InGame() && word(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0x26) == 900 && prev(word(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0x26)) == 870
            )
            
achievement(title="Apex Physique",
            description="Reach level 30 in Physical Skill",
            type="progression",
            points=5,
            trigger= DidNotCheat() && InGame() && word(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0x2a) == 900 && prev(word(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0x2a)) == 870
            )
            
achievement(title="Overclocked Brain",
            description="Reach level 30 in Mental Skill",
            type="progression",
            points=5,
            trigger= DidNotCheat() && InGame() && word(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0x2c) == 900 && prev(word(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0x2c)) == 870 
            )            

achievement(title="Level 33: Boss",
            description="Get everything unlockable by fame by reaching a reputation of 340",
            type="progression",
            points=5,
                      
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && ReputationUrb4() >= 340 && prev(ReputationUrb4()) != 0 && prev(ReputationUrb4()) < 340 ||
                      dword(0x4c5304) == 3 && ReputationUrb3() >= 340 && prev(ReputationUrb3()) != 0 && prev(ReputationUrb3()) < 340 ||
                      dword(0x4c5304) == 2 && ReputationUrb2() >= 340 && prev(ReputationUrb2()) != 0 && prev(ReputationUrb2()) < 340 ||
                      dword(0x4c5304) == 1 && ReputationUrb1() >= 340 && prev(ReputationUrb1()) != 0 && prev(ReputationUrb1()) < 340)
            )  

function moneyInStyleShop(offset) => dword(dword(dword(dword(0x4c05b4) + 0x1c0) + offset) + 0x14)

achievement(title="Got to Look the Part",
            description="Spend 500 Simoleons in a single visit to the style shop",
            points=5,
            trigger= DidNotCheat() && InGame() && 
                dword(0x4c0530) != 0 && 
                dword(0x4bebc8) == 0 && // This one protects us from priming in main menu after quiting a game (memory not entirely cleaned up)
                dword(0x4bec40) == 0 && // This one protects against a flash prime during loading screens                
                dword(0x4bfb38) == 1 && dword(dword(0x04c05ac) + 0x74) > 0 &&  (
                dword(0x4c5304) == 4 && trigger_when(dword(dword(0x04c05ac) + 0x74) - moneyInStyleShop(0x8) >= 500) && trigger_when(moneyInStyleShop(0x8) < prev(moneyInStyleShop(0x8))) ||
                dword(0x4c5304) == 3 && trigger_when(dword(dword(0x04c05ac) + 0x74) - moneyInStyleShop(0x20) >= 500) && trigger_when(moneyInStyleShop(0x20) < prev(moneyInStyleShop(0x20))) ||
                dword(0x4c5304) == 2 && trigger_when(dword(dword(0x04c05ac) + 0x74) - moneyInStyleShop(0x24) >= 500) && trigger_when(moneyInStyleShop(0x24) < prev(moneyInStyleShop(0x24))) ||
                dword(0x4c5304) == 1 && trigger_when(dword(dword(0x04c05ac) + 0x74) - moneyInStyleShop(0x34) >= 500) && trigger_when(moneyInStyleShop(0x34) < prev(moneyInStyleShop(0x34))))                
            )
                     
            
achievement(title="Completing the Housewarming Gifts",
            description="Spend 1,000 Simoleons in a single visit to the items shop",
            points=5,
            trigger= DidNotCheat() && InGame() && (dword(dword(0x4c4dec) + 0x1a4) == 0x533d5aaa &&                      
                     trigger_when((dword(dword(0x4c05ac) + 0x74) - dword(dword(dword(0x4c4de8) + 0x12c) + 0x78c)) >= 1000) && 
                     trigger_when(dword(dword(dword(0x4c4de8) + 0x12c) + 0x78c) < prev(dword(dword(dword(0x4c4de8) + 0x12c) + 0x78c)
            ))))
            
            

achievement(title="Garbage Collector",
            description="Find a Power Social item while dumpster diving",            
            points=2,
            trigger= DidNotCheat() && InGame()  && dword(dword(0x4c4dec) + 0x254) >= 1 && dword(dword(0x4c4dec) + 0x1a4) == 0x4e6f715 && 
                                      (dword(0x4c5304) == 4 && pickedUpPowerSocial(0x8) || dword(0x4c5304) == 3 && pickedUpPowerSocial(0x20) ||
                                       dword(0x4c5304) == 2 && pickedUpPowerSocial(0x24) || dword(0x4c5304) == 1 && pickedUpPowerSocial(0x34))
            )            
            
            
achievement(title="Snack Freeloader",
            description="Get a free meal from a vending machine",            
            points=2,
            trigger= DidNotCheat() && InGame()  && dword(dword(0x4c4dec) + 0x254) >= 1 && (dword(dword(0x4c4dec) + 0x1a4) == 0x447acb5e || dword(dword(0x4c4dec) + 0x1a4) == 0xc59cd0c7) && 
                                      disable_when(dword(dword(0x04c05ac) + 0x74) < prev(dword(dword(0x04c05ac) + 0x74)), until=dword(dword(0x4c4dec) + 0x254) == 0 || dword(dword(0x4c4dec) + 0x254) == prev(dword(dword(0x4c4dec) + 0x254)) - 1) &&
                                      float(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0xc4) > prev(float(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0xc4))
                                      
            )               

achievement(title="Can I Have a Matching Case?",
            description="Pick a custom skin and ringtone for your XAM",
            points=1,
            trigger= DidNotCheat() && InGame()  && (dword(0x4d8a8c) != 0 && dword(0x4d8ad4) != 0x457536c3) && 
                (prev(dword(0x4d8a8c)) == 0 && prev(dword(0x4d8ad4)) != 0x457536c3 || 
                 prev(dword(0x4d8ad4)) == 0x457536c3 && prev(dword(0x4d8a8c)) != 0)
            )
                            
                             
achievement(title="King of the World",
            description="Complete all goals in the game",
            points=25,
            type="win_condition",
            trigger= DidNotCheat() && InGame()  && (measured(allGoals(0x8) == 93, when=dword(0x4c5304) == 4) && prev(allGoals(0x8)) == 92 ||
                       measured(allGoals(0x20) == 93, when=dword(0x4c5304) == 3) && prev(allGoals(0x20)) == 92 ||
                       measured(allGoals(0x24) == 93, when=dword(0x4c5304) == 2) && prev(allGoals(0x24)) == 92 ||
                       measured(allGoals(0x34) == 93, when=dword(0x4c5304) == 1) && prev(allGoals(0x34)) == 92)
            )

achievement(title="The Level with the Molten Buckets",
            description="Complete all goals in The Foundry",
            points=10,
            type="progression",
            trigger= DidNotCheat() && InGame()  && (dword(0x4c5304) == 4 && prev(achievedFoundryGoals(0x8)) == 8 && achievedFoundryGoals(0x8) == 9 ||
                      dword(0x4c5304) == 3 && prev(achievedFoundryGoals(0x20)) == 8 && achievedFoundryGoals(0x20) == 9 ||
                      dword(0x4c5304) == 2 && prev(achievedFoundryGoals(0x24)) == 8 && achievedFoundryGoals(0x24) == 9 ||
                      dword(0x4c5304) == 1 && prev(achievedFoundryGoals(0x34)) == 8 && achievedFoundryGoals(0x34) == 9)
            )
            
achievement(title="Rooftop Sunbathing",
            description="Complete all goals in Skyline Beach",
            points=10,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && prev(achievedSkylineBeachGoals(0x8)) == 9 && achievedSkylineBeachGoals(0x8) == 10 ||
                      dword(0x4c5304) == 3 && prev(achievedSkylineBeachGoals(0x20)) == 9 && achievedSkylineBeachGoals(0x20) == 10 ||
                      dword(0x4c5304) == 2 && prev(achievedSkylineBeachGoals(0x24)) == 9 && achievedSkylineBeachGoals(0x24) == 10 ||
                      dword(0x4c5304) == 1 && prev(achievedSkylineBeachGoals(0x34)) == 9 && achievedSkylineBeachGoals(0x34) == 10)
            )

achievement(title="Biker Gang Member",
            description="Complete all goals in Gasoline Row",
            points=10,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && prev(achievedGasolineRowGoals(0x8)) == 9 && achievedGasolineRowGoals(0x8) == 10 ||
                      dword(0x4c5304) == 3 && prev(achievedGasolineRowGoals(0x20)) == 9 && achievedGasolineRowGoals(0x20) == 10 ||
                      dword(0x4c5304) == 2 && prev(achievedGasolineRowGoals(0x24)) == 9 && achievedGasolineRowGoals(0x24) == 10 ||
                      dword(0x4c5304) == 1 && prev(achievedGasolineRowGoals(0x34)) == 9 && achievedGasolineRowGoals(0x34) == 10)
            )
            
achievement(title="Life Among the Mole People",
            description="Complete all goals in Central Station",
            points=10,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && prev(achievedCentralStationGoals(0x8)) == 9 && achievedCentralStationGoals(0x8) == 10 ||
                      dword(0x4c5304) == 3 && prev(achievedCentralStationGoals(0x20)) == 9 && achievedCentralStationGoals(0x20) == 10 ||
                      dword(0x4c5304) == 2 && prev(achievedCentralStationGoals(0x24)) == 9 && achievedCentralStationGoals(0x24) == 10 ||
                      dword(0x4c5304) == 1 && prev(achievedCentralStationGoals(0x34)) == 9 && achievedCentralStationGoals(0x34) == 10)
            )
            
achievement(title="Skatepark Ranger",
            description="Complete all goals in Kicktail Park",
            points=10,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && prev(achievedKicktailParkGoals(0x8)) == 10 && achievedKicktailParkGoals(0x8) == 11 ||
                      dword(0x4c5304) == 3 && prev(achievedKicktailParkGoals(0x20)) == 10 && achievedKicktailParkGoals(0x20) == 11 ||
                      dword(0x4c5304) == 2 && prev(achievedKicktailParkGoals(0x24)) == 10 && achievedKicktailParkGoals(0x24) == 11 ||
                      dword(0x4c5304) == 1 && prev(achievedKicktailParkGoals(0x34)) == 10 && achievedKicktailParkGoals(0x34) == 11)
            )
            
achievement(title="Getting Down in Chinatown",
            description="Complete all goals in Neon East",
            points=10,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && prev(achievedNeonEastGoals(0x8)) == 10 && achievedNeonEastGoals(0x8) == 11 ||
                      dword(0x4c5304) == 3 && prev(achievedNeonEastGoals(0x20)) == 10 && achievedNeonEastGoals(0x20) == 11 ||
                      dword(0x4c5304) == 2 && prev(achievedNeonEastGoals(0x24)) == 10 && achievedNeonEastGoals(0x24) == 11 ||
                      dword(0x4c5304) == 1 && prev(achievedNeonEastGoals(0x34)) == 10 && achievedNeonEastGoals(0x34) == 11)
            )
            
achievement(title="Posh Life Enthusiast",
            description="Complete all goals in Cozmo Street",
            points=10,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && prev(achievedCozmoStreetGoals(0x8)) == 9 && achievedCozmoStreetGoals(0x8) == 10 ||
                      dword(0x4c5304) == 3 && prev(achievedCozmoStreetGoals(0x20)) == 9 && achievedCozmoStreetGoals(0x20) == 10 ||
                      dword(0x4c5304) == 2 && prev(achievedCozmoStreetGoals(0x24)) == 9 && achievedCozmoStreetGoals(0x24) == 10 ||
                      dword(0x4c5304) == 1 && prev(achievedCozmoStreetGoals(0x34)) == 9 && achievedCozmoStreetGoals(0x34) == 10)
            )
            
achievement(title="A District Worth Its Weight in Gold",
            description="Complete all goals in Diamond Heights",
            points=10,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && prev(achievedDiamondHeightsGoals(0x8)) == 9 && achievedDiamondHeightsGoals(0x8) == 10 ||
                      dword(0x4c5304) == 3 && prev(achievedDiamondHeightsGoals(0x20)) == 9 && achievedDiamondHeightsGoals(0x20) == 10 ||
                      dword(0x4c5304) == 2 && prev(achievedDiamondHeightsGoals(0x24)) == 9 && achievedDiamondHeightsGoals(0x24) == 10 ||
                      dword(0x4c5304) == 1 && prev(achievedDiamondHeightsGoals(0x34)) == 9 && achievedDiamondHeightsGoals(0x34) == 10)
            )
            
achievement(title="Isn't It Technically a Pier?",
            description="Complete all goals in South Side Bridge",
            points=10,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && prev(achievedSouthSideBridgeGoals(0x8)) == 8 && achievedSouthSideBridgeGoals(0x8) == 9 ||
                      dword(0x4c5304) == 3 && prev(achievedSouthSideBridgeGoals(0x20)) == 8 && achievedSouthSideBridgeGoals(0x20) == 9 ||
                      dword(0x4c5304) == 2 && prev(achievedSouthSideBridgeGoals(0x24)) == 8 && achievedSouthSideBridgeGoals(0x24) == 9 ||
                      dword(0x4c5304) == 1 && prev(achievedSouthSideBridgeGoals(0x34)) == 8 && achievedSouthSideBridgeGoals(0x34) == 9)
            )          
                          

achievement(title="Great Greeter",
            description="Unlock all 13 \"Greet\" social moves",
            points=5,
            trigger= DidNotCheat() && InGame()  && (prev(UnlockedGreetSocials(0x8)) == 12 && measured(UnlockedGreetSocials(0x8) == 13, when=dword(0x4c5304) == 4) ||
                      prev(UnlockedGreetSocials(0x20)) == 12 && measured(UnlockedGreetSocials(0x20) == 13, when=dword(0x4c5304) == 3) ||
                      prev(UnlockedGreetSocials(0x24)) == 12 && measured(UnlockedGreetSocials(0x24) == 13, when=dword(0x4c5304) == 2) ||
                      prev(UnlockedGreetSocials(0x34)) == 12 && measured(UnlockedGreetSocials(0x34) == 13, when=dword(0x4c5304) == 1))
            )
            
achievement(title="Outgoing Citizen",
            description="Unlock all 15 \"Act Friendly\" social moves",
            points=5,
            trigger= DidNotCheat() && InGame()  && (prev(UnlockedFriendlySocials(0x8)) == 14 && measured(UnlockedFriendlySocials(0x8) == 15, when=dword(0x4c5304) == 4) ||
                      prev(UnlockedFriendlySocials(0x20)) == 14 && measured(UnlockedFriendlySocials(0x20) == 15, when=dword(0x4c5304) == 3) ||
                      prev(UnlockedFriendlySocials(0x24)) == 14 && measured(UnlockedFriendlySocials(0x24) == 15, when=dword(0x4c5304) == 2) ||
                      prev(UnlockedFriendlySocials(0x34)) == 14 && measured(UnlockedFriendlySocials(0x34) == 15, when=dword(0x4c5304) == 1))
            )
            
achievement(title="Public Enemy",
            description="Unlock all 12 \"Act Mean\" social moves",
            points=5,
            trigger= DidNotCheat() && InGame()  && (prev(UnlockedMeanSocials(0x8)) == 11 && measured(UnlockedMeanSocials(0x8) == 12, when=dword(0x4c5304) == 4) ||
                      prev(UnlockedMeanSocials(0x20)) == 11 && measured(UnlockedMeanSocials(0x20) == 12, when=dword(0x4c5304) == 3) ||
                      prev(UnlockedMeanSocials(0x24)) == 11 && measured(UnlockedMeanSocials(0x24) == 12, when=dword(0x4c5304) == 2) ||
                      prev(UnlockedMeanSocials(0x34)) == 11 && measured(UnlockedMeanSocials(0x34) == 12, when=dword(0x4c5304) == 1))
            )            
           
achievement(title="Dirty Romantic",
            description="Unlock all 10 \"Act Romantic\" social moves",
            points=5,
            trigger= DidNotCheat() && InGame()  && (prev(UnlockedRomanticSocials(0x8)) == 9 && measured(UnlockedRomanticSocials(0x8) == 10, when=dword(0x4c5304) == 4) ||
                      prev(UnlockedRomanticSocials(0x20)) == 9 && measured(UnlockedRomanticSocials(0x20) == 10, when=dword(0x4c5304) == 3) ||
                      prev(UnlockedRomanticSocials(0x24)) == 9 && measured(UnlockedRomanticSocials(0x24) == 10, when=dword(0x4c5304) == 2) ||
                      prev(UnlockedRomanticSocials(0x34)) == 9 && measured(UnlockedRomanticSocials(0x34) == 10, when=dword(0x4c5304) == 1))
            )           

achievement(title="Caring Pet Owner",
            description="Feed a pet",
            points=1,
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x18E6) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x18E6)) ||
                                  dword(0x4c5304) == 3 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x18E6) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x18E6)) ||
                                  dword(0x4c5304) == 2 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x18E6) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x18E6)) ||
                                  dword(0x4c5304) == 1 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x18E6) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x18E6)))
            )
            
achievement(title="Casanova",
            description="Be part of at least 5 romances",
            points=5,
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x18F0) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x18F0)) &&
                                     word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x18F0) >= 5 ||
                                  dword(0x4c5304) == 3 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x18F0) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x18F0)) &&
                                     word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x18F0) >= 5 ||
                                  dword(0x4c5304) == 2 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x18F0) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x18F0)) &&
                                     word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x18F0) >= 5 ||
                                  dword(0x4c5304) == 1 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x18F0) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x18F0)) &&
                                     word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x18F0) >= 5)
            )      
            
achievement(title="Can't Please Everyone",
            description="Make at least 3 enemies",
            points=2,
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x18F4) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x18F4)) &&
                                     word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x18F4) >= 3 ||
                                  dword(0x4c5304) == 3 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x18F4) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x18F4)) &&
                                     word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x18F4) >= 3 ||
                                  dword(0x4c5304) == 2 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x18F4) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x18F4)) &&
                                     word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x18F4) >= 3 ||
                                  dword(0x4c5304) == 1 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x18F4) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x18F4)) &&
                                     word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x18F4) >= 3)
            )        
            
achievement(title="Redemption",
            description="Make amends with an enemy and repair your relationship",
            points=2,
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x18F6) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x18F6)) ||
                                  dword(0x4c5304) == 3 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x18F6) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x18F6)) ||
                                  dword(0x4c5304) == 2 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x18F6) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x18F6)) ||
                                  dword(0x4c5304) == 1 && word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x18F6) > prev(word(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x18F6)))
            )               
            
achievement(title="One Down, Eight to Go",
            description="Emerge victorious from a villain encounter",
            points=5,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && villainJustBeaten(0x8) ||
                                  dword(0x4c5304) == 3 && villainJustBeaten(0x20) ||
                                  dword(0x4c5304) == 2 && villainJustBeaten(0x24) ||
                                  dword(0x4c5304) == 1 && villainJustBeaten(0x34))
            )

achievement(title="Your Basic Disney Hero",
            description="Emerge victorious from all villain encounters and unlock Darius' Penthouse",
            points=10,
            type="progression",
            trigger= DidNotCheat() && InGame()  && (measured(villainsBeaten(0x8) == 9, when=dword(0x4c5304) == 4) && prev(villainsBeaten(0x8)) == 8 ||
                      measured(villainsBeaten(0x20) == 9, when=dword(0x4c5304) == 3) && prev(villainsBeaten(0x20)) == 8 ||
                      measured(villainsBeaten(0x24) == 9, when=dword(0x4c5304) == 2) && prev(villainsBeaten(0x24)) == 8 ||
                      measured(villainsBeaten(0x34) == 9, when=dword(0x4c5304) == 1) && prev(villainsBeaten(0x34)) == 8 )
            )

achievement(title="Got to Pay for This Lifestyle", 
            description="Earn your first paycheck",
            points=1,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && firstLevelJobUnlock(0x8) ||
                                  dword(0x4c5304) == 3 && firstLevelJobUnlock(0x20) ||
                                  dword(0x4c5304) == 2 && firstLevelJobUnlock(0x24) ||
                                  dword(0x4c5304) == 1 && firstLevelJobUnlock(0x34)))

achievement(title="Wildlife Preservation", 
            description="Unlock all three pets",
            type="progression",
            points=3,
            trigger= DidNotCheat() && InGame()  && (measured(UnlockedPets(0x8) == 3, when=dword(0x4c5304) == 4) && prev(UnlockedPets(0x8)) == 2 ||
                     measured(UnlockedPets(0x20) == 3, when=dword(0x4c5304) == 3) && prev(UnlockedPets(0x20)) == 2 ||
                     measured(UnlockedPets(0x24) == 3, when=dword(0x4c5304) == 2) && prev(UnlockedPets(0x24)) == 2 ||
                     measured(UnlockedPets(0x34) == 3, when=dword(0x4c5304) == 1) && prev(UnlockedPets(0x34)) == 2)
)

achievement(title="Tony Who?",
            description="Beat the Pro Skater Job",
            points=5,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x190f)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x190f)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x190f)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit4(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x190f)))
            )
            

achievement(title="Zoo Tycoon",
            description="Beat the Ferret Master Job",
            points=5,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x190f)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x190f)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x190f)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x190f)))
            )
            

achievement(title="I Used the Same Oil for Both",
            description="Beat the Chop Shop Master Job",
            points=5,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x190e)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x190e)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x190e)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit5(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x190e)))
            )
            

achievement(title="Knockoff Cartier",
            description="Beat the Master Piercer Job",
            points=5,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x1912)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x1912)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x1912)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x1912)))
            )

achievement(title="Better than Auguste Rodin",
            description="Beat the Master Sculptor Job",
            points=5,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x1910)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x1910)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x1910)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit1(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x1910)))
            )            
            

achievement(title="Impressing Gordon Ramsay",
            description="Beat the Master Chef Job",
            points=5,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x1910)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x1910)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x1910)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit6(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x1910)))
            )
            

achievement(title="King of Cocktails",
            description="Beat the Mixmaster Job",
            points=5,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x1911)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x1911)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x1911)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x1911)))
            )
            

achievement(title="I've Always Wanted a Better View",
            description="Unlock Blankwood Towers",
            points=5,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x192d)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x192d)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x192d)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit2(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x192d)))
            )
            

achievement(title="This Apartment? It Pays for Itself!",
            description="Use the secret machine in Darius' Penthouse",
            points=1,
            trigger= DidNotCheat() && InGame() && dword(dword(0x4c4dec) + 0x1a4) == 0xade69f3d && dword(dword(0x4c05ac) + 0x74) > prev(dword(dword(0x4c05ac) + 0x74)))
            

achievement(title="Upstaging the Big Six",
            description="Beat the Super Model Job",
            points=5,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x1911)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x1911)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x1911)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit7(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x1911)))
            )
            
            

achievement(title="Ready for the Fourth of July",
            description="Beat the Master Pyro Job",
            points=5,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && ZeroToOne(bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x8) + 0x191d)) ||
                                  dword(0x4c5304) == 3 && ZeroToOne(bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x20) + 0x191d)) ||
                                  dword(0x4c5304) == 2 && ZeroToOne(bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x24) + 0x191d)) ||
                                  dword(0x4c5304) == 1 && ZeroToOne(bit3(dword(dword(dword(0x4c05b4) + 0x1c0) + 0x34) + 0x191d)))
            )    
      

achievement(title="Branching Out",
            description="Unlock four additional districts",
            points=5,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && prev(UnlockedDistricts(0x8)) == 4 && UnlockedDistricts(0x8) == 5 ||
                                  dword(0x4c5304) == 3 && prev(UnlockedDistricts(0x20)) == 4 && UnlockedDistricts(0x20) == 5 ||
                                  dword(0x4c5304) == 2 && prev(UnlockedDistricts(0x24)) == 4 && UnlockedDistricts(0x24) == 5 ||
                                  dword(0x4c5304) == 1 && prev(UnlockedDistricts(0x34)) == 4 && UnlockedDistricts(0x34) == 5)
            )   
            

achievement(title="City Mapper",
            description="Unlock all districts",
            points=10,
            type="progression",
            trigger= DidNotCheat() && InGame() && (dword(0x4c5304) == 4 && prev(UnlockedDistricts(0x8)) == 8 && UnlockedDistricts(0x8) == 9 ||
                                  dword(0x4c5304) == 3 && prev(UnlockedDistricts(0x20)) == 8 && UnlockedDistricts(0x20) == 9 ||
                                  dword(0x4c5304) == 2 && prev(UnlockedDistricts(0x24)) == 8 && UnlockedDistricts(0x24) == 9 ||
                                  dword(0x4c5304) == 1 && prev(UnlockedDistricts(0x34)) == 8 && UnlockedDistricts(0x34) == 9)
            )        
            
            
achievement(title="Money on My Mind",
            description="Make 25,000 Simoleons",
            points=5,
            trigger= DidNotCheat() && InGame()  && dword(dword(0x4c05ac) + 0x74) >= 25000 && prev(dword(dword(0x4c05ac) + 0x74)) >= 20000 && prev(dword(dword(0x4c05ac) + 0x74)) < 25000
            )                 
            
function HappyUrb(){
    start = once(InGame() && word(dword(0x4c05ac) + 0x14) == 0 && word(dword(0x4c05ac) + 0x1e) == 1 && prev(word(dword(0x4c05ac) + 0x14)) == 0 && prev(word(dword(0x4c05ac) + 0x1e)) == 0)
    cancel = never(dword(0x4c50a8) != 0 && float(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0xbc) <= 0.0 ||                    
                   dword(0x4c50a8) != 0 && float(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0xc4) <= 0.0 ||
                   dword(0x4c50a8) != 0 && float(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0xc8) <= 0.0 || 
                   dword(0x4c50a8) != 0 && float(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0xcc) <= 0.0 || 
                   dword(0x4c50a8) != 0 && float(dword(dword(dword(0x4c50a8) + 0x8) + 0x4) + 0xe4) <= 0.0 ||
                   InMainMenu()
    )                                        
    submit = trigger_when(word(dword(0x4c05ac) + 0x14) == 0 && word(dword(0x4c05ac) + 0x1e) == 0 && prev(word(dword(0x4c05ac) + 0x14)) == 0x17 && prev(word(dword(0x4c05ac) + 0x1e) == 0x3b))
    return start && cancel && submit            
}
                 
achievement(title="Happy Urb",
            description="Starting from midnight of any day and without switching controlled Urbz, keep each of your Urb's needs above 50% over an entire 24 hour span",
            points=10,
            trigger= DidNotCheat() && HappyUrb()
            )            
           
         
         
// TODO: make a leaderboard for least simulation days to game completion

trigger= DidNotCheat() && (prev(allGoals(0x8)) == 92 && measured(allGoals(0x8) == 93, when=dword(0x4c5304) == 4) ||
                       prev(allGoals(0x20)) == 92 && measured(allGoals(0x20) == 93, when=dword(0x4c5304) == 3) ||
                       prev(allGoals(0x24)) == 92 && measured(allGoals(0x24) == 93, when=dword(0x4c5304) == 2) ||
                       prev(allGoals(0x34)) == 92 && measured(allGoals(0x34) == 93, when=dword(0x4c5304) == 1))


// Dev achievements to follow/debug triggers

achievement(title="InMainMenuTest",
            description="",
            points=0,
            trigger= InMainMenu()
            )            
           