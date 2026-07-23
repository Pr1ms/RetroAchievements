// Tony Hawk's Downhill Jam
// #ID = 20650

characters = {
    0x0:"Tony",
    0x1:"Kevin",
    0x2:"Kyla",
    0x3:"Gunnar",
    0x4:"Jynx",
    0x5:"Crash",
    0x6:"Armondo",
    0x7:"Ammon",
    0x8:"Budd",
    0x9:"Tiffany",
    0xa:"MacKenzie",
    0xb:"Fang",
    0xc:"Skyler",
    0xd:"Victor",
    0xe:"Custom Character"
}

races = {
    0x00: "Dharma Dash, Race, Hong Kong (Tier 1)",
    0x10: "Bagpipe Beatdown, Special, Edinburgh (Tier 2)",
    0x20: "Vista Point, Slalom, Rio (Tier 3)",
    0x30: "Knockdown, Special, Rio (Tier 4)",
    0x40: "Out Of The Woods, Race, Rio (Tier 5)",
    0x50: "Fallen Empire, Trick, Rome (Tier 6)",
    0x60: "Del Centro, Race, Rome (Tier 7)",
    0x70: "Waterfront Wipeout, Trick, Hong Kong (Tier 8)",
    0x80: "Saturday Matinee, Race, Chicago (Tier 9)",
    0x90: "Top to Bottom, Race, San Francisco (Tier 10)",
 
    0x01: "Cable Car Sprint, Race, San Francisco (Tier 1)",
    0x11: "Road to Cuzco, Race, Machu Picchu (Tier 2)",
    0x21: "Trails of Ruins, Race, Machu Picchu (Tier 3)",
    0x31: "Fallen Empire, Race, Rome (Tier 4)",
    0x41: "Lift Ticket, Tricks, Alps (Tier 5)",
    0x51: "High Street, Slalom, Edinburgh (Tier 6)",
    0x61: "Precision Shopping, Slalom, Chicago (Tier 7)",
    0x71: "Lift Ticket, Slalom, Alps (Tier 8)",
    0x81: "Scottish Catacombs, Race, Edinburgh (Tier 9)",
    0x91: "Top to Bottom, Slalom, Rome (Tier 10)",
 
    0x02: "Castle Chaos, Race, Edinburgh (Tier 1)",
    0x12: "Chinatown Collision, Special, San Francisco (Tier 2)",
    0x22: "Kevin's Challenge, Special, Hong Kong (Tier 3)",
    0x32: "Skateboard Mountain, Trick, Machu Picchu (Tier 4)",
    0x42: "Road to Cuzco, Slalom, Machu Picchu (Tier 5)",
    0x52: "Chinatown Tour, Slalom, San Francisco (Tier 6)",
    0x62: "Lift Off, Race, Alps (Tier 7)",
    0x72: "Shopping Spree, Race, Chicago (Tier 8)",
    0x82: "The Hills Are Alive, Race, Alps (Tier 9)",
    0x92: "Top to Bottom, Slalom, Machu Picchu (Tier 10)",
 
    0x03: "Street Issue, Slalom, Hong Kong (Tier 1)",
    0x13: "Montain High, Race, Machu Picchu (Tier 2)",
    0x23: "Top to Bottom, Trick, Edinburgh (Tier 3)",
    0x33: "Del Centro, Trick, Rome (Tier 4)",
    0x43: "Top to Bottom, Slalom, Hong Kong (Tier 5)",
    0x53: "Seaside Village, Race, Rome (Tier 6)",
    0x63: "Coaster Grind, Special, Chicago (Tier 7)",
    0x73: "Top To Bottom, Slalom, Rio (Tier 8)",
    0x83: "The Hills Are Alive, Trick, Alps (Tier 9)",
    0x93: "Top to Bottom, Slalom, Edinburgh (Tier 10)",
 
    0x04: "Twin Peaks, Slalom, San Francisco (Tier 1)",
    0x14: "City Lights, Slalom, Hong Kong (Tier 2)",
    0x24: "Crash Test, Special, Rio (Tier 3)",
    0x34: "Grind Time, Special, Hong Kong (Tier 4)",
    0x44: "Clear the Streets, Special, Rome (Tier 5)",
    0x54: "Out of the Woods, Trick, Rio (Tier 6)",
    0x64: "Round the Matterhorn, Trick, Alps (Tier 7)",
    0x74: "Top To Bottom, Trick, Rome (Tier 8)",
    0x84: "Favela Rush, Trick, Rio (Tier 9)",
    0x94: "Mall Trash, Trick, Chicago (Tier 10)",
 
    0x05: "Gunnar's Threads, Race, Edinburgh (Tier 1)",
    0x15: "Twin Peaks, Trick, San Francisco (Tier 2)",
    0x25: "Elimination, Special, San Francisco (Tier 3)",
    0x35: "Vista Point, Trick, Rio (Tier 4)",
    0x45: "Girl Power, Race, Rio (Tier 5)",
    0x55: "Dharma Dash, Trick, Hong Kong (Tier 6)",
    0x65: "Waterfront Wipeout, Race, Hong Kong (Tier 7)",
    0x75: "Mall Rats, Special, Chicago (Tier 8)",
    0x85: "Top to Bottom, Slalom, San Francisco (Tier 9)",
    0x95: "Elimination Sale, Special, Chicago (Tier 10)",
 
    0x06: "Twin Peaks, Race, San Francisco (Tier 1)",
    0x16: "Scottish Catacombs, Slalom, Edinburgh (Tier 2)",
    0x26: "Hot Lava, Special, Rio (Tier 3)",
    0x36: "Fallen Empire, Slalom, Rome (Tier 4)",
    0x46: "Boost Jam, Special, San Francisco (Tier 5)",
    0x56: "Castle Chaos, Slalom, Edinburgh (Tier 6)",
    0x66: "Parking Lot Shuffle, Race, Chicago (Tier 7)",
    0x76: "Bully Board, Special, Rio (Tier 8)",
    0x86: "Mall Moves, Trick, Chicago (Tier 9)",
    0x96: "Top to Bottom, Race, Alps (Tier 10)",
 
    0x07: "Castle Chaos, Trick, Edinburgh (Tier 1)",
    0x17: "Road to Cuzco, Trick, Machu Picchu (Tier 2)",
    0x37: "Rooftop Tour, Slalom, Rio (Tier 4)",
    0x57: "Top To Bottom, Trick, San Francisco (Tier 6)",
    0x67: "Del Centro, Slalom, Rome (Tier 7)",
    0x87: "Seaside Village, Slalom, Rome (Tier 9)",
    0x97: "Top to Bottom, Trick, Alps (Tier 10)",
 
    0x08: "Waterfront Wipeout, Slalom, Hong Kong (Tier 1)",
    0x18: "MacKenzie's Challenge, Special, Edinburgh (Tier 2)",
    0x38: "Mountain High, Slalom, Machu Picchu (Tier 4)",
    0x58: "Elimination, Special, Rome (Tier 6)",
    0x68: "Park It Anywhere, Trick, Chicago (Tier 7)",
    0x88: "Full Mall Grind, Special, Chicago (Tier 9)",
    0x98: "Top to Bottom, Slalom, Alps (Tier 10)",

    0x09: "Tourist Trap, Race, San Francisco (Tier 1)",
    0x19: "Vista Point, Race, Rio (Tier 2)",
    0x39: "High Street, Trick, Edinburgh (Tier 4)",
    0x59: "Clearance Sale, Special, Chicago (Tier 6)",
    0x69: "Round the Matterhorn, Slalom, Alps (Tier 7)",
    0x89: "The Hills Are Alive, Slalom, Alps (Tier 9)",
    0x99: "Boost Jam, Special, Machu Picchu (Tier 10)",
 
    0x0a: "Cash Grab, Special, San Francisco (Tier 1)",
    0x1a: "Tourist Spot, Slalom, San Francisco (Tier 2)",
    0x3a: "Top to Bottom, Race, Edinburgh (Tier 4)",
    0x5a: "Hot Lava, Special, San Francisco (Tier 6)",
    0x6a: "Big Air, Trick, San Francisco (Tier 7)",
    0x8a: "Top to Bottom, Trick, Hong Kong (Tier 9)",
    0x9a: "Unknown Skater, Special, Alps (Tier 10)",
 
    0x1b: "Skateboard Mountain, Slalom, Machu Picchu (Tier 2)",
    0x3b: "Favela Rush, Race, Rio (Tier 4)",
    0x6b: "Top To Bottom, Race, Machu Picchu (Tier 7)",
    0x8b: "Top to Bottom, Trick, Rio (Tier 9)",

    0x1c: "Top to Bottom, Race, Hong Kong (Tier 2)",
    0x3c: "Top To Bottom, Trick, Machu Picchu (Tier 4)",
    0x6c: "Rome Burning, Race, Rome (Tier 7)",
    0x8c: "Swiss Elimination, Special, Alps (Tier 9)",
 
    0x1d: "Bully Board, Special, Edinburgh (Tier 2)",
    0x3d: "Cash Grab, Special, Rome (Tier 4)",
    0x6d: "Boost Jam, Special, Alps (Tier 7)",
    0x8d: "Cash Grab, Special, Chicago (Tier 9)",
}

tiers = {
    0x00: "Greenhorn",
    0x01: "Rookie",
    0x02: "Barnstormer",
    0x03: "Boarder",
    0x04: "Semi-Pro",
    0x05: "Pro",
    0x06: "Champion",
    0x07: "Sensei",
    0x08: "Grandmaster",
    0x09: "Legend",
    0x0a: "Conqueror"
}

boards = {
    0x00: "Basic Board",
    0x01: "Street Issue",
    0x02: "Solar",
    0x03: "Chaos",
    0x04: "Celtic",
    0x05: "Red Rascal",
    0x06: "Cruiser",
    0x07: "Illuminate",
    0x08: "Dark Sign",
    0x09: "Spooky",
    0x0a: "Black Icer",
    0x0b: "Ripper",
    0x0c: "Dispersion",
    0x0d: "Makonga",
    0x0e: "Goddess of Speed",
    0x0f: "Dragon",
    0x10: "Vulture",
    0x11: "Dragon T",
    0x12: "Vanguard"
}

// [Tier, Event, Gate Count]
slalomInfos = [
    [0,3,21], // Street Issue, Slalom, Hong Kong
    [0,4,17], // Twin Peaks, Slalom, San Francisco
    [0,8,23], // Waterfront Wipeout, Slalom, Hong Kong
    
    [1,4,29], // City Lights, Slalom, Hong Kong
    [1,6,36], // Scottish Catacombs, Slalom, Edinburgh
    [1,10,26], // Tourist Spot, Slalom, San Francisco
    
    [1,11,15], // Skateboard Mountain, Slalom, Machu Picchu
    [2,0,16], // Vista Point, Slalom, Rio
    [3,6,16], // Fallen Empire, Slalom, Rome
    
    [3,7,42], // Rooftop Tour, Slalom, Rio
    [3,8,10], // Mountain High, Slalom, Machu Picchu
    [4,2,15], // Road to Cuzco, Slalom, Machu Picchu
    
    [4,3,54], // Top to Bottom, Slalom, Hong Kong
    [5,1,23], // High Street, Slalom, Edinburgh
    [5,2,13], // Chinatown Tour, Slalom, San Francisco
    
    [5,6,22], // Castle Chaos, Slalom, Edinburgh
    [6,1,15], // Precision Shopping, Slalom, Chicago
    [6,7,12], // Del Centro, Slalom, Rome
    
    [6,9,21], // Round the Matterhorn, Slalom, Alps
    [7,1,31], // Lift Ticket, Slalom, Alps
    [7,3,69], // Top To Bottom, Slalom, Rio
    
    [8,5,40], // Top to Bottom, Slalom, San Francisco
    [8,7,16], // Seaside Village, Slalom, Rome
    [8,9,37], // The Hills Are Alive, Slalom, Alps
    
    [9,1,45], // Top to Bottom, Slalom, Rome
    [9,2,44], // Top to Bottom, Slalom, Machu Picchu
    [9,3,82], // Top to Bottom, Slalom, Edinburgh
    
    [9,8,87] // Top to Bottom, Slalom, Alps
]

function unlockedBoards(){
    sum = 0
    for index in range(0, 17){
        sum = sum + dword(dword(dword(0x4e4268) + 0x2cac) + 0x188 + 4 * index)
    }
    return 1 + sum
}

function aBoardIsUnlocking(){
    cond = false
    for index in range(0, 17){
        cond = cond || prev(dword(dword(dword(0x4e4268) + 0x2cac) + 0x188 + 4 * index)) == 0 && dword(dword(dword(0x4e4268) + 0x2cac) + 0x188 + 4 * index) == 1
    }
    return cond
}

function unlockedCharacters()
{
    sum = 0
    for index in range(0, 5){
        sum = sum + dword(dword(0x46f90c) + 0x554 + 4 * index)
    }
    return 9 + sum
}

function inRace() => dword(dword(dword(0x4e4268) + 0x1b7c) + 0xc) == 1

rich_presence_conditional_display(dword(0x4adc30) == 0x1, "Playing the \"Behind the Scenes\" Cutscene")

rich_presence_conditional_display(inRace(), "{0} is riding the {1} in {2} - Boards: {3}/19 - Characters: {4}/15 - 👑{5} ({6})", 
                                  rich_presence_lookup("Character", dword(0x4b0678), characters),
                                  rich_presence_lookup("Board", dword(dword(dword(0x4e4268) + 0x184c) + 0x20), boards),
                                  rich_presence_lookup("Race", 0x10 * dword(dword(dword(0x4e4268) + 0x184c) + 0x34) + dword(dword(dword(0x4e4268) + 0x184c) + 0x48), races),
                                  rich_presence_value("Value", unlockedBoards(), "VALUE"),
                                  rich_presence_value("Value", unlockedCharacters(), "VALUE"),
                                  rich_presence_value("Value", dword(dword(dword(0x4e4268) + 0x2cac) + 0x104), "VALUE"),
                                  rich_presence_lookup("Tier", dword(dword(dword(0x4e4268) + 0x2cac) + 0x134), tiers)
)

rich_presence_conditional_display(dword(0x4adc20) == 0xffffffff, "In the Hub - Boards: {0}/19 - Characters: {1}/15 - 👑{2} ({3})",
                                  rich_presence_value("Value", unlockedBoards(), "VALUE"),
                                  rich_presence_value("Value", unlockedCharacters(), "VALUE"),
                                  rich_presence_value("Value", dword(dword(dword(0x4e4268) + 0x2cac) + 0x104), "VALUE"),
                                  rich_presence_lookup("Tier", dword(dword(dword(0x4e4268) + 0x2cac) + 0x134), tiers)
)

rich_presence_display("Playing Tony Hawk's Downhill Jam")

/**
    Achievements protections:
    1) Using an AntiCheat patch => no cheat protection needed
    2) Save/load protection needs to be done on three fronts:
      - on titles the game fetches a lot of unlock data from the first available savefile (even before actually choosing a savefile to load)
      - if the player switches savefiles in a single session (because data will no be cleared by the game in between)
    For end-of-race achievements, they cannot happen on load anyway, so they are self-protecting
*/
function saveProtection() => dword(dword(dword(0x4a9114) + 0x8510) + 0xc) == 0x7f2e488f //dword(0x4adc7c) == 0 && dword(0x4adc20) == 0xffffffff

achievement("Slightly Better Piece of Wood", id=625004,
            description="Unlock a new board",
            points=1,
            trigger=saveProtection() && aBoardIsUnlocking()
)
            
achievement("What Do You Mean? Of Course I Need 19 Boards!",
            description="Unlock all boards", id=625005,
            points=10,
            trigger=saveProtection() && prev(unlockedBoards()) == 18 && measured(unlockedBoards() == 19)
)   
            
achievement("Easily Done Love! Let Me Know When the Real Competition Starts!",
            description="Unlock MacKenzie", id=625006,
            points=5,
            trigger=saveProtection() && prev(dword(dword(0x46f90c) + 0x554)) == 0 && dword(dword(0x46f90c) + 0x554) == 1 
)   

achievement("It's over Already Huh? I'm Barely Even in Excruciating Pain!",
            description="Unlock Crash", id=625007,
            points=5,
            trigger=saveProtection() && prev(dword(dword(0x46f90c) + 0x558)) == 0 && dword(dword(0x46f90c) + 0x558) == 1
)   

achievement("Now That's How You Skate Downhill... In a Video Game!",
            description="Unlock Kevin", id=625008,
            points=5,
            trigger=saveProtection() && prev(dword(dword(0x46f90c) + 0x55c)) == 0 && dword(dword(0x46f90c) + 0x55c) == 1 
)   

achievement("Winners Are Just Loosers Who Have Lost Their Way!",
            description="Unlock Skyler", id=625009,
            points=5,
            trigger=saveProtection() && prev(dword(dword(0x46f90c) + 0x564)) == 0 && dword(dword(0x46f90c) + 0x564) == 1
)   

achievement("Sometimes You're the Looser and Sometimes You're Me!",
            description="Unlock Victor", id=625010,
            points=5,
            trigger=saveProtection() && prev(dword(dword(0x46f90c) + 0x568)) == 0 && dword(dword(0x46f90c) + 0x568) == 1
)   

outfitOffsets = [
    0x2ec, 0x2f0, 0x2f4, 0x2f8,
    0x318, 0x31c, 0x320, 0x324,
    0x344, 0x348, 0x34c, 0x350,
    0x370, 0x374, 0x378, 0x37c,
    0x39c, 0x3a0, 0x3a4, 0x3a8,
    0x3c8, 0x3cc, 0x3d0, 0x3d4,
    0x3f4, 0x3f8, 0x3fc, 0x400,
    0x420, 0x424, 0x428, 0x42c,
    0x44c, 0x450, 0x454, 0x458,
    0x478, 0x47c, 0x480, 0x484,
    0x4a4, 0x4a8, 0x4ac, 0x4b0,
    0x4d0, 0x4d4, 0x4d8, 0x4dc,
    0x4fc, 0x500, 0x504, 0x508,
    0x528, 0x52c, 0x530, 0x534
]
     
function anOutfitIsUnlocking(){
    cond = false
    for offset in outfitOffsets {
        cond = cond || prev(dword(dword(0x46f90c) + offset)) == 0 && dword(dword(0x46f90c) + offset) == 1
    }
    return cond
}

function fullWardrobeForAChar(){
    cond = false
    for index in range(0, 13){
        charSum = dword(dword(0x46f90c) + outfitOffsets[4 * index]) + dword(dword(0x46f90c) + outfitOffsets[4 * index + 1]) +
                  dword(dword(0x46f90c) + outfitOffsets[4 * index + 2]) + dword(dword(0x46f90c) +  outfitOffsets[4 * index + 3])
        cond = cond || prev(charSum) == 3 && charSum == 4
    }
    return cond
}

function allOutfitsUnlocked(){
    sum = 0
    for offset in outfitOffsets {
        sum = sum + dword(dword(0x46f90c) + offset)
    } 
    return prev(sum) == 55 && measured(sum == 56)
}
     
function didNotCheat() => 0x00 == 0x00
          
function inRaceCountdownMs() => 60000 * dword(dword(dword(0x4e4268) + 0xd3c0) + 0x48) + 1000 * dword(dword(dword(0x4e4268) + 0xd3c0) + 0x5c) + dword(dword(dword(0x4e4268) + 0xd3c0) + 0x70)

function timesUp() => dword(dword(dword(0x4e4268) + 0xd3c0) + 0x48) == 0 && dword(dword(dword(0x4e4268) + 0xd3c0) + 0x5c) == 0 && dword(dword(dword(0x4e4268) + 0xd3c0) + 0x70) == 0
function passedThroughAGate() => prev(dword(dword(dword(0x4e4268) + 0xd3c0) + 0x48)) == dword(dword(dword(0x4e4268) + 0xd3c0) + 0x48) && 
                                 prev(dword(dword(dword(0x4e4268) + 0xd3c0) + 0x5c)) < dword(dword(dword(0x4e4268) + 0xd3c0) + 0x5c) ||
                                 prev(dword(dword(dword(0x4e4268) + 0xd3c0) + 0x48)) < dword(dword(dword(0x4e4268) + 0xd3c0) + 0x48)
          
          
          
achievement("Check These New Threads", id=625011,
            description="Unlock an alternative outfit",
            points=1,
            trigger=saveProtection() && anOutfitIsUnlocking()
)    

/**
achievement("Blinding the Competition with Style",
            description="Wearing an alternative outfit, win gold in any race",
            points=1,
            trigger=dword(dword(0x46f90c) + 0x568) == 1 && prev(dword(dword(0x46f90c) + 0x568)) == 0
) 
*/

achievement("Full Wardrobe", id=625012,
            description="Unlock all alternative outfits for a skater",
            points=5,
            trigger=saveProtection() && fullWardrobeForAChar()
)        

achievement("Fashionista", id=625013,
            description="Unlock all alternative outfits",
            points=10,
            trigger=saveProtection() && allOutfitsUnlocked()
)       

achievement("Rookie", id=625033,
            description="Unlock Tier 2 Events",
            type="progression",
            points=10,
            trigger=saveProtection() && prev(dword(dword(dword(0x4e4268) + 0x2cac) + 0x104)) >= 13 &&
                    prev(dword(dword(dword(0x4e4268) + 0x2cac) + 0x134)) == 0 && dword(dword(dword(0x4e4268) + 0x2cac) + 0x134) == 1 
)     

achievement("Barnstormer", id=625034,
            description="Unlock Tier 3 Events",
            type="progression",
            points=10,
            trigger=saveProtection() && prev(dword(dword(dword(0x4e4268) + 0x2cac) + 0x134)) == 1 && dword(dword(dword(0x4e4268) + 0x2cac) + 0x134) == 2
)  

achievement("Boarder", id=625035,
            description="Unlock Tier 4 Events",
            type="progression",
            points=10,
            trigger=saveProtection()&& prev(dword(dword(dword(0x4e4268) + 0x2cac) + 0x134)) == 2 && dword(dword(dword(0x4e4268) + 0x2cac) + 0x134) == 3
)  

achievement("Semi-Pro", id=625036,
            description="Unlock Tier 5 Events",
            type="progression",
            points=10,
            trigger=saveProtection() && prev(dword(dword(dword(0x4e4268) + 0x2cac) + 0x134)) == 3 && dword(dword(dword(0x4e4268) + 0x2cac) + 0x134) == 4
)     

achievement("Pro", id=625037,
            description="Unlock Tier 6 Events",
            type="progression",
            points=10,
            trigger=saveProtection() && prev(dword(dword(dword(0x4e4268) + 0x2cac) + 0x134)) == 4 && dword(dword(dword(0x4e4268) + 0x2cac) + 0x134) == 5
)     

achievement("Champion", id=625038,
            description="Unlock Tier 7 Events",
            type="progression",
            points=10,
            trigger=saveProtection() && prev(dword(dword(dword(0x4e4268) + 0x2cac) + 0x134)) == 5 && dword(dword(dword(0x4e4268) + 0x2cac) + 0x134) == 6
)     

achievement("Sensei", id=625039,
            description="Unlock Tier 8 Events",
            type="progression",
            points=10,
            trigger=saveProtection() && prev(dword(dword(dword(0x4e4268) + 0x2cac) + 0x134)) == 6 && dword(dword(dword(0x4e4268) + 0x2cac) + 0x134) == 7
)     

achievement("Grandmaster", id=625040,
            description="Unlock Tier 9 Events",
            type="progression",
            points=10,
            trigger=saveProtection() && prev(dword(dword(dword(0x4e4268) + 0x2cac) + 0x134)) == 7 && dword(dword(dword(0x4e4268) + 0x2cac) + 0x134) == 8
)     

achievement("Legend", id=625041,
            description="Unlock Tier 10 Events",
            type="progression",
            points=10,
            trigger=saveProtection() && prev(dword(dword(dword(0x4e4268) + 0x2cac) + 0x134)) == 8 && dword(dword(dword(0x4e4268) + 0x2cac) + 0x134) == 9
)     

achievement("Conqueror", id=625014,
            description="Beat Tier 10 and unlock the Mystery Skater",
            type="win_condition",
            points=25,
            trigger=saveProtection() && dword(dword(0x46f90c) + 0x560) == 1 && prev(dword(dword(0x46f90c) + 0x560)) == 0
)     

achievement("I Could Not Manual So It Took a Bit of Grind", id=625049,
            description="Reach 100% with any character",
            points=25,
            trigger=saveProtection() && 
                    prev(dword(dword(dword(0x4e4268) + 0x2cac) + 0x104)) < 827 && 
                    prev(dword(dword(dword(0x4e4268) + 0x2cac) + 0x104)) >= 815 && 
                    dword(dword(dword(0x4e4268) + 0x2cac) + 0x104) == 827
)

// THIS IS WRONG!!!
function raceOver() => inRace() && prev(float(0x5e523c)) != float(0x5e523c)
function raceOverTrigger() => inRace() && trigger_when(prev(float(0x5e523c)) != float(0x5e523c))

achievement("A Cool Mil",
            description="Finish any Event with a raw Score statistic of at least 1,000,000",
            points=10,
            trigger=dword(0x5df134) >= 1000000 && raceOver()
)

achievement("Isn't the Point to Show Off?",
            description="Finish any Event with a Longest Combo Length statistic of at least 1 minute",
            points=10,
            trigger=float(0x5e242c) >= 60.0 && raceOver()
)

achievement("I'm Not Here for the View", id=624200,
            description="Finish any Event with a Percent of Time at Max Speed statistic of at least 80%",
            points=5,
            trigger=float(0x5e2578) / float(0x5e523c) >= 0.8 && raceOver()
)

achievement("Were We Allowed to Touch the Ground?",
            description="Finish any Event with a Percent of Time on Ground statistic of at most 20%",
            points=5,
            trigger=float(0x5e25d4) / float(0x5e523c) <= 0.2 && raceOver()
)

achievement("Winning with Style",
            description="Finish any Event with a Total Tricks statistic of at least 300",
            points=5,
            trigger=dword(0x5df1d8) + dword(0x5df1dc) >= 300 && raceOver()
)

function level(tierId, eventId) => dword(dword(dword(0x4e4268) + 0x184c) + 0x34) == tierId && dword(dword(dword(0x4e4268) + 0x184c) + 0x48) == eventId

function boostJam() => level(4, 6) || level(6, 13) || level(9, 9)

achievement("Getting a Hang on Those Speed Boosts",
            description="Finish any Event except a Boost Jam with a Speed Boost Chained statistic of at least 5",
            points=5,
            trigger= !boostJam() && dword(0x5e24c8) >= 5 && raceOver()
)

achievement("Wheels on Fire",
            description="Finish any Event except a Boost Jam with a Speed Boost Chained statistic of at least 10",
            points=10,
            trigger= !boostJam() && dword(0x5e24c8) >= 10 && raceOver()
)


function allGatesInASlalom()
{
    cond = false
    for slalomInfo in slalomInfos
    {
        cond = cond || level(slalomInfo[0], slalomInfo[1]) && tally(slalomInfo[2], passedThroughAGate())
    }    
    return cond
}

achievement("Time Collector", id=625528,
            description="In any Slalom Event, pass through all Gates and finish the Event",
            points=5,
            trigger=raceOver() && never(prev(timesUp())) && allGatesInASlalom()
)

achievement("Porta Maggiore", id=625555,
            description="In the Top to Bottom Slalom Event in Rome, pass through all 45 Gates and finish the Event",
            points=10,
            trigger=raceOverTrigger() && never(prev(timesUp())) && level(9, 1) &&
                    trigger_when(tally(45, passedThroughAGate()))
)

achievement("Intipunku", id=625556,
            description="In the Top to Bottom Slalom Event in Machu Picchu, pass through all 44 Gates and finish the Event",
            points=10,
            trigger=raceOverTrigger() && never(prev(timesUp())) && level(9, 2) &&
                    trigger_when(tally(44, passedThroughAGate()))
)

achievement("Dragon Holes", id=625557,
            description="In the Top to Bottom Slalom Event in Hong Kong, pass through all 54 Gates and finish the Event",
            points=10,
            trigger=raceOverTrigger() && never(prev(timesUp())) && level(4, 3) &&
                    trigger_when(tally(54, passedThroughAGate()))
)

achievement("The Canongate", id=625558,
            description="In the Top to Bottom Slalom Event in Edinburgh, pass through all 82 Gates and finish the Event",
            points=10,
            trigger=raceOverTrigger() && never(prev(timesUp())) && level(9, 3) &&
                    trigger_when(tally(82, passedThroughAGate()))
)

achievement("Gate of Heaven", id=625559,
            description="In the Top to Bottom Slalom Event in Rio, pass through all 69 Gates and finish the Event",
            points=10,
            trigger=raceOverTrigger() && never(prev(timesUp())) && level(7, 3) &&
                    trigger_when(tally(69, passedThroughAGate()))
)

achievement("Golden Gate", id=625560,
            description="In the Top to Bottom Slalom Event in San Francisco, pass through all 40 Gates and finish the Event",
            points=10,
            trigger=raceOverTrigger() && never(prev(timesUp())) && level(8, 5) &&                    
                    trigger_when(tally(40, passedThroughAGate()))
)

achievement("Portes du Soleil", id=625561,
            description="In the Top to Bottom Slalom Event in the Alps, pass through all 87 Gates and finish the Event",
            points=10,
            trigger=raceOverTrigger() && never(prev(timesUp())) && level(9, 8) &&
                    trigger_when(tally(87, passedThroughAGate()))
)

achievement("Gold Is Not Enough", id=625579,
            description="Beat any Event's record and be rewarded with a Golden Crown with Diamonds or better",
            points=5,
            trigger=inRace() && once(prev(float(0x5e523c)) != float(0x5e523c)) && never(!inRace()) && 
                    prev(dword(dword(dword(0x4e4268) + 0x184c) + 0x84)) < 4 && dword(dword(dword(0x4e4268) + 0x184c) + 0x84) >= 4
)
            
achievement("Crown Jewels", id=625580,
            description="Beat any Event's record and be rewarded with a Golden Crown with Diamonds and Rubies",
            points=10,
            trigger=inRace() && once(prev(float(0x5e523c)) != float(0x5e523c)) && never(!inRace()) && 
                    prev(dword(dword(dword(0x4e4268) + 0x184c) + 0x84)) < 5 && dword(dword(dword(0x4e4268) + 0x184c) + 0x84) == 5
)

function skateLettersPicked() => dword(dword(dword(0x4a9114) + 0x5988) + 0xc) == 5
achievement("Arcade Mode", id=625804,
            description="In any Trick Event, collect SKATE and finish the Event",
            points=5,
            trigger=raceOver() && skateLettersPicked() && (
                level(0, 7) || level(1, 5) || level(1, 7) || level(2, 3) || level(3, 2) || level(3, 3) || level(3, 5) || level(3, 9) || level(3, 12) ||
                level(4, 1) || level(5, 0) || level(5, 4) || level(5, 5) || level(5, 7) || level(6, 4) || level(6, 8) || level(6, 10) || level(7, 0) ||
                level(7, 4) || level(8, 3) || level(8, 4) || level(8, 6) || level(8, 10) || level(8, 11) || level(9, 4) || level(9, 7)
            )
)

