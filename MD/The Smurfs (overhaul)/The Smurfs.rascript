// The Smurfs
// #ID = 4436

achievement(
    title = "The Village", points = 5, type="progression",
    description = "Finish the act 1",
    id = 26795, badge = "27239", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 1) && once(byte(0x004825) == 1) &&
              once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00188D) == 255) &&
              never(byte(0x004849) == 255) && never(byte(0x00FC8A) != 1)
)

achievement(
    title = "The Forest", points = 5,
    description = "Finish the act 2",
    id = 26796, badge = "27242", 
    trigger = byte(0x00F5BB) == 1 && (prev(byte(0x00F34E)) == 1 || prev(byte(0x00F34E)) == 2) && byte(0x00F34E) == 3 &&
              disable_when(byte(0x00F5BB) == 1 && prev(byte(0x004848)) == 255, until=byte(0x004849) == 0)
)

achievement(
    title = "The Bridge", points = 5, type="progression",
    description = "Finish the act 3",
    id = 26797, badge = "27243", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 3) && once(byte(0x004825) == 1) &&
              once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 3) && never(byte(0x004849) == 255) &&
              never(byte(0x00188D) == 255)
)

achievement(
    title = "The Black Forest", points = 5, type="progression",
    description = "Finish the act 4",
    id = 26798, badge = "27244", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 4) && once(byte(0x0019C3) == 255) &&
              once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x004849) == 255) &&
              never(byte(0x00188D) == 255)
)

achievement(
    title = "The Lake", points = 5, type="progression",
    description = "Finish the act 5",
    id = 26799, badge = "27245", 
    trigger = byte(0x001891) == 0 && byte(0x00FC8A) == 5 && prev(byte(0x00F34E)) == 7 && byte(0x00F34E) == 8 &&
              byte(0x00F34F) == 7 && byte(0x004849) != 255 && byte(0x00188D) != 255
)

achievement(
    title = "The Field", points = 5, type="progression",
    description = "Finish the act 6",
    id = 26800, badge = "27246", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 6) && once(byte(0x004825) == 1) &&
              once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 6) && never(byte(0x004849) == 255) &&
              never(byte(0x00188D) == 255)
)

achievement(
    title = "The Dam", points = 5, type="progression",
    description = "Finish the act 7",
    id = 26801, badge = "27247", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 7) && once(byte(0x004825) == 1) &&
              once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 7) && never(byte(0x004849) == 255) &&
              never(byte(0x00188D) == 255)
)

achievement(
    title = "The Swamp", points = 5, type="progression",
    description = "Finish the act 8",
    id = 26802, badge = "27248", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 8) && once(byte(0x0019C3) == 255) &&
              once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 8) && never(byte(0x004849) == 255) &&
              never(byte(0x00188D) == 255)
)

achievement(
    title = "The Cave", points = 5, type="progression",
    description = "Finish the act 9",
    id = 26803, badge = "27250", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 9) && once(byte(0x004825) == 1) &&
              once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 9) && never(byte(0x004849) == 255) &&
              never(byte(0x00188D) == 255)
)

achievement(
    title = "The Mountain", points = 5, type="progression",
    description = "Finish the act 10",
    id = 26804, badge = "27301", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 10) && once(byte(0x004825) == 1) &&
              once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 10) && never(byte(0x004849) == 255) &&
              never(byte(0x00188D) == 255)
)

achievement(
    title = "The Mine", points = 5, type="progression",
    description = "Finish the act 11",
    id = 26805, badge = "27270", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 11) && once(byte(0x004825) == 1) &&
              once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 11) && never(byte(0x004849) == 255) &&
              never(byte(0x00188D) == 255)
)

achievement(
    title = "The Volcano", points = 5, type="progression",
    description = "Finish the act 12",
    id = 26806, badge = "27276", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 12) && once(byte(0x0019C3) == 255) &&
              once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 12) && never(byte(0x004849) == 255) &&
              never(byte(0x00188D) == 255)
)

achievement(
    title = "The Descent", points = 5, type="progression",
    description = "Finish the act 13",
    id = 26807, badge = "27269", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 13) && once(byte(0x001891) > prev(byte(0x001891))) &&
              never(byte(0x00FC8A) != 13) && never(byte(0x004849) == 255) && never(byte(0x00188D) == 255)
)

achievement(
    title = "The Cliff", points = 5, type="progression",
    description = "Finish the act 14",
    id = 26808, badge = "27268", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 14) && once(byte(0x004825) == 1) &&
              once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 14) && never(byte(0x004849) == 255) &&
              never(byte(0x00188D) == 255)
)

achievement(
    title = "Gargamel's manor", points = 5, type="win_condition",
    description = "Finish the act 15",
    id = 26809, badge = "27266", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 15) && once(byte(0x0019C3) == 255) &&
              never(byte(0x00FC8A) != 15) && never(byte(0x004849) == 255) && never(byte(0x00188D) == 255) &&
              never(byte(0x00F34F) < 25) && once(byte(0x00F34F) == 25)
)

achievement(
    title = "You won't see me again", points = 10,
    description = "Finish the act 1 (hard mode)",
    id = 26810, badge = "27272", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 1) && once(byte(0x004825) == 1) &&
              once(byte(0x00F351) == 2) && once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 1) &&
              never(byte(0x004849) == 255) && never(byte(0x00188D) == 255)
)

achievement(
    title = "Call me Tarzan", points = 10,
    description = "Finish the act 2 (hard mode)",
    id = 26811, badge = "27273", 
    trigger = byte(0x00F351) == 2 && byte(0x00F5BB) == 1 && prev(byte(0x00F34E)) == 2 && byte(0x00F34E) == 3 &&
              disable_when(byte(0x00F5BB) == 1 && prev(byte(0x004848)) == 255, until=byte(0x004849) == 0)
)

achievement(
    title = "It would be better by plane", points = 10,
    description = "Finish the act 3 (hard mode)",
    id = 26812, badge = "27283", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 3) && once(byte(0x004825) == 1) &&
              once(byte(0x00F351) == 2) && once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 3) &&
              never(byte(0x004849) == 255) && never(byte(0x00188D) == 255)
)

achievement(
    title = "Surprise motherf*cker", points = 10,
    description = "Finish the act 4 (hard mode)",
    id = 26813, badge = "27326", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 4) && once(byte(0x0019C3) == 255) &&
              once(byte(0x00F351) == 2) && once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x004849) == 255) &&
              never(byte(0x00188D) == 255)
)

achievement(
    title = "Faster than light", points = 10,
    description = "Finish the act 5 (hard mode)",
    id = 26814, badge = "27280", 
    trigger = byte(0x001891) == 0 && byte(0x00FC8A) == 5 && prev(byte(0x00F34E)) == 7 && byte(0x00F34E) == 8 &&
              byte(0x00F34F) == 7 && byte(0x00F351) == 2 && byte(0x004849) != 255 && byte(0x00188D) != 255
)

achievement(
    title = "It's like Sonic spinball", points = 10,
    description = "Finish the act 6 (hard mode)",
    id = 26815, badge = "27281", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 6) && once(byte(0x004825) == 1) &&
              once(byte(0x00F351) == 2) && once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 6) &&
              never(byte(0x004849) == 255) && never(byte(0x00188D) == 255)
)

achievement(
    title = "I am the barrage", points = 10,
    description = "Finish the act 7 (hard mode)",
    id = 26816, badge = "27279", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 7) && once(byte(0x004825) == 1) &&
              once(byte(0x00F351) == 2) && once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 7) &&
              never(byte(0x004849) == 255) && never(byte(0x00188D) == 255)
)

achievement(
    title = "I'm not a light", points = 10,
    description = "Finish the act 8 (hard mode)",
    id = 26817, badge = "27282", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 8) && once(byte(0x0019C3) == 255) &&
              once(byte(0x00F351) == 2) && once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 8) &&
              never(byte(0x004849) == 255) && never(byte(0x00188D) == 255)
)

achievement(
    title = "Alone in the dark", points = 10,
    description = "Finish the act 9 (hard mode)",
    id = 26818, badge = "27271", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 9) && once(byte(0x004825) == 1) &&
              once(byte(0x00F351) == 2) && once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 9) &&
              never(byte(0x004849) == 255) && never(byte(0x00188D) == 255)
)

achievement(
    title = "Again we are back to Tibet", points = 10,
    description = "Finish the act 10 (hard mode)",
    id = 26819, badge = "27263", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 10) && once(byte(0x004825) == 1) &&
              once(byte(0x00F351) == 2) && once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 10) &&
              never(byte(0x004849) == 255) && never(byte(0x00188D) == 255)
)

achievement(
    title = "Donkey Kong would be proud", points = 10,
    description = "Finish the act 11 (hard mode)",
    id = 26820, badge = "27314", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 11) && once(byte(0x004825) == 1) &&
              once(byte(0x00F351) == 2) && once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 11) &&
              never(byte(0x004849) == 255) && never(byte(0x00188D) == 255)
)

achievement(
    title = "The cake is not a lie", points = 10,
    description = "Finish the act 12 (hard mode)",
    id = 26821, badge = "27302", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 12) && once(byte(0x0019C3) == 255) &&
              once(byte(0x00F351) == 2) && once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 12) &&
              never(byte(0x004849) == 255) && never(byte(0x00188D) == 255)
)

achievement(
    title = "SSX style", points = 10,
    description = "Finish the act 13 (hard mode)",
    id = 26822, badge = "27315", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 13) && once(byte(0x00F351) == 2) &&
              once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 13) && never(byte(0x004849) == 255) &&
              never(byte(0x00188D) == 255)
)

achievement(
    title = "Knock on wood", points = 10,
    description = "Finish the act 14 (hard mode)",
    id = 26823, badge = "27317", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 14) && once(byte(0x004825) == 1) &&
              once(byte(0x00F351) == 2) && once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 14) &&
              never(byte(0x004849) == 255) && never(byte(0x00188D) == 255)
)

achievement(
    title = "Ecraser Detruire Annihiler", points = 25,
    description = "Finish the act 15 (hard mode)",
    id = 26824, badge = "27401", 
    trigger = once(byte(0x001891) == 0) && once(byte(0x00FC8A) == 15) && once(byte(0x0019C3) == 255) &&
              once(byte(0x00F351) == 2) && never(byte(0x00188D) == 255) && never(byte(0x00F34F) < 25) &&
              never(byte(0x00FC8A) != 15) && never(byte(0x004849) == 255) && once(byte(0x00F34F) == 25)
)

achievement(
    title = "Snake charmer", points = 10,
    description = "Kill the snake in one try and without getting hit (hard mode)",
    id = 26825, badge = "27325", 
    trigger = once(byte(0x00F34F) == 11) && byte(0x00F34F) == 12 && byte(0x00F351) == 2 &&
              trigger_when(byte(0x0019C3) == 255) && never(byte(0x00F377) < prev(byte(0x00F377))) &&
              never(word(0x00F370) < prev(word(0x00F370))) && never(byte(0x004849) == 255)
)

achievement(
    title = "Dragon hunter", points = 10,
    description = "Kill the dragon in one try and without getting hit (hard mode)",
    id = 26826, badge = "27267", 
    trigger = once(byte(0x00F34F) == 19) && byte(0x00F34F) == 20 && byte(0x00F351) == 2 &&
              trigger_when(byte(0x0019C3) == 255) && never(byte(0x00F377) < prev(byte(0x00F377))) &&
              never(word(0x00F370) < prev(word(0x00F370))) && never(byte(0x004849) == 255)
)

achievement(
    title = "True Survivor", points = 10,
    description = "Kill Gargamel in one try and without getting hit (hard mode)",
    id = 26827, badge = "27275", 
    trigger = once(byte(0x00F34F) == 25) && byte(0x00F34F) == 26 && byte(0x00F351) == 2 &&
              trigger_when(byte(0x0019C3) == 255) && never(byte(0x00F377) < prev(byte(0x00F377))) &&
              never(word(0x00F370) < prev(word(0x00F370))) && never(byte(0x004849) == 255)
)

achievement(
    title = "Gardening routine", points = 10,
    description = "Kill the carnivorous plant in one try and without getting hit (hard mode)",
    id = 26828, badge = "27363", 
    trigger = once(byte(0x00F34F) == 4) && byte(0x00F34F) == 5 && byte(0x00F351) == 2 &&
              trigger_when(byte(0x0019C3) == 255) && never(byte(0x00F377) < prev(byte(0x00F377))) &&
              never(word(0x00F370) < prev(word(0x00F370))) && never(byte(0x004849) == 255)
)

achievement(
    title = "Immortal Smurf", points = 10,
    description = "Have 20 lifes",
    id = 26829, badge = "27316", 
    trigger = once(byte(0x00198F) < prev(byte(0x00198F))) && never(byte(0x00198F) > prev(byte(0x00198F))) &&
              never(byte(0x004849) == 255) && never(byte(0x00F371) < prev(byte(0x00F371))) && once(byte(0x00F371) == 2)
)

achievement(
    title = "Cead Mile Failte", points = 10,
    description = "Get a score of 100 000",
    id = 26830, badge = "27358", 
    trigger = byte(0x00F369) == 1 && never(byte(0x00198F) == 255) && never(byte(0x004849) == 255)
)

achievement(
    title = "I'm better than Indiana", points = 10,
    description = "Finish the act 11 without dying",
    id = 26831, badge = "27356", 
    trigger = once(byte(0x001891) < prev(byte(0x001891))) && once(byte(0x00FC8A) == 11) && once(byte(0x004825) == 1) &&
              once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 11) && never(byte(0x004849) == 255) &&
              never(word(0x00F370) < prev(word(0x00F370)))
)

achievement(
    title = "I scared the yeti", points = 10,
    description = "Finish the act 13 without dying",
    id = 26832, badge = "27361", 
    trigger = once(byte(0x001891) < prev(byte(0x001891))) && once(byte(0x00FC8A) == 13) &&
              once(byte(0x001891) > prev(byte(0x001891))) && never(byte(0x00FC8A) != 13) && never(byte(0x004849) == 255) &&
              never(word(0x00F370) < prev(word(0x00F370)))
)

achievement(
    title = "Overdose", points = 10,
    description = "Collect 100 leafs in a single playthrough",
    id = 26833, badge = "27360", 
    trigger = repeated(100, word(0x00F36E) > prev(word(0x00F36E))) && never(byte(0x004849) == 255) &&
              never(byte(0x00198F) == 255)
)

achievement(
    title = "Mario would be proud", points = 10,
    description = "Get 50 stars in a single playthrough",
    id = 26834, badge = "27362", 
    trigger = repeated(50, word(0x00F374) > prev(word(0x00F374))) && never(byte(0x004849) == 255) &&
              never(byte(0x00198F) == 255)
)

achievement(
    title = "The raft of the Smurf", points = 10,
    description = "Get 4 life in the bonus stage raft",
    id = 26835, badge = "27402", 
    trigger = once(byte(0x00F34F) == 28) && repeated(4, word(0x00F370) > prev(word(0x00F370))) &&
              never(byte(0x00F34F) != 28) && never(byte(0x004849) == 255)
)

achievement(
    title = "I forgot the baby", points = 10,
    description = "Get 5 life in the bonus stage stork",
    id = 26836, badge = "27357", 
    trigger = once(byte(0x00F34F) == 27) && repeated(5, word(0x00F370) > prev(word(0x00F370))) &&
              never(byte(0x00F34F) != 27) && never(byte(0x004849) == 255)
)

achievement(
    title = "Can i have a little Smurf?", points = 25,
    description = "Finish the game without using passwords and with 20 lifes or more (hard mode)",
    id = 28015, badge = "29602", 
    trigger = once(byte(0x00FC8A) == 4) && once(byte(0x00FC8A) == 8) && once(byte(0x00FC8A) == 12) &&
              once(byte(0x00FC8A) == 15) && byte(0x0019C3) == 255 && word(0x00F370) >= 200 && once(byte(0x00F351) == 2) &&
              never(byte(0x004849) == 255) && never(byte(0x00198F) == 255)
)
