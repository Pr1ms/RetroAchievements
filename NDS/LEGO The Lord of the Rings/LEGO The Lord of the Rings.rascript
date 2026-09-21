// LEGO The Lord of the Rings
// #ID = 15360

characters =  {
    0x07: "Aragorn",
    0x08: "Aragorn", // Anduril
    0x09: "Aragorn", // Royal Armour
    0x10: "Boromir",
    0x14: "Éowyn", // Dernhelm
    0x16: "Elendil",    
    0x17: "Elrond", // 2nd Age
    0x18: "Elrond",
    0x19: "Eomer",
    0x1d: "Frodo",
    0x1e: "Frodo",
    0x1f: "Frodo", // Phial of Galadriel
    0x20: "Frodo", // Orc Disguise
    0x21: "Frodo",
    0x26: "Gandalf the Grey",
    0x27: "Gandalf the White",
    0x29: "Gimli", // Balin's Axe
    0x2a: "Gimli", // Balin's Axe
    0x2c: "Gollum",
    0x37: "Isildur",
    0x38: "Isildur", // Ring-bearer    
    0x3b: "Legolas",
    0x3c: "Legolas", // Galadhrim Bow
    0x43: "Merry",
    0x44: "Merry",
    0x45: "Merry", // Rohan Squire
    0x4b: "Pippin",
    0x4c: "Pippin",  
    0x4d: "Pippin", // Guard of the Citadel
    0x52: "Sam",
    0x53: "Sam", // Elven Rope
    0x54: "Sam", 
    0x55: "Sam", // Phial of Galadriel
    0x56: "Sam", // Orc Disguise
    0x60: "Uruk-hai Captain",
    0x94: "Frodo",
    0x95: "Gandalf the Grey", // No Staff
    0x96: "Gandalf the Grey",
}

map = {
    0x00: "The Battle of the Last Alliance", // Tutorial section
    0x01: "The Battle of the Last Alliance", // Middle section
    0x02: "The Battle of the Last Alliance", // Mount Doom
    0x04: "Hobbiton", // Night
    0x05: "Bag End's Neighbourhood", // Night
    0x06: "Bag End's Neighbourhood", // Day
    0x07: "Hobbiton", // Day
    0x08: "The Shire",
    0x09: "Farmer Maggot's Field",
    0x0a: "The Black Rider on the Road", // 1st section
    0x0b: "The Black Rider on the Road", // 2nd section
    0x0c: "Saruman Boss fight", // Saruman tower
    0x0d: "The Black Rider on the Road", // Fleeing the Nazgul
    0x0e: "Bree", // In town
    0x0f: "Bree's Surroundings",
    0x10: "Bree's Surroundings",
    0x11: "The Camp at Weathertop", // Making dinner
    0x13: "The Camp at Weathertop", // Inside the cave
    0x14: "The Camp at Weathertop", // Nazgul attack
    0x15: "Rivendell",
    0x16: "Rivendell's surroundings",
    0x17: "Rivendell's surroundings",
    0x18: "The Pass of Caradhras",
    0x19: "Moria: Balin's Tomb", // Outside Moria
    0x1a: "The Watcher Boss fight",
    0x1b: "Moria: Balin's Tomb", // Well Scene
    0x1c: "Moria: Balin's Tomb", // Orcs attack
    0x1d: "Moria: Bridge of Khazad-dûm", // Top floor
    0x1e: "Moria: Bridge of Khazad-dûm", // Stairs
    0x20: "Lothlórien's surroundings",
    0x21: "Lothlórien",
    0x22: "Lothlórien",
    0x23: "The Skirmish at Amon Hen", // Fleeing Boromir
    0x24: "The Skirmish at Amon Hen", // Battle 1/2
    0x25: "The Skirmish at Amon Hen", // Battle 2/2
    0x26: "The Taming of Gollum", // Boulders section
    0x27: "The Taming of Gollum", // Fish section
    0x28: "The Taming of Gollum", // Gandalf part
    0x29: "Rohan",
    0x2a: "Tracking the Hobbits", 
    0x2b: "Tracking the Hobbits", 
    0x2c: "Tracking the Hobbits", 
    0x2d: "Tracking the Hobbits",
    0x2e: "Tracking the Hobbits", 
    0x2f: "Tracking the Hobbits", 
    0x30: "Edoras",
    0x31: "Edoras: Horse Masters Challenge",
    // Edoras' Castle ??
    0x33: "Helm's Deep",
    0x34: "The Battle of Helm's Deep",
    0x35: "The Battle of Helm's Deep",
    0x36: "The Battle of Helm's Deep",
    0x37: "The Battle of Helm's Deep",
    0x38: "The Battle of Helm's Deep",
    0x39: "The Battle of Helm's Deep", // Horse scene
    0x3a: "Dunharrow",
    0x3b: "The Paths of the Dead",
    0x3c: "The Paths of the Dead",
    0x3d: "The Paths of the Dead",
    0x3e: "The Paths of the Dead",
    0x3f: "Osgiliath",
    0x40: "Shelob's Lair",
    0x41: "Shelob's Lair",
    0x42: "Shelob's Lair",
    0x43: "Shelob's Lair",
    0x44: "Shelob's Lair",
    0x45: "Shelob's Lair",
    0x46: "Minas Tirith's surroundings",
    0x47: "Minas Tirith's Keep",
    0x48: "Minas Tirith",
    0x49: "The Battle of Pelennor",
    0x4a: "The Battle of Pelennor",
    0x4b: "The Battle of Pelennor",
    0x4c: "The Battle of Pelennor",
    0x4d: "The Battle of Pelennor",
    0x4e: "Mordor",
    0x4f: "Mordor",
    0x50: "Journey's End",
    0x51: "Journey's End",
    0x52: "Journey's End",
    0x53: "Journey's End",
}

mode = {
    0: "Story",
    1: "Free Play"
}


map_type = {
    0: "Level",
    1: "Hub"
}

rich_presence_conditional_display(word(0x1a567d) == 0, "Loading level")

rich_presence_conditional_display(byte(0x1a567e) == 0, "Playing {0} in {4} ({1}) - {2}% - ⏱️{3}",                      
                      rich_presence_lookup("Character", byte(0x1a567d), characters),
                      rich_presence_lookup("Mode", byte(0x1b8a65), mode),
                      rich_presence_value("Fixed1", word(0x1a5a64), "FIXED1"),
                      rich_presence_value("Frames", 2 * dword(0x1a5a60), "FRAMES"),
                      rich_presence_lookup("Map", byte(0x1a3f03), map)
                      )

rich_presence_display("Playing {0} and {1} in {5} ({2}) - {3}% - ⏱️{4}",                      
                      rich_presence_lookup("Character", byte(0x1a567d), characters),
                      rich_presence_lookup("Character", byte(0x1a567e), characters),
                      rich_presence_lookup("Mode", byte(0x1b8a65), mode),
                      rich_presence_value("Fixed1", word(0x1a5a64), "FIXED1"),
                      rich_presence_value("Frames", 2 * dword(0x1a5a60), "FRAMES"),
                      rich_presence_lookup("Map", byte(0x1a3f03), map)
)