// DJ Hero
// #ID = 34823

function totalStarCount() => dword_be((dword_be((dword_be(0x797aa8) & 0x1fffffff) + 0xbc) & 0x1fffffff) + 0x1550)

function inGame() => dword_be(0x797acc) != 0
function inSong() => dword_be(0x797d88) != 0

cheats = {
    0: "",
}

function sumOfCheats() => dword_be(0x4f4e8c) + dword_be(0x4f4ec4) + dword_be(0x4f4efc) + dword_be(0x4f4f34) + 
                          dword_be(0x4f4f6c) + dword_be(0x4f4fa4) + dword_be(0x4f4fdc) + dword_be(0x4f5014) +
                          dword_be(0x4f504c) + dword_be(0x4f5084) + dword_be(0x4f50bc) + dword_be(0x4f50f4) +
                          dword_be(0x4f512c) + dword_be(0x4f5164) + dword_be(0x4f519c) + dword_be(0x4f51d4) +
                          dword_be(0x4f52ec) + dword_be(0x4f5324) + dword_be(0x4f535c)
function isNotCheating() => sumOfCheats() == 0

rich_presence_conditional_display(inGame() && inSong(), "Mixing - Total Stars: {0}/465 {1}", 
                                  rich_presence_value("Value", totalStarCount(), "VALUE"),
                                  rich_presence_lookup("CHEATS", sumOfCheats(), cheats, fallback=" - Using Cheats")
)

rich_presence_conditional_display(inGame(), "In the Hub - Total Stars: {0}/465 {1}", 
                                  rich_presence_value("Value", totalStarCount(), "VALUE"),
                                  rich_presence_lookup("CHEATS", sumOfCheats(), cheats, fallback=" - Using Cheats")
)

rich_presence_display("Playing DJ Hero")

basicTutorialsOffsets = [0x11e0, 0x11f0, 0x1200, 0x1210, 0x1220]
advancedTutorialsOffsets = [0x1230, 0x1240, 0x05d0, 0x1250, 0x0640, 0x05c0]

function masteringTutorials(offsets){
    prev = always_false()
    mem = always_true()
    for offset in offsets{
        prev = prev || prev(dword_be((dword_be((dword_be(0x797aa8) & 0x1fffffff) + 0xbc) & 0x1fffffff) + offset)) != 0x180
        mem = mem && dword_be((dword_be((dword_be(0x797aa8) & 0x1fffffff) + 0xbc) & 0x1fffffff) + offset) == 0x180
    }
    return isNotCheating() && inGame() && prev && mem
}

achievement(title="Mastering the Basics", points=1,
            description="Master all Basic Tutorial entries",
            trigger=masteringTutorials(basicTutorialsOffsets)
)

achievement(title="Advanced Degree", points=2,
            description="Master all Advanced Tutorial entries",
            trigger=masteringTutorials(advancedTutorialsOffsets)
)

progressionData = [
    ["Scratching the Surface", [0x0120, 0x0320, 0x0ab0], 3, ""],
    ["Party Rockin'", [0x0ac0, 0x0c40, 0x0a10, 0x00c0], 4, ""],
    ["Digging Deeper", [0x02f0, 0x0180, 0x0160, 0x01e0], 4, ""],
    ["Hip Hop Rules", [0x01f0, 0x0960, 0x0280, 0x0a50], 4, ""],
    ["On the Wheels of Steel", [0x0db0, 0x0d30, 0x10b0, 0x0200], 4, ""], 
    ["Trashed and Mashed", [0x00d0, 0x02c0, 0x04d0, 0x02e0, 0x02b0], 5, ""], 
    ["Cut and Paste", [0x0080, 0x0220, 0x0130, 0x10f0], 4, ""],
    ["Grandmaster Flash Presents", [0x1300, 0x12f0], 2, "non-bonus "],
    ["Jay-Z Mixtape", [0x0020, 0x0390, 0x0300, 0x0030], 4, ""],
    ["In The Groove", [0x0d80, 0x10c0, 0x01c0, 0x0b20], 4, ""],
    ["Revenge Of The Boom Bap", [0x0b50, 0x1020, 0x0370, 0x0040], 4, ""],
    ["Extended Play", [0x0ee0, 0x0e30, 0x0290, 0x0070], 4, ""],
    ["DJ Jazzy Jeff Presents", [0x00e0, 0x0100], 2, "non-bonus "],
    ["DJ Yoda Presents", [], 3, ""],
    ["Daft Punk Record Bag", [], 10, ""],
    ["Born To Rock", [], 5, ""],
    ["Breaking Needles", [], 4, ""],
    ["DJ AM Presents", [], 3, ""],  
    ["DJ Shadow Presents", [], 4, ""],
    ["J.Period Presents", [], 2, ""],
    ["DJ Z-Trip Presents", [], 3, ""],
    ["Tearing Up Wax", [], 4, ""],
    ["Scratch Perverts Presents", [], 5, ""],
    ["The Vinyl Cut", [], 2, ""]
]
 
// 5 of those is 0xa0000000, 3 is 0x60000000, 1 is 0x20000000
function mediumStars(baseOffset) => dword_be((dword_be((dword_be(0x797aa8) & 0x1fffffff) + 0xbc) & 0x1fffffff) + baseOffset + 4) & 0xe0000000

// 5 of those is 0xa0, 3 is 0x60, 1 is 0x20
function hardStars(baseOffset) => dword_be((dword_be((dword_be(0x797aa8) & 0x1fffffff) + 0xbc) & 0x1fffffff) + baseOffset + 4) & 0xe0

// 5 of those is 0x14, 3 is 0xc, 1 is 0x4
function expertStars(baseOffset) => dword_be((dword_be((dword_be(0x797aa8) & 0x1fffffff) + 0xbc) & 0x1fffffff) + baseOffset + 4) & 0x1c

function progressionAchievement(offsets){
    prev = always_false()
    mem = always_true()
    combo = always_true()
    for offset in offsets{
        prev = prev || (prev(mediumStars(offset)) < 0x20000000 && mediumStars(offset) >= 0x20000000 || prev(hardStars(offset)) < 0x20 && hardStars(offset) >= 0x20 || prev(expertStars(offset)) < 0x4 && expertStars(offset) >= 0x4)
        mem = mem && (mediumStars(offset) >= 0x20000000 || hardStars(offset) >= 0x20 || expertStars(offset) >= 0x4)
    }
    return isNotCheating() && inGame() && prev && mem 
}

for progression in progressionData{
    achievement(title=progression[0], points=progression[2], type="progression",
                description="Earn at least 1 Star in all " + progression[3] + "Mixes in " + progression[0] + " on Medium difficulty or higher",
                trigger=progressionAchievement(progression[1])
    )
}

// Unlock bonus song
achievement(title="Mashed in a Flash", points=5,
            description="Unlock the bonus track in Grandmaster Flash Presents",
            trigger=isNotCheating() && inGame() && prev(dword_be((dword_be((dword_be(0x797aa8) & 0x1fffffff) + 0xbc) & 0x1fffffff) + 0x1350)) / 0x80000000 == 0 && dword_be((dword_be((dword_be(0x797aa8) & 0x1fffffff) + 0xbc) & 0x1fffffff) + 0x1350) / 0x80000000 == 1
)

achievement(title="Up for Some Extra Jazz", points=5,
            description="Unlock the bonus track in DJ Jazzy Jeff Presents",
            trigger=isNotCheating() && inGame() && prev(dword_be((dword_be((dword_be(0x797aa8) & 0x1fffffff) + 0xbc) & 0x1fffffff) + 0x0270)) / 0x80000000 == 0 && dword_be((dword_be((dword_be(0x797aa8) & 0x1fffffff) + 0xbc) & 0x1fffffff) + 0x0270) / 0x80000000 == 1
)