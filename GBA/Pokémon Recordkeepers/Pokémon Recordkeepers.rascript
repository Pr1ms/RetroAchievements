// ~Hack~ Pokémon Recordkeepers
// #ID = 37158

archetype = {
    0: "Rain Grace",
    1: "Rain Favor",
    2: "Rain Prayer",
    3: "Sun Grace",
    4: "Sun Favor",
    5: "Sun Prayer",
    6: "Snow Grace",
    7: "Snow Favor",
    8: "Snow Prayer",
    9: "Sand Grace",
    10: "Sand Favor",
    11: "Sand Prayer",
    12: "Random"
}

map = {
    0: "Myth Hub",
    1: "Myth Sub-Boss Domain",
    2: "Myth Sub-Boss Domain",
    3: "Myth Sub-Boss Domain",
    4: "Myth Sub-Boss Domain",
    5: "Myth Sub-Boss Domain",
    6: "Myth Sub-Boss Domain",
    7: "Myth Sub-Boss Domain",
    8: "Myth Sub-Boss Domain",
    9: "Myth Sub-Boss Domain",
    10: "Myth Final Boss Domain",
    11: "Library",
    12: "Winter Area 1",
    13: "Winter Sub-Boss Area 1",
    14: "Winter Area 2",
    15: "Winter Sub-Boss Area 2",
    16: "Winter Area 3",
    17: "Winter Sub-Boss Area 3",
    18: "Winter Final Boss"
}

myth = {
    0: "Overflowing Abundance",
    1: "The Lost Archipelago",
    2: "The Original Sinner",
    3: "Nightmare After Christmas"
}

boss = {
    0x090: "Articuno",
    0x091: "Zapdos",
    0x092: "Moltres",
    0x095: "Dragonite",
    0x0e1: "Delibird",
    0x0f3: "Raikou",
    0x0f4: "Entei",
    0x0f5: "Suicune",
    0x0f8: "Tyranitar",
    0x0f9: "Lugia",
    0x175: "Salamence",
    0x178: "Metagross",
    0x179: "Regirock",
    0x17a: "Regice",
    0x17b: "Registeel",
    0x1bd: "Garchomp",
    0x1e0: "Uxie",
    0x1e1: "Mesprit",
    0x1e2: "Azelf",
    0x27b: "Hydreigon",
    0x27e: "Cobalion",
    0x27f: "Terrakion",
    0x280: "Virizion",
    0x287: "Keldeo",
    0x2c2: "Goodra",
    0x2cc: "Xerneas",
    0x310: "Kommo-o",
    0x311: "Tapu Koko",
    0x312: "Tapu Lele",
    0x313: "Tapu Bulu",
    0x314: "Tapu Fini",
    0x377: "Dragapult",
    0x37e: "Regieleki",
    0x37f: "Regidrago",
    0x3d6: "Galar Articuno",
    0x3d7: "Galar Zapdos",
    0x3d8: "Galar Moltres",
    0x42f: "Giratina",
    0x44c: "Tornadus",
    0x44d: "Thundurus",
    0x44e: "Landorus",
    0x44f: "Enamorus",
    0x56e: "Baxcalibur",
    0x572: "Wo-Chien",
    0x573: "Chien-Pao",
    0x574: "Ting-Lu",
    0x575: "Chi-Yu",
    0x57e: "Walking Wake",
    0x57f: "Iron Leaves",
    0x585: "Okidogi",
    0x586: "Munkidori",
    0x587: "Fezandipiti",
    0x593: "Gouging Fire",
    0x594: "Raging Bolt",
    0x595: "Iron Boulder",
    0x596: "Iron Crown"
}

function common_mons(){
    total = 0
    for i in range(0, 26)
    {
        total = total + byte(tbyte(0x50f8) + 0xa0da + i)
    }
    return total
}

function inGame() => word(0x11e8) == 0x0001

function battleWonAgainst(pkmnId) => word(0x8766) > 0 && prev(word(0x873c)) != 0 && prev(word(0x87a8)) == pkmnId && word(0x873c) == 0 && word(0x87a8) == 0

rich_presence_conditional_display(word(0x11e8) == 0x0000, "In Main Menu")

rich_presence_conditional_display(inGame() && byte(0x97a0) == 0x0b, "Tiana is exploring the Library")

rich_presence_conditional_display(inGame() && (byte(0x97a0) == 0 || byte(0x97a0) == 12 || byte(0x97a0) == 14 || byte(0x97a0) == 16), "Tiana is decyphering {0} - {1} team ({2}+{3})",
                                  rich_presence_lookup("Myth", byte(tbyte(0x50f8) + 0xa07c), myth),
                                  rich_presence_lookup("Archetype", byte(tbyte(0x50f8) + 0xa114), archetype),
                                  rich_presence_value("Number", byte(tbyte(0x50f8) + 0xa0f6), "VALUE"),
                                  rich_presence_value("Number", common_mons(), "VALUE")
                                 // rich_presence_lookup("Map", byte(0x97a0), map)
)

rich_presence_conditional_display(inGame(), "Tiana is decyphering {0} - {1} team ({2}+{3}) - Domain of {4}",
                                  rich_presence_lookup("Myth", byte(tbyte(0x50f8) + 0xa07c), myth),
                                  rich_presence_lookup("Archetype", byte(tbyte(0x50f8) + 0xa114), archetype),
                                  rich_presence_value("Number", byte(tbyte(0x50f8) + 0xa0f6), "VALUE"),
                                  rich_presence_value("Number", common_mons(), "VALUE"),
                                  rich_presence_lookup("Boss", word(tbyte(0x50f8) + 0xa0f8), boss)
                                 // rich_presence_lookup("Map", byte(0x97a0), map)
)

rich_presence_display("Playing ~Hack~ Pokémon Recordkeepers")


achievement(
    title = "Snowballs!", points = 1,
    description = "Listen to Hideaki's thoughts on plants watering",
    trigger = inGame() && prev(byte(tbyte(0x50f8) + 0x906a)) == 12 &&
              measured(byte(tbyte(0x50f8) + 0x906a) == 13)
)

achievement(
    title = "Hop, Skip, Jump!", points = 1,
    description = "Execute a Prayer Dance for Kio",
    trigger = inGame() && prev(dword(0x03125c)) == 15 && dword(0x03125c) == 16
)

achievement(
    title = "A Victory Before Breakfast", points = 3, type = "missable",
    description = "Beat Satsuki in the Introductory Battle",
    trigger = inGame() && byte(tbyte(0x50f8) + 0x9164) == 0 && trigger_when(battleWonAgainst(0xfb))
)

// LEARNING ABOUT MYTHS/STORIES BEFOREHAND
achievement(
    title = "An Abundance of Information", points = 2, type = "missable",
    description = "Before beating \"Overflowing Abundance\", meet Morgan and read about the Myth in the Archive",
    trigger = never(!inGame()) && word(tbyte(0x50f8) + 0xa188) == 0 && byte(tbyte(0x50f8) + 0x9164) == 1 && // Intro is over and the Myth has never been beaten
              !(byte(0x97a0) != 0x0b && word(tbyte(0x50f8) + 0xa07c) != 0x00) &&  // Hiding it if working on another myth
              trigger_when(prev(byte(0x16e61) == 0xff && dword(0x16e64) == 0x03) || prev(bit5(tbyte(0x50f8) + 0x8e84) == 0)) &&
              trigger_when(once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x03) && once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x04) && bit5(tbyte(0x50f8) + 0x8e84) == 1)
)

achievement(
    title = "Not Loosing Track of the Mission", points = 2, type = "missable",
    description = "Before beating \"The Lost Archipelago\", meet Kenichi and read about the Myth in the Archive",
    trigger = never(!inGame()) && word(tbyte(0x50f8) + 0xa1c4) == 0 && byte(tbyte(0x50f8) + 0x9164) == 1 && // Intro is over and the Myth has never been beaten
              !(byte(0x97a0) != 0x0b && word(tbyte(0x50f8) + 0xa07c) != 0x01) &&  // Hiding it if working on another myth
              trigger_when(prev(byte(0x16e61) != 0xff) || prev(bit1(tbyte(0x50f8) + 0x8e85) == 0)) &&
              trigger_when(once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x09) && bit1(tbyte(0x50f8) + 0x8e85) == 1)
)

achievement(
    title = "Curiosity Is Not a Sin", points = 2, type = "missable",
    description = "Before beating \"The Original Sinner\", meet Hanzo and Nakamura and read about the Myth in the Archive",
    trigger = never(!inGame()) && word(tbyte(0x50f8) + 0xa200) == 0 && byte(tbyte(0x50f8) + 0x9164) == 1 && // Intro is over and the Myth has never been beaten
              !(byte(0x97a0) != 0x0b && word(tbyte(0x50f8) + 0xa07c) != 0x02) &&  // Hiding it if working on another myth
              trigger_when(prev(byte(0x16e61) == 0xff && dword(0x16e64) == 0x11) || prev(bit6(tbyte(0x50f8) + 0x8e85) == 0)) &&
              trigger_when(once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x11) && once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x12) && bit5(tbyte(0x50f8) + 0x8e85) == 1 && bit6(tbyte(0x50f8) + 0x8e85) == 1)
)

achievement(
    title = "Further Studies", points = 1, type = "missable",
    description = "Before beating \"Nightmare After Christmas\", read about it in the Archive",
    trigger = inGame() && word(tbyte(0x50f8) + 0xa23c) == 0 && byte(tbyte(0x50f8) + 0x9164) == 3 && // Nightmare After Christmas intro is over and the Story has never been beaten              
              trigger_when(byte(0x16e61) == 0xff && prev(dword(0x16e64) == 0x18) && dword(0x16e64) == 0x19)
)

// MINOR ENDINGS FOR MYTHS
achievement(
    title = "[PLACEHOLDER] Lost Archipelago Minor Ending", points = 1, type = "missable",
    description = "Read the Minor Ending to \"The Lost Archipelago\" in the Archive and talk to Kenichi about it",
    trigger = never(!inGame()) && ((byte(0x97a0) != 0x0b && word(tbyte(0x50f8) + 0xa07c) == 0x01 && (word(tbyte(0x50f8) + 0xa1c4) == 0 || word(tbyte(0x50f8) + 0xa1c0) > 5)) || // In the Myth and it has never been beaten under True conditions
              byte(0x97a0) == 0x0b && word(tbyte(0x50f8) + 0xa1c0) > 5) &&// Or in the Library and it has been beaten, but not under True conditions yet
              trigger_when(prev(byte(0x16e61) != 0xff) || prev(bit1(tbyte(0x50f8) + 0x8e85) == 0)) &&
              trigger_when(once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x0b) && once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x0c) && bit5(tbyte(0x50f8) + 0x8e85) == 1 && bit6(tbyte(0x50f8) + 0x8e85) == 1)
)

achievement(
    title = "[PLACEHOLDER] Overflowing Abundane Minor Ending", points = 1, type = "missable",
    description = "Read the Minor Ending to \"Overflowing Abundance\" in the Archive and talk to Morgan about it",
    trigger = never(!inGame()) && ((byte(0x97a0) != 0x0b && word(tbyte(0x50f8) + 0xa07c) == 0x00 && (word(tbyte(0x50f8) + 0xa1c4) == 0 || word(tbyte(0x50f8) + 0xa184) > 5)) || // In the Myth and it has never been beaten under True conditions
              byte(0x97a0) == 0x0b && word(tbyte(0x50f8) + 0xa184) > 5) &&// Or in the Library and it has been beaten, but not under True conditions yet
              trigger_when(prev(byte(0x16e61) != 0xff) || prev(bit1(tbyte(0x50f8) + 0x8e85) == 0)) &&
              trigger_when(once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x05) && bit1(tbyte(0x50f8) + 0x8e85) == 1)
)

achievement(
    title = "[PLACEHOLDER] Original Sinner Minor Ending", points = 1, type = "missable",
    description = "Read the Minor Ending to \"The Original Sinner\" in the Archive and talk to Hanzo about it",
    trigger = never(!inGame()) && ((byte(0x97a0) != 0x0b && word(tbyte(0x50f8) + 0xa07c) == 0x02 && (word(tbyte(0x50f8) + 0xa1c4) == 0 || word(tbyte(0x50f8) + 0xa1fc) > 5)) || // In the Myth and it has never been beaten under True conditions
              byte(0x97a0) == 0x0b && word(tbyte(0x50f8) + 0xa1fc) > 5) &&// Or in the Library and it has been beaten, but not under True conditions yet
              trigger_when(prev(byte(0x16e61) != 0xff) || prev(bit1(tbyte(0x50f8) + 0x8e85) == 0)) &&
              trigger_when(once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x13) && once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x14) && bit5(tbyte(0x50f8) + 0x8e85) == 1 && bit6(tbyte(0x50f8) + 0x8e85) == 1)
)

// TRULY COMPLETING MYTHS/STORIES
achievement(
    title = "The Lost Archipelago", points = 10, type = "progression",
    description = "Complete \"The Lost Archipelago\" Myth under True Ending conditions",
    trigger = inGame() && (prev(word(tbyte(0x50f8) + 0xa1c4) == 0) || prev(word(tbyte(0x50f8) + 0x916c) > 5)) &&
              word(tbyte(0x50f8) + 0xa1c4) > 0 && word(tbyte(0x50f8) + 0x916c) <= 5
)

achievement(
    title = "Overflowing Abundance", points = 10, type = "progression",
    description = "Complete \"Overflowing Abundance\" Myth under True Ending conditions",
    trigger = inGame() && (prev(word(tbyte(0x50f8) + 0xa188) == 0) || prev(word(tbyte(0x50f8) + 0x9168) > 5)) &&
              word(tbyte(0x50f8) + 0xa188) > 0 && word(tbyte(0x50f8) + 0x9168) <= 5
)

achievement(
    title = "The Original Sinner", points = 10, type = "progression",
    description = "Complete \"The Original Sinner\" Myth under True Ending conditions",
    trigger = inGame() && (prev(word(tbyte(0x50f8) + 0xa200) == 0) || prev(word(tbyte(0x50f8) + 0x916a) > 5)) &&
              word(tbyte(0x50f8) + 0xa200) > 0 && word(tbyte(0x50f8) + 0x916a) <= 5
)

achievement(
    title = "Nightmare After Christmas", points = 10,
    description = "Complete \"Nightmare After Christmas\" Story",
    trigger = inGame() && prev(word(tbyte(0x50f8) + 0xa23c) == 0) && word(tbyte(0x50f8) + 0xa23c) > 0
)

// TRUE ENDINGS FOR MYTHS
achievement(
    title = "[PLACEHOLDER] Lost Archipelago True Ending", points = 2, 
    description = "Read the True Ending to \"The Lost Archipelago\" in the Archive and meet Kenichi's family",
    trigger = never(!inGame()) && 
              (prev(byte(0x16e61) == 0xff && dword(0x16e64) == 0x03) || prev(bit5(tbyte(0x50f8) + 0x8e84) == 0)) &&
              (once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x0f) && once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x10) && bit5(tbyte(0x50f8) + 0x8e84) == 1)
)

achievement(
    title = "[PLACEHOLDER] Overflowing Abundane True Ending", points = 2,
    description = "Read the True Ending to \"Overflowing Abundance\" in the Archive and talk to Yfa about it",
    trigger = never(!inGame()) &&
              (prev(byte(0x16e61) == 0xff && dword(0x16e64) == 0x03) || prev(bit5(tbyte(0x50f8) + 0x8e84) == 0)) &&
              (once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x07) && once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x08) && bit5(tbyte(0x50f8) + 0x8e84) == 1)
)

achievement(
    title = "[PLACEHOLDER] Original Sinner True Ending", points = 2,
    description = "Read the True Ending to \"The Original Sinner\" in the Archive and talk to Nakamura about it",
    trigger = never(!inGame()) &&
              (prev(byte(0x16e61) == 0xff && dword(0x16e64) == 0x03) || prev(bit5(tbyte(0x50f8) + 0x8e84) == 0)) &&
              (once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x16) && once(byte(0x16e61) == 0xff && dword(0x16e64) == 0x17) && bit5(tbyte(0x50f8) + 0x8e84) == 1)
)

// ENDING FOR STORIES
achievement(
    title = "A Merry Conclusion", points = 2,
    description = "After learning what it truly means to be a Recordkeeper, read the Ending of the \"Nightmare After Christmas\" in the Archive",
    trigger = inGame() &&
              byte(0x16e61) == 0xff && prev(dword(0x16e64) == 0x1a) && dword(0x16e64) == 0x1b
)

function bossBeaten() => byte(0x97a0) == 0x0a && prev(byte(tbyte(0x50f8) + 0xa0c6) == 0) && byte(tbyte(0x50f8) + 0xa0c6) == 1

// MYTHS CHALLENGES
achievement(
    title = "No Time for Small Fish", points = 10,
    description = "Beat one of the three starting Myth's Boss having beaten all sub-Bosses and only them beforehand",
    trigger = inGame() && byte(tbyte(0x50f8) + 0xa0f6) == 9 && common_mons() == 0 && bossBeaten() 
)

achievement(
    title = "Extra Gear Is for Children", points = 10,
    description = "Beat one of the three starting Myth's Boss without any preparation",
    trigger = inGame() && byte(tbyte(0x50f8) + 0xa0f6) == 0 && common_mons() == 0 && bossBeaten() 
)

achievement(
    title = "Overly Prepared", points = 10,
    description = "Beat one of the three starting Myth's Boss having beaten every pokemon in it",
    trigger = inGame() && byte(tbyte(0x50f8) + 0xa0f6) == 9 && common_mons() == 27 && bossBeaten() 
)

achievement(
    title = "I Could Do It Blindfolded", points = 5,
    description = "In a single session, enter any Myth with a random team and win",
    trigger = inGame() && once(byte(tbyte(0x50f8) + 0xa114) == 0xc) && never(byte(0x97a0) == 0x0b && byte(tbyte(0x50f8) + 0xa114) != 0xc && word(0xe830) <= 0x1a) &&
              trigger_when(bossBeaten())
)


// STORIES CHALLENGES
achievement(
    title = "Breaking the Trinity", points = 5,
    description = "Beat the \"Nightmare After Christmas\" Story having beaten sub-Bosses only beforehand",
    trigger = inGame() && byte(0x97a0) == 10 && byte(tbyte(0x50f8) + 0xa0f6) == 3 && common_mons() == 0 && bossBeaten() 
)

achievement(
    title = "Purge of the Nightmare", points = 5,
    description = "Beat the \"Nightmare After Christmas\" Story having beaten every pokemon in it",
    trigger = inGame() && byte(0x97a0) == 10 && byte(tbyte(0x50f8) + 0xa0f6) == 3 && common_mons() == 9 && bossBeaten() 
)

// MYTHS/STORIES MASTERY
function mythBeatenWithAllArchetypes(startingOffset){
    allIn = always_true()
    thisOneTurned = always_false()
    for archIndex in range(0, 11)
    {
        allIn = allIn && word(tbyte(0x50f8) + startingOffset + archIndex * 0x4) > 1
        thisOneTurned = thisOneTurned || prev(word(tbyte(0x50f8) + startingOffset + archIndex * 0x4) == 0)
    }
    return allIn && thisOneTurned
}

achievement(
    title = "Collecting Beacons of the Sea", points = 25,
    description = "Beat \"The Lost Archipelago\" Myth with every team archetype",
    trigger = inGame() && mythBeatenWithAllArchetypes(0xa91e)
)

achievement(
    title = "Staggering Victory", points = 25,
    description = "Beat the \"Overflowing Abundance\" Myth with every team archetype",
    trigger = inGame() && mythBeatenWithAllArchetypes(0xa88e)
)

achievement(
    title = "I Am Forgiveness", points = 25,
    description = "Beat \"The Original Sinner\" Myth with every team archetype",
    trigger = inGame() && mythBeatenWithAllArchetypes(0xa9ae)
)

achievement(
    title = "Brighter Dreams", points = 25,
    description = "Beat the \"Nightmare After Christmas\" Story with every team archetype",
    trigger = inGame() && mythBeatenWithAllArchetypes(0xaa3e)
)


// STATS BOOSTING ACHIEVEMENTS
achievement(
    title = "As Healthy as an IV-Less Wailord", points = 5,
    description = "Have your active Pokémon in Battle with their base HP of at least 450",
    trigger = inGame()
)

achievement(
    title = "As Strong as an IV-Less Rampardos", points = 5,
    description = "Have your active Pokémon in Battle with their base Atk of at least 335",
    trigger = inGame()
)

achievement(
    title = "Far Better than the Tankiest IV-Less One Out There", points = 5,
    description = "Have your active Pokémon in Battle with their base Def of at least 465",
    trigger = inGame()
)

achievement(
    title = "As Good a Caster as an IV-Less Attack Deoxys", points = 5,
    description = "Have your active Pokémon in Battle with their base SpA of at least 365",
    trigger = inGame()
)

achievement(
    title = "As Stoic as an IV-Less Lugia", points = 5,
    description = "Have your active Pokémon in Battle with their base SpD of at least 344",
    trigger = inGame()
)

achievement(
    title = "As Fast as an IV-less Ninjask", points = 5,
    description = "Have your active Pokémon in Battle with their base Spe of at least 325",
    trigger = inGame()
)

