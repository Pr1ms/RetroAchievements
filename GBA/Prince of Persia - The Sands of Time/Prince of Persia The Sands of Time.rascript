// Prince of Persia: The Sands of Time
// #ID = 4693

0xH001053=1_I:0xX000fc0&16777215_0xH000064=1_I:0xX000fc0&16777215_0xH000065=16_I:0xX000fc0&16777215_0xN0000d2>d0xN0000d2

// Common Utils
function ZeroToOne(bit)  => bit > prev(bit)

// GBA Specific Utils
function IWRamToRA(pointerValue) => dword(pointerValue) & 0xffffff
function EWRamToRA(pointerValue) => dword(pointerValue) & 0xffffff + 0x8000

// Pointers
gameMemoryPointer = IWRamToRA(0x0fc0)
controlledCharacterMemoryPointer = IWRamToRA(0x101c)
pointerListPointer = IWRamToRA(0x1028)

// Game-Specific Utils

// Returns the n-th pointer of the pointerList
function pointerAt(n) => IWRamToRA(pointerListPointer + n * 0x4)

function RoomMatches(sectionId, roomId) => byte(gameMemoryPointer + 0x64) == sectionId && 
                                           byte(gameMemoryPointer + 0x65) == roomId 
function CurrentlyPlaying() => byte(0x1053) == 1
function AbsorbedPersians() => bitcount(gameMemoryPointer + 0x90) + bitcount(gameMemoryPointer + 0x91) + 
                               bitcount(gameMemoryPointer + 0x92) + bitcount(gameMemoryPointer + 0x93) + 
                               bitcount(gameMemoryPointer + 0x94) + bitcount(gameMemoryPointer + 0x95) + 
                               bitcount(gameMemoryPointer + 0x96) + bitcount(gameMemoryPointer + 0x97) + 
                               bitcount(gameMemoryPointer + 0x98) + bitcount(gameMemoryPointer + 0x99)

function PickedUpConsumables() => bitcount(gameMemoryPointer + 0xAE) + bitcount(gameMemoryPointer + 0xAF) + 
                                  bitcount(gameMemoryPointer + 0xB0) - bit7(gameMemoryPointer + 0xB0)
                                  
function PressedGCSwitches() => bit2(gameMemoryPointer + 0xd6) + bit3(gameMemoryPointer + 0xd6) + bit4(gameMemoryPointer + 0xd6)           
                                                       
function InMainMenu() => byte(0x0f21) == 0 || (byte(0x0f21) == 2 && byte(0x0f25) == 0)

function GameOver() => byte(0x35b2) == 26                              

function PowerUpInvisible() => RoomMatches(0x00, 0x12) && word(pointerAt(3) + 0x3c) == word(pointerAt(3) + 0x3e) && 
                               prev(word(pointerAt(3) + 0x3c)) < word(pointerAt(3) + 0x3e) || 
                               (RoomMatches(0x02, 0x01) || RoomMatches(0x04, 0x0b)) && word(pointerAt(1) + 0x3c) == word(pointerAt(1) + 0x3e) &&
                               prev(word(pointerAt(1) + 0x3c)) < word(pointerAt(1) + 0x3e)
                          
function PowerUpMusic() => RoomMatches(0x03, 0x15) && word(pointerAt(3) + 0x3c) == word(pointerAt(3) + 0x3e) &&
                           prev(word(pointerAt(3) + 0x3c)) < word(pointerAt(3) + 0x3e) ||
                           RoomMatches(0x04, 0x03) && word(pointerAt(1) + 0x3c) == word(pointerAt(1) + 0x3e) &&
                           prev(word(pointerAt(1) + 0x3c)) < word(pointerAt(1) + 0x3e)

function LifeFountainVisited() => bit4(gameMemoryPointer + 0x9a) + bit5(gameMemoryPointer + 0x9c) + bit1(gameMemoryPointer + 0x9f) + bit5(gameMemoryPointer + 0x9f) +
                                  bit6(gameMemoryPointer + 0xa0) + bit2(gameMemoryPointer + 0xa3) + bit3(gameMemoryPointer + 0xa4) + bit6(gameMemoryPointer + 0xa4) +
                                  bit6(gameMemoryPointer + 0xaa)
                                  
function Game1TurnedSPD() => once(byte(0xfd0) == 0x53 && byte(0xfd1) == 0x50 && byte(0xfd2) == 0x44 && prev(byte(0xfd2) != 0x44) && never(byte(0xfd2) != 0x44)) 
function Game2TurnedSPD() => once(byte(0xfd8) == 0x53 && byte(0xfd9) == 0x50 && byte(0xfda) == 0x44 && prev(byte(0xfda) != 0x44) && never(byte(0xfda) != 0x44))
function Game3TurnedSPD() => once(byte(0xfe0) == 0x53 && byte(0xfe1) == 0x50 && byte(0xfe2) == 0x44 && prev(byte(0xfe2) != 0x44) && never(byte(0xfe2) != 0x44))

function CurrentAnimation() => byte(controlledCharacterMemoryPointer + 0x21)                       
                               
function PlayerLevel(){
    levelByte1 = gameMemoryPointer + 0xd7
    levelByte2 = gameMemoryPointer + 0xd8
    return 1 + bit5(levelByte1) + 2 * bit6(levelByte1) + 4 * bit7(levelByte1) + 8 * bit0(levelByte2) + 16 * bit1(levelByte2)
}

//
// Achievements
//

// Progress & Win
function BeatFinalBoss()
{
    start = once(RoomMatches(0x05, 0x03) && prev(byte(gameMemoryPointer + 0x65)) != 0x03) 
    cancel = never(!RoomMatches(0x05, 0x3)) && never(byte(0x0f21) == 0)
    goal = word(pointerAt(1) + 0x78) == 0 && byte(0x0f21) == 2 && prev(byte(0x0f21)) != 2
    
    return start && cancel && goal
}

achievement(
    title="Hop, Hop!",
    points=10,
    type="progression",
    description="Finish the first Sand Griffin encounter and acquire the Scroll of Air Jump",
    trigger = CurrentlyPlaying() && RoomMatches(0x00, 0x19) && ZeroToOne(bit0(gameMemoryPointer + 0xc2))   
)

achievement(
    title="You Are Not Alone", 
    points=2, 
    type="progression",
    description = "Play as Farah",
    trigger = CurrentlyPlaying() && ZeroToOne(bit0(gameMemoryPointer + 0x5c))
)

achievement(
    title="Did You Eat That?",
    points=10,
    type="progression",
    description="Finish the second Sand Griffin encounter and acquire the Scroll of Absorbtion",
    trigger = CurrentlyPlaying() && RoomMatches(0x01, 0x19) && ZeroToOne(bit2(gameMemoryPointer + 0xc3)) 
)

achievement(
    title="Why Couldn't I Do This Before?",
    points=10,
    type="progression",
    description="Finish the third Sand Griffin encounter and acquire the Scroll of Walling",
    trigger = CurrentlyPlaying() && RoomMatches(0x02, 0x19) && ZeroToOne(bit3(gameMemoryPointer + 0xc2))
)

achievement(
    title="Parkour",
    points=10,
    type="progression",
    description="Kill the Sand Griffin and acquire the Scroll of Rebound",
    trigger = CurrentlyPlaying() && RoomMatches(0x03, 0x19) && ZeroToOne(bit4(gameMemoryPointer + 0xc2))
)

achievement(
    title="Now I'm Furious!",
    points=10,
    type="progression",
    description="Finish the Vizier's first fight and acquire the Scroll of Fury",
    trigger = CurrentlyPlaying() && RoomMatches(0x04, 0x19) && ZeroToOne(bit5(gameMemoryPointer + 0xc2))
)

achievement(
    title="Master of Time",
    points=25,
    type="win_condition",
    description="Finish the Vizier's final fight and finish the game",
    trigger = BeatFinalBoss()    
)


// Side-quest / optionnal
achievement(
    title="Not so Fast!", 
    points=2, 
    description = "Acquire the Slow-Down Ring",
    trigger = CurrentlyPlaying() && RoomMatches(0x01, 0x10) && ZeroToOne(bit1(gameMemoryPointer + 0xd2))
)

achievement(
    title="Freeze!", 
    points=2, 
    description = "Acquire the Freeze Ring",
    trigger = CurrentlyPlaying() && RoomMatches(0x02, 0x08) && ZeroToOne(bit0(gameMemoryPointer + 0xd2))
)

achievement(
    title="I'd Rather Have a Cloak",
    points=2, 
    description = "Become invisible",
    trigger = CurrentlyPlaying() && PowerUpInvisible()
)

achievement(
    title="The Power of Music",
    points=2, 
    description = "Have music notes change your environment's behavior",
    trigger = CurrentlyPlaying() && PowerUpMusic()
)

achievement(
    title="Getting Stronger", 
    points=10, 
    description = "Kill and absorb 35 Sand Persians",
    trigger = CurrentlyPlaying() && AbsorbedPersians() >= 35 && prev(AbsorbedPersians()) < 35
)

achievement(
    title="Maxed Out", 
    points=25, 
    description = "Kill and absorb all 75 Sand Persians to maximize your stats",
    trigger = CurrentlyPlaying() && AbsorbedPersians() == 75 && prev(AbsorbedPersians()) == 74
)

achievement(
    title="Who Even Remembers Linking?", 
    points=5, 
    description = "Press all three GameCube Switches",
    trigger = unless(InMainMenu()) && CurrentlyPlaying() && 
              measured(PressedGCSwitches() == 3) && prev(PressedGCSwitches()) == 2
)

achievement(
    title="That Might Come in Handy",
    points=2,
    description="Acquire a life potion",
    trigger = CurrentlyPlaying() && (RoomMatches(0x00, 0x03) && ZeroToOne(bit0(gameMemoryPointer + 0xae)) ||
                                     RoomMatches(0x00, 0x16) && ZeroToOne(bit1(gameMemoryPointer + 0xae)) ||
                                     RoomMatches(0x01, 0x01) && ZeroToOne(bit2(gameMemoryPointer + 0xae)) ||
                                     RoomMatches(0x01, 0x10) && ZeroToOne(bit3(gameMemoryPointer + 0xae)) ||
                                     RoomMatches(0x02, 0x02) && ZeroToOne(bit4(gameMemoryPointer + 0xae)) ||
                                     RoomMatches(0x02, 0x12) && ZeroToOne(bit5(gameMemoryPointer + 0xae)) ||
                                     RoomMatches(0x03, 0x02) && ZeroToOne(bit6(gameMemoryPointer + 0xae)) ||
                                     RoomMatches(0x03, 0x0f) && ZeroToOne(bit7(gameMemoryPointer + 0xae)) ||
                                     RoomMatches(0x04, 0x12) && ZeroToOne(bit0(gameMemoryPointer + 0xaf)))    
)

achievement(
    title="Better than a Pocket Watch",
    points=2,
    description="Acquire a bag of sand",
    trigger = CurrentlyPlaying() && (RoomMatches(0x00, 0x0f) && ZeroToOne(bit1(gameMemoryPointer + 0xaf)) ||
                                     RoomMatches(0x00, 0x17) && ZeroToOne(bit2(gameMemoryPointer + 0xaf)) ||
                                     RoomMatches(0x00, 0x0e) && ZeroToOne(bit3(gameMemoryPointer + 0xaf)) ||
                                     RoomMatches(0x01, 0x15) && ZeroToOne(bit4(gameMemoryPointer + 0xaf)) ||
                                     RoomMatches(0x02, 0x04) && ZeroToOne(bit5(gameMemoryPointer + 0xaf)) ||
                                     RoomMatches(0x02, 0x15) && ZeroToOne(bit6(gameMemoryPointer + 0xaf)) ||
                                     RoomMatches(0x03, 0x12) && ZeroToOne(bit7(gameMemoryPointer + 0xaf)) ||
                                     RoomMatches(0x03, 0x16) && ZeroToOne(bit0(gameMemoryPointer + 0xb0)) ||
                                     RoomMatches(0x04, 0x08) && ZeroToOne(bit1(gameMemoryPointer + 0xb0)) ||
                                     RoomMatches(0x02, 0x1b) && ZeroToOne(bit2(gameMemoryPointer + 0xb0)))    
)

achievement(
    title="No One Warned Me About Poison",
    points=2,
    description="Acquire an antidote",
    trigger = CurrentlyPlaying() && (RoomMatches(0x01, 0x03) && ZeroToOne(bit2(gameMemoryPointer + 0xb0)) ||
                                     RoomMatches(0x01, 0x12) && ZeroToOne(bit3(gameMemoryPointer + 0xb0)) ||
                                     RoomMatches(0x02, 0x0b) && ZeroToOne(bit4(gameMemoryPointer + 0xb0)) ||
                                     RoomMatches(0x03, 0x09) && ZeroToOne(bit5(gameMemoryPointer + 0xb0)) ||
                                     RoomMatches(0x04, 0x14) && ZeroToOne(bit6(gameMemoryPointer + 0xb0)))    
)

achievement(
    title="This Looks Broken",
    points=1,
    description="Pick up a Medal piece",
    trigger = CurrentlyPlaying() && (RoomMatches(0x00, 0x06) && ZeroToOne(bit0(gameMemoryPointer + 0x8d)) ||
                                     RoomMatches(0x00, 0x0a) && ZeroToOne(bit1(gameMemoryPointer + 0x8d)) ||
                                     RoomMatches(0x00, 0x13) && ZeroToOne(bit2(gameMemoryPointer + 0x8d)) ||
                                     RoomMatches(0x01, 0x07) && ZeroToOne(bit3(gameMemoryPointer + 0x8d)) ||
                                     RoomMatches(0x01, 0x14) && ZeroToOne(bit4(gameMemoryPointer + 0x8d)) ||
                                     RoomMatches(0x01, 0x13) && ZeroToOne(bit5(gameMemoryPointer + 0x8d)) ||
                                     RoomMatches(0x04, 0x02) && ZeroToOne(bit6(gameMemoryPointer + 0x8d)) ||
                                     RoomMatches(0x04, 0x04) && ZeroToOne(bit7(gameMemoryPointer + 0x8d)) ||
                                     RoomMatches(0x04, 0x0a) && ZeroToOne(bit0(gameMemoryPointer + 0x8e)) ||
                                     RoomMatches(0x04, 0x0c) && ZeroToOne(bit1(gameMemoryPointer + 0x8e)) ||
                                     RoomMatches(0x04, 0x0d) && ZeroToOne(bit2(gameMemoryPointer + 0x8e)) ||
                                     RoomMatches(0x04, 0x13) && ZeroToOne(bit3(gameMemoryPointer + 0x8e)) ||
                                     RoomMatches(0x02, 0x02) && ZeroToOne(bit4(gameMemoryPointer + 0x8e)) ||
                                     RoomMatches(0x02, 0x10) && ZeroToOne(bit5(gameMemoryPointer + 0x8e)) ||
                                     RoomMatches(0x02, 0x17) && ZeroToOne(bit6(gameMemoryPointer + 0x8e)) ||
                                     RoomMatches(0x02, 0x05) && ZeroToOne(bit7(gameMemoryPointer + 0x8e)) ||
                                     RoomMatches(0x02, 0x08) && ZeroToOne(bit0(gameMemoryPointer + 0x8f)) ||
                                     RoomMatches(0x02, 0x09) && ZeroToOne(bit1(gameMemoryPointer + 0x8f)) ||
                                     RoomMatches(0x03, 0x08) && ZeroToOne(bit2(gameMemoryPointer + 0x8f)) ||
                                     RoomMatches(0x03, 0x14) && ZeroToOne(bit3(gameMemoryPointer + 0x8f)) ||
                                     RoomMatches(0x03, 0x17) && ZeroToOne(bit4(gameMemoryPointer + 0x8f)) ||
                                     RoomMatches(0x03, 0x03) && ZeroToOne(bit5(gameMemoryPointer + 0x8f)) ||
                                     RoomMatches(0x03, 0x0e) && ZeroToOne(bit6(gameMemoryPointer + 0x8f)) ||
                                     RoomMatches(0x03, 0x0c) && ZeroToOne(bit7(gameMemoryPointer + 0x8f)))    
)

achievement(
    title="Want a Medal?",
    points=5,
    description="Reassemble a Medal",
    trigger = CurrentlyPlaying() && (bit0(gameMemoryPointer + 0x8d) + bit1(gameMemoryPointer + 0x8d) + bit2(gameMemoryPointer + 0x8d) == 3 && 
                                     prev(bit0(gameMemoryPointer + 0x8d)) + prev(bit1(gameMemoryPointer + 0x8d)) + prev(bit2(gameMemoryPointer + 0x8d)) == 2 ||
                                     
                                     bit3(gameMemoryPointer + 0x8d) + bit4(gameMemoryPointer + 0x8d) + bit5(gameMemoryPointer + 0x8d) == 3 && 
                                     prev(bit3(gameMemoryPointer + 0x8d)) + prev(bit4(gameMemoryPointer + 0x8d)) + prev(bit5(gameMemoryPointer + 0x8d)) == 2 ||
                                     
                                     bit6(gameMemoryPointer + 0x8d) + bit7(gameMemoryPointer + 0x8d) + bit0(gameMemoryPointer + 0x8e) == 3 && 
                                     prev(bit6(gameMemoryPointer + 0x8d)) + prev(bit7(gameMemoryPointer + 0x8d)) + prev(bit0(gameMemoryPointer + 0x8e)) == 2 ||
                                     
                                     bit1(gameMemoryPointer + 0x8e) + bit2(gameMemoryPointer + 0x8e) + bit3(gameMemoryPointer + 0x8e) == 3 && 
                                     prev(bit1(gameMemoryPointer + 0x8e)) + prev(bit2(gameMemoryPointer + 0x8e)) + prev(bit3(gameMemoryPointer + 0x8e)) == 2 ||
                                     
                                     bit4(gameMemoryPointer + 0x8e) + bit5(gameMemoryPointer + 0x8e) + bit6(gameMemoryPointer + 0x8e) == 3 && 
                                     prev(bit4(gameMemoryPointer + 0x8e)) + prev(bit5(gameMemoryPointer + 0x8e)) + prev(bit6(gameMemoryPointer + 0x8e)) == 2 ||
                                     
                                     bit7(gameMemoryPointer + 0x8e) + bit0(gameMemoryPointer + 0x8f) + bit1(gameMemoryPointer + 0x8f) == 3 && 
                                     prev(bit7(gameMemoryPointer + 0x8e)) + prev(bit0(gameMemoryPointer + 0x8f)) + prev(bit1(gameMemoryPointer + 0x8f)) == 2 ||
                                     
                                     bit2(gameMemoryPointer + 0x8f) + bit3(gameMemoryPointer + 0x8f) + bit4(gameMemoryPointer + 0x8f) == 3 && 
                                     prev(bit2(gameMemoryPointer + 0x8f)) + prev(bit3(gameMemoryPointer + 0x8f)) + prev(bit4(gameMemoryPointer + 0x8f)) == 2 ||
                                     
                                     bit5(gameMemoryPointer + 0x8f) + bit6(gameMemoryPointer + 0x8f) + bit7(gameMemoryPointer + 0x8f) == 3 && 
                                     prev(bit5(gameMemoryPointer + 0x8f)) + prev(bit6(gameMemoryPointer + 0x8f)) + prev(bit7(gameMemoryPointer + 0x8f)) == 2)
)

achievement(
    title="So... This Works Like a Key?",
    points=5,
    description="Lower a Medal Gate",
    trigger = CurrentlyPlaying() && (RoomMatches(0x00, 0x09) && ZeroToOne(bit0(gameMemoryPointer + 0xCB)) ||
                                     RoomMatches(0x00, 0x10) && ZeroToOne(bit1(gameMemoryPointer + 0xCB)) ||
                                     RoomMatches(0x01, 0x04) && ZeroToOne(bit2(gameMemoryPointer + 0xCB)) ||
                                     RoomMatches(0x02, 0x0c) && ZeroToOne(bit3(gameMemoryPointer + 0xCB)) ||
                                     RoomMatches(0x02, 0x11) && ZeroToOne(bit4(gameMemoryPointer + 0xCB)) ||
                                     RoomMatches(0x03, 0x0d) && ZeroToOne(bit5(gameMemoryPointer + 0xCB)) ||
                                     RoomMatches(0x03, 0x11) && ZeroToOne(bit6(gameMemoryPointer + 0xCB)) ||                     
                                     RoomMatches(0x04, 0x0e) && ZeroToOne(bit7(gameMemoryPointer + 0xCB)))    
)

achievement(
    title="No Time for Bling",
    points=25,
    type="missable",
    description="Finish the game without picking up the Slow-Down Ring or the Freeze Ring",
    trigger = BeatFinalBoss() && bit0(gameMemoryPointer + 0xd2) == 0 && bit1(gameMemoryPointer + 0xd2) == 0
)

// Collectibles

achievement(
    title="Knowledgeable",
    points=5,
    description = "Collect all 15 scrolls",
    trigger = CurrentlyPlaying() && byte(gameMemoryPointer + 0xc2) == 0xff && byte(gameMemoryPointer + 0xc3) == 0x7f && 
              (prev(bitcount(gameMemoryPointer + 0xc2)) == 8 && prev(bitcount(gameMemoryPointer + 0xc3)) == 6 || 
               prev(bitcount(gameMemoryPointer + 0xc2)) == 7 && prev(bitcount(gameMemoryPointer + 0xc3)) == 7)
)

achievement(
    title = "Pilgrimage", 
    points = 10,
    description = "Visit all 9 life fountains",
    trigger = unless(InMainMenu()) && CurrentlyPlaying() && 
              measured(LifeFountainVisited() == 9) && prev(LifeFountainVisited()) == 8
)

achievement(
    title="Decorated Officer",
    points=10,
    description = "Reassemble every Medal and lower every Medal Gate",
    trigger = unless(InMainMenu()) && CurrentlyPlaying() && 
              measured(bitcount(gameMemoryPointer + 0xcb) == 8) && prev(bitcount(gameMemoryPointer + 0xcb))== 7
)

achievement(
    title="All You Can Eat",
    points=10,
    description = "Pick up every consumable item",
    trigger = unless(InMainMenu()) && CurrentlyPlaying() && 
              measured(PickedUpConsumables() == 23) && prev(PickedUpConsumables()) == 22
)

// For fun / easter eggs
achievement(
    title="Those Are More Useful in 3D",
    points=2,
    description = "Receive healing from a life fountain",
    trigger = CurrentlyPlaying() && byte(gameMemoryPointer + 0x82) > prev(byte(gameMemoryPointer + 0x82)) 
    && never(low4(byte(gameMemoryPointer + 0xd0)) < prev(low4(byte(gameMemoryPointer + 0xd0))))
    && never(2 * bit1(byte(gameMemoryPointer + 0xd1)) + bit0(byte(gameMemoryPointer + 0xd1)) < 2 * prev(bit1(byte(gameMemoryPointer + 0xd1))) + prev(bit0(byte(gameMemoryPointer + 0xd1))))
    && (RoomMatches(0x00, 0x04) || RoomMatches(0x00, 0x15) || RoomMatches(0x01, 0x09) ||
        RoomMatches(0x01, 0x0d) || RoomMatches(0x01, 0x16) || RoomMatches(0x02, 0x0a) ||
        RoomMatches(0x02, 0x13) || RoomMatches(0x02, 0x16) || RoomMatches(0x04, 0x06))           
)

achievement(
    title = "That's Not How It Happened",
    points = 2,
    description="Reverse time to get back from an empty lifebar and live long enough to enjoy it",
    trigger = never(GameOver()) && unless(!CurrentlyPlaying() && !GameOver()) && 
              repeated(600, once(byte(gameMemoryPointer + 0x82) == 0) &&  byte(gameMemoryPointer + 0x82) > 0)
)

achievement(
    title = "Leader of the Five",
    points = 1,
    type="missable",
    description="Execute a moonwalk for 2 seconds straight",
    trigger = never(!CurrentlyPlaying()) && (
              repeated(120, CurrentAnimation() == 0x8e && never(CurrentAnimation() != 0x8e)) ||
              repeated(120, CurrentAnimation() == 0x8f && never(CurrentAnimation() != 0x8f)))
)

achievement(
    title = "Was That Intended Behavior?",
    points = 1,
    type="missable",
    description="Execute a looped auto-attack for 3 seconds straight",
    trigger = never(!CurrentlyPlaying()) && (
                    repeated(170, CurrentAnimation() == 0x1a && never(CurrentAnimation() != 0x1a && CurrentAnimation() != 0x56)) && 
                    repeated(10, CurrentAnimation() == 0x56 && never(CurrentAnimation() != 0x1a && CurrentAnimation() != 0x56)) ||
                    repeated(170, CurrentAnimation() == 0x1b && never(CurrentAnimation() != 0x1b && CurrentAnimation() != 0x57)) && 
                    repeated(10, CurrentAnimation() == 0x57 && never(CurrentAnimation() != 0x1b && CurrentAnimation() != 0x57)))
)

// Challenges

function PerfectFirstBoss()
{
    start = once(RoomMatches(0x00, 0x19) && prev(byte(gameMemoryPointer + 0x65)) != 0x19) && once(bit1(gameMemoryPointer + 0x9d) == 0)
    cancel = never(!RoomMatches(0x00, 0x19)) && never(InMainMenu()) && never(byte(gameMemoryPointer + 0x82) < prev(byte(gameMemoryPointer + 0x82)))
    submit = trigger_when(ZeroToOne(bit1(gameMemoryPointer + 0x9d)))
    return start && cancel && submit
}

function PerfectSecondBoss()
{
    start = once(RoomMatches(0x01, 0x19) && prev(byte(gameMemoryPointer + 0x65)) != 0x19) && once(bit1(gameMemoryPointer + 0xa1) == 0)
    cancel = never(!RoomMatches(0x01, 0x19)) && never(InMainMenu()) && never(byte(gameMemoryPointer + 0x82) < prev(byte(gameMemoryPointer + 0x82)))
    submit = trigger_when(ZeroToOne(bit1(gameMemoryPointer + 0xa1)))
    return start && cancel && submit
}

function PerfectThirdBoss()
{
    start = once(RoomMatches(0x02, 0x19) && prev(byte(gameMemoryPointer + 0x65)) != 0x19) && once(bit1(gameMemoryPointer + 0xa5) == 0)
    cancel = never(!RoomMatches(0x02, 0x19)) && never(InMainMenu()) && never(byte(gameMemoryPointer + 0x82) < prev(byte(gameMemoryPointer + 0x82)))
    submit = trigger_when(ZeroToOne(bit1(gameMemoryPointer + 0xa5)))
    return start && cancel && submit
}

function PerfectFourthBoss()
{
    start = once(RoomMatches(0x03, 0x19) && prev(byte(gameMemoryPointer + 0x65)) != 0x19) && once(bit1(gameMemoryPointer + 0xa9) == 0)
    cancel = never(!RoomMatches(0x03, 0x19)) && never(InMainMenu()) && never(byte(gameMemoryPointer + 0x82) < prev(byte(gameMemoryPointer + 0x82)))
    submit = trigger_when(ZeroToOne(bit1(gameMemoryPointer + 0xa9)))
    return start && cancel && submit
}

function PerfectFifthBoss()
{
    start = once(RoomMatches(0x04, 0x19) && prev(byte(gameMemoryPointer + 0x65)) != 0x19) && once(bit5(gameMemoryPointer + 0xc2) == 0)
    cancel = never(!RoomMatches(0x04, 0x19)) && never(InMainMenu()) && never(byte(gameMemoryPointer + 0x82) < prev(byte(gameMemoryPointer + 0x82)))
    submit = trigger_when(ZeroToOne(bit5(gameMemoryPointer + 0xc2)))
    return start && cancel && submit
}

function PerfectFinalBoss()
{
    start = once(RoomMatches(0x05, 0x03) && prev(byte(gameMemoryPointer + 0x65)) != 0x03) 
    cancel = never(!RoomMatches(0x05, 0x03)) && never(InMainMenu()) && never(byte(gameMemoryPointer + 0x82) < prev(byte(gameMemoryPointer + 0x82)))
    submit = trigger_when(word(pointerAt(1) + 0x78) == 0 && byte(0x0f21) == 2 && prev(byte(0x0f21)) != 2)    
    return start && cancel && submit
}

achievement(
    title = "Rock and Roll", 
    points = 25,
    type="missable",
    description = "Finish the first Sand Griffin encounter without taking damage",
    trigger = PerfectFirstBoss()
)

achievement(
    title = "Ride the Lightning", 
    points = 25,
    type="missable",
    description = "Finish the second Sand Griffin encounter without taking damage",
    trigger = PerfectSecondBoss()
)

achievement(
    title = "Playing with Fire", 
    points = 50,
    type="missable",
    description = "Finish the third Sand Griffin encounter without taking damage",
    trigger = PerfectThirdBoss()
)

achievement(
    title = "Master of the Elements", 
    points = 50,
    type="missable",
    description = "Kill the Sand Griffin without taking damage",
    trigger = PerfectFourthBoss()
)

achievement(
    title = "You'll Need Better Tricks!", 
    points = 50,
    type="missable",
    description = "Finish the Vizier's first fight and acquire the Scroll of Fury without taking damage",
    trigger = PerfectFifthBoss()
)

achievement(
    title = "Completed with Flying and Matching Colors", 
    points = 50,
    description = "Finish the Vizier's final fight without taking damage",
    trigger = PerfectFinalBoss()
)

//
// Rich Presence
//

// Meta-cases
rich_presence_conditional_display(byte(0x1050)==0, "Booting up the game")
rich_presence_conditional_display(InMainMenu(), "Main menu")
rich_presence_conditional_display(byte(0xf21)==2, "Watching a cutscene")

// Game over
rich_presence_conditional_display(GameOver(), 
                                  "Just bit the dust - Level {0} - Sand Persians {1}/75 - Rings {2}/2 - Medal Gates {3}/8",
                                  rich_presence_value("Unsigned", PlayerLevel()),
                                  rich_presence_value("Unsigned", AbsorbedPersians()),
                                  rich_presence_value("Unsigned", bit0(gameMemoryPointer + 0xD2) + bit1(gameMemoryPointer + 0xD2)),
                                  rich_presence_value("Unsigned", bitcount(gameMemoryPointer + 0xcb)))


// Bosses fights
rich_presence_conditional_display(RoomMatches(0x00, 0x19) && bit1(gameMemoryPointer + 0x9d) == 0, 
                                  "First boss encounter - Griffin {4}/150 HP - Level {0} - Sand Persians {1}/75 - Rings {2}/2 - Medal Gates {3}/8",
                                  rich_presence_value("Unsigned", PlayerLevel()),
                                  rich_presence_value("Unsigned", AbsorbedPersians()),
                                  rich_presence_value("Unsigned", bit0(gameMemoryPointer + 0xD2) + bit1(gameMemoryPointer + 0xD2)),
                                  rich_presence_value("Unsigned", bitcount(gameMemoryPointer + 0xcb)),
                                  rich_presence_value("Unsigned", word(pointerAt(1) + 0x96)))
rich_presence_conditional_display(RoomMatches(0x01, 0x19) && bit1(gameMemoryPointer + 0xa1) == 0, 
                                  "Second boss encounter - Griffin {4}/150 HP - Level {0} - Sand Persians {1}/75 - Rings {2}/2 - Medal Gates {3}/8",
                                  rich_presence_value("Unsigned", PlayerLevel()),
                                  rich_presence_value("Unsigned", AbsorbedPersians()),
                                  rich_presence_value("Unsigned", bit0(gameMemoryPointer + 0xD2) + bit1(gameMemoryPointer + 0xD2)),
                                  rich_presence_value("Unsigned", bitcount(gameMemoryPointer + 0xcb)),
                                  rich_presence_value("Unsigned", word(pointerAt(1) + 0x96)))
rich_presence_conditional_display(RoomMatches(0x02, 0x19) && bit1(gameMemoryPointer + 0xa5) == 0, 
                                  "Third boss encounter - Griffin {4}/200 HP - Level {0} - Sand Persians {1}/75 - Rings {2}/2 - Medal Gates {3}/8",
                                  rich_presence_value("Unsigned", PlayerLevel()),
                                  rich_presence_value("Unsigned", AbsorbedPersians()),
                                  rich_presence_value("Unsigned", bit0(gameMemoryPointer + 0xD2) + bit1(gameMemoryPointer + 0xD2)),
                                  rich_presence_value("Unsigned", bitcount(gameMemoryPointer + 0xcb)),
                                  rich_presence_value("Unsigned", word(pointerAt(1) + 0x96)))
rich_presence_conditional_display(RoomMatches(0x03, 0x19) && bit1(gameMemoryPointer + 0xa9) == 0, 
                                  "Fourth boss encounter - Griffin {4}/400 HP - Level {0} - Sand Persians {1}/75 - Rings {2}/2 - Medal Gates {3}/8",
                                  rich_presence_value("Unsigned", PlayerLevel()),
                                  rich_presence_value("Unsigned", AbsorbedPersians()),
                                  rich_presence_value("Unsigned", bit0(gameMemoryPointer + 0xD2) + bit1(gameMemoryPointer + 0xD2)),
                                  rich_presence_value("Unsigned", bitcount(gameMemoryPointer + 0xcb)),
                                  rich_presence_value("Unsigned", word(pointerAt(1) + 0x96)))
rich_presence_conditional_display(RoomMatches(0x04, 0x19) && bit1(gameMemoryPointer + 0xad) == 0, 
                                  "Fifth boss encounter - Vizier {4}/240 HP - Level {0} - Sand Persians {1}/75 - Rings {2}/2 - Medal Gates {3}/8",
                                  rich_presence_value("Unsigned", PlayerLevel()),
                                  rich_presence_value("Unsigned", AbsorbedPersians()),
                                  rich_presence_value("Unsigned", bit0(gameMemoryPointer + 0xD2) + bit1(gameMemoryPointer + 0xD2)),
                                  rich_presence_value("Unsigned", bitcount(gameMemoryPointer + 0xcb)),
                                  rich_presence_value("Unsigned", AbsorbedPersians()),
                                  rich_presence_value("Unsigned", word(pointerAt(1) + 0x78)))
rich_presence_conditional_display(RoomMatches(0x05, 0x03), 
                                  "Final boss encounter - Vizier {4}/400 HP - Level {0} - Sand Persians {1}/75 - Rings {2}/2 - Medal Gates {3}/8",
                                  rich_presence_value("Unsigned", PlayerLevel()),
                                  rich_presence_value("Unsigned", AbsorbedPersians()),
                                  rich_presence_value("Unsigned", bit0(gameMemoryPointer + 0xD2) + bit1(gameMemoryPointer + 0xD2)),
                                  rich_presence_value("Unsigned", bitcount(gameMemoryPointer + 0xcb)),
                                  rich_presence_value("Unsigned", word(pointerAt(1) + 0x78))  )                                                  


// General case
rich_presence_display("Exploring the palace - Level {0} - Sand Persians {1}/75 - Rings {2}/2 - Medal Gates {3}/8",
                      rich_presence_value("Unsigned", PlayerLevel()),
                      rich_presence_value("Unsigned", AbsorbedPersians()),
                      rich_presence_value("Unsigned", bit0(gameMemoryPointer + 0xd2) + bit1(gameMemoryPointer + 0xd2)),
                      rich_presence_value("Unsigned", bitcount(gameMemoryPointer + 0xcb)))


//
// Leaderboards
//

// Boss fights speedruns
leaderboard(
    "Boss Speedrun: First Sand Griffin Encounter",
    "Finish the first Sand Griffin encounter as fast as possible",
    // When turning from stone to flesh the griffin "pushes" the player which leads to a (damageless) "hit" animation
    start=CurrentlyPlaying() && RoomMatches(0x00, 0x19) && bit1(gameMemoryPointer + 0x9d) == 0 && 
    (CurrentAnimation() == 0x32 && prev(CurrentAnimation()) != 0x32 || CurrentAnimation() == 0x33 && prev(CurrentAnimation()) != 0x33), 
    cancel=GameOver() || InMainMenu() || !RoomMatches(0x00, 0x19), // Player died, reset the game or left the room
    submit=ZeroToOne(bit1(gameMemoryPointer + 0x9d)), // Room is marked as solved
    value=always_true(), // We count every frame of the leaderboard being on
    format="FRAMES",
    lower_is_better=true
)

leaderboard(
    "Boss Speedrun: Second Sand Griffin Encounter",
    "Finish the second Sand Griffin encounter as fast as possible",
    start=RoomMatches(0x01, 0x19) && prev(byte(gameMemoryPointer + 0x65)) != 0x19 && bit1(gameMemoryPointer + 0xa1) == 0, 
    cancel=GameOver() || InMainMenu() || !RoomMatches(0x01, 0x19), // Player died, reset the game or left the room
    submit=ZeroToOne(bit1(gameMemoryPointer + 0xa1)), // Room is marked as solved
    value=always_true(), // We count every frame of the leaderboard being on
    format="FRAMES",
    lower_is_better=true
)

leaderboard(
    "Boss Speedrun: Third Sand Griffin Encounter",
    "Finish the third Sand Griffin encounter as fast as possible",
    start=RoomMatches(0x02, 0x19) && prev(byte(gameMemoryPointer + 0x65)) != 0x19 && bit1(gameMemoryPointer + 0xa5) == 0, 
    cancel=GameOver() || InMainMenu() || !RoomMatches(0x02, 0x19), // Player died, reset the game or left the room
    submit=ZeroToOne(bit1(gameMemoryPointer + 0xa5)), // Room is marked as solved
    value=always_true(), // We count every frame of the leaderboard being on
    format="FRAMES",
    lower_is_better=true
)

leaderboard(
    "Boss Speedrun: Final Sand Griffin Encounter",
    "Kill the Sand Griffin as fast as possible",
    start=RoomMatches(0x03, 0x19) && prev(byte(gameMemoryPointer + 0x65)) != 0x19 && bit1(gameMemoryPointer + 0xa9) == 0, 
    cancel=GameOver() || InMainMenu() || !RoomMatches(0x03, 0x19), // Player died, reset the game or left the room
    submit=ZeroToOne(bit1(gameMemoryPointer + 0xa9)), // Room is marked as solved
    value=always_true(), // We count every frame of the leaderboard being on
    format="FRAMES",
    lower_is_better=true
)

leaderboard(
    "Boss Speedrun: First Vizier Encounter",
    "Finish the first Vizier encounter and acquire the Scroll of Fury as fast as possible",
    start=RoomMatches(0x04, 0x19) && prev(byte(gameMemoryPointer + 0x65)) != 0x19 && bit1(gameMemoryPointer + 0xad) == 0, 
    cancel=GameOver() || InMainMenu() || !RoomMatches(0x04, 0x19), // Player died, reset the game or left the room
    submit=ZeroToOne(bit5(gameMemoryPointer + 0xc2)), // Scroll of Fury acquired (the player may still die before that)
    value=always_true(), // We count every frame of the leaderboard being on
    format="FRAMES",
    lower_is_better=true
)

leaderboard(
    "Boss Speedrun: Final Vizier Encounter",
    "Kill the Vizier as fast as possible",
    start=RoomMatches(0x05, 0x03) && prev(byte(gameMemoryPointer + 0x65)) != 0x03,
    cancel=GameOver() || InMainMenu() || !RoomMatches(0x05, 0x03), // Player died, reset the game or left the room
    submit=word(pointerAt(1) + 0x78) == 0 && byte(0x0f21) == 2 && prev(byte(0x0f21)) != 2, // Vizier dead, cutscene started
    value=always_true(), // We count every frame of the leaderboard being on
    format="FRAMES",
    lower_is_better=true
)


// Finish the game with minimum Sand Persians count
leaderboard(
    "Making It Harder",
    "Finish the game having absorbed as few Sand Persians as possible",
    // Starts and submits on the same frame to avoid screen pollution
    start=RoomMatches(0x05, 0x03) && word(pointerAt(1) + 0x78) == 0 && byte(0x0f21) == 2 && prev(byte(0x0f21)) != 2, 
    cancel=GameOver() || InMainMenu() || !RoomMatches(0x05, 0x03), // Player died, reset the game or left the room
    submit=word(pointerAt(1) + 0x78) == 0 && byte(0x0f21) == 2 && prev(byte(0x0f21)) != 2, // Vizier dead, cutscene started
    value=AbsorbedPersians(),
    format="VALUE",
    lower_is_better=true
)

// Full-game speedrun ?
leaderboard(
    "Speedrun: Any%",
    "Finish the game as fast as you can in one sitting. Will reset if the player goes back to main menus. Create a savefile named \"SPD\" to start a speedrun game.",
    // Starts and submits on the same frame to avoid screen pollution
    start=(Game1TurnedSPD() || Game2TurnedSPD() || Game3TurnedSPD()) && prev(byte(0x0f25)) == 0 && byte(0x0f21) == 2 && byte(0x0f25) == 0x7f,
    cancel=InMainMenu(),
    submit=RoomMatches(0x05, 0x03) && word(pointerAt(1) + 0x78) == 0 && byte(0x0f21) == 2 && prev(byte(0x0f21)) != 2, // Vizier dead, cutscene started
    value=always_true(), 
    format="FRAMES",
    lower_is_better=true
)