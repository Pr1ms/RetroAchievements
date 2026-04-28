// The Sims: Bustin' Out
// #ID = 30364

// RP
postfix =  {
    0x00: "am",
    0x01: "pm",
}

function followPointer(pointer, offset) => (dword_be(pointer) & 0x1FFFFFFF) + offset

// TODO(Prims): complete the following logics
function inMainMenu() => byte(0x2e6773) == 0
function didNotCheat() => disable_when(byte(0x2e6773) > 0 , until=inMainMenu())
function inGame() => 1 == 1


rich_presence_conditional_display(byte(0x2e6773) > 0, "Instead of Bustin' Out you got busted cheating! The sentence is achievement denial until you quit your game. Don't save!")


rich_presence_display(" - {0} {1} - §{2} ",                                     
                      rich_presence_value("Seconds", 60 * (((word_be(followPointer(0x0037d944, 0x420)) + 11) % 12 + 12) % 12 + 1) + word_be(followPointer(0x0037d944, 0x42a)), "SECS"),
                      rich_presence_lookup("Postfix", word_be(followPointer(0x0037d944, 0x420)) / 12, postfix),
                      rich_presence_value("Number", dword_be(followPointer(0x0037d944, 0x480)), "VALUE"))

// rich_presence_display("Playing The Sims: Bustin' Out")



function goalsAtMoms() => bit6(followPointer(0x0037d948, 0x2EC)) + bit1(followPointer(0x0037d948, 0x2ED)) + bit0(followPointer(0x0037d948, 0x2F7)) +
                          bit1(followPointer(0x0037d948, 0x2F7)) + bit2(followPointer(0x0037d948, 0x2F7))
achievement("Ready to Leave the Nest",
            description="Complete all goals at Mom's House",
            points=3,
            trigger=didNotCheat() && inGame() && prev(goalsAtMoms()) == 4 && goalsAtMoms() == 5
)

function goalsAtMimis() => bit6(followPointer(0x0037d948, 0x2EB)) + bit7(followPointer(0x0037d948, 0x2EB)) + bit6(followPointer(0x0037d948, 0x2ED)) + bit7(followPointer(0x0037d948, 0x2ED)) + 
                           bit5(followPointer(0x0037d948, 0x2EE)) + bit4(followPointer(0x0037d948, 0x2EE)) + bit1(followPointer(0x0037d948, 0x2F2)) + bit4(followPointer(0x0037d948, 0x2F2)) + 
                           bit6(followPointer(0x0037d948, 0x2F4)) + bit1(followPointer(0x0037d948, 0x2F7)) + bit5(followPointer(0x0037d948, 0x2F9)) + bit1(followPointer(0x0037d948, 0x301))
 achievement("A Human Size Dollhouse",
            description="Complete all goals at Mimi’s Place",
            points=10,
            trigger=didNotCheat() && inGame() && prev(goalsAtMimis()) == 11 && goalsAtMimis() == 12
)

function goalsAtDudleys() => bit5(followPointer(0x0037d948, 0x2E8)) + bit7(followPointer(0x0037d948, 0x2E8)) + bit4(followPointer(0x0037d948, 0x2EE)) + bit6(followPointer(0x0037d948, 0x2EE)) + 
                             bit0(followPointer(0x0037d948, 0x2EF)) + bit1(followPointer(0x0037d948, 0x2EF)) + bit3(followPointer(0x0037d948, 0x2F0)) + bit1(followPointer(0x0037d948, 0x2F1)) + 
                             bit2(followPointer(0x0037d948, 0x2F1)) + bit4(followPointer(0x0037d948, 0x2F5)) + bit5(followPointer(0x0037d948, 0x2F5)) + bit4(followPointer(0x0037d948, 0x2F7)) + 
                             bit5(followPointer(0x0037d948, 0x2F9)) + bit6(followPointer(0x0037d948, 0x2F9)) + bit0(followPointer(0x0037d948, 0x301))
achievement("Dude I Love You but This Trailer’s Got to Go!",
            description="Complete all goals at Dudley’s Trailer",
            points=10,
            trigger=didNotCheat() && inGame() && prev(goalsAtDudleys()) == 14 && goalsAtDudleys() == 15
)

function anyPromotion() => prev(word_be(followPointer(0x0037d948, 0x17A))) >= 1 && 1 + prev(word_be(followPointer(0x0037d948, 0x17A))) == word_be(followPointer(0x0037d948, 0x17A)) ||
                           prev(word_be(followPointer(0x0037d948, 0x17C))) >= 1 && 1 + prev(word_be(followPointer(0x0037d948, 0x17C))) == word_be(followPointer(0x0037d948, 0x17C)) ||
                           prev(word_be(followPointer(0x0037d948, 0x17E))) >= 1 && 1 + prev(word_be(followPointer(0x0037d948, 0x17E))) == word_be(followPointer(0x0037d948, 0x17E)) ||
                           prev(word_be(followPointer(0x0037d948, 0x180))) >= 1 && 1 + prev(word_be(followPointer(0x0037d948, 0x180))) == word_be(followPointer(0x0037d948, 0x180)) ||
                           prev(word_be(followPointer(0x0037d948, 0x182))) >= 1 && 1 + prev(word_be(followPointer(0x0037d948, 0x182))) == word_be(followPointer(0x0037d948, 0x182)) ||
                           prev(word_be(followPointer(0x0037d948, 0x184))) >= 1 && 1 + prev(word_be(followPointer(0x0037d948, 0x184))) == word_be(followPointer(0x0037d948, 0x184)) ||
                           prev(word_be(followPointer(0x0037d948, 0x186))) >= 1 && 1 + prev(word_be(followPointer(0x0037d948, 0x186))) == word_be(followPointer(0x0037d948, 0x186))
achievement("Climbing the Corporate Ladder", description="Get a promotion", points=1,
            trigger=didNotCheat() && inGame() && anyPromotion()
)

achievement("My Qualifications? I Wove Many a Basket in My Days!",
            description="Get promoted to Massage Therapist in the Counter Culture Career path",
            points=5,
            trigger=didNotCheat() && inGame() && prev(word_be(followPointer(0x0037d948, 0x17A))) == 4 && word_be(followPointer(0x0037d948, 0x17A)) == 5
)

achievement("Staying Off-the-Grid",
            description="Get promoted to Full Time Freak in the Counter Culture Career path",
            points=10,
            trigger=didNotCheat() && inGame() && prev(word_be(followPointer(0x0037d948, 0x17A))) == 9 && word_be(followPointer(0x0037d948, 0x17A)) == 10
)

achievement("At Least I Won’t Get in Someone’s Hair",
            description="Get promoted to Wig Designer in the Fashion Victim Career path",
            points=5,
            trigger=didNotCheat() && inGame() && prev(word_be(followPointer(0x0037d948, 0x17A))) == 4 && word_be(followPointer(0x0037d948, 0x17A)) == 5
)

achievement("Now Call Us the Big Seven",
            description="Get promoted to Super Model in the Fashion Victim Career path",
            points=10,
            trigger=didNotCheat() && inGame() && prev(word_be(followPointer(0x0037d948, 0x17A))) == 9 && word_be(followPointer(0x0037d948, 0x17A)) == 10
)

achievement("Stick ‘Em Up",
            description="Get promoted to Mugger in the Gangster Career path",
            points=5,
            trigger=didNotCheat() && inGame() && prev(word_be(followPointer(0x0037d948, 0x17A))) == 4 && word_be(followPointer(0x0037d948, 0x17A)) == 5
)

achievement("The Godfather",
            description="Get promoted to Mob Boss in the Gangster Career path",
            points=10,
            trigger=didNotCheat() && inGame() && prev(word_be(followPointer(0x0037d948, 0x17A))) == 9 && word_be(followPointer(0x0037d948, 0x17A)) == 10
)

achievement("Joining the Big Leagues",
            description="Get promoted to All-Star in the Jock Career path",
            points=5,
            trigger=didNotCheat() && inGame() && prev(word_be(followPointer(0x0037d948, 0x17A))) == 4 && word_be(followPointer(0x0037d948, 0x17A)) == 5
)

achievement("Ready to Star in Space Jam 3",
            description="Get promoted to Living Legend in the Jock Career path",
            points=10,
            trigger=didNotCheat() && inGame() && prev(word_be(followPointer(0x0037d948, 0x17A))) == 9 && word_be(followPointer(0x0037d948, 0x17A)) == 10
)

achievement("Say My Name!",
            description="Get promoted to Chemist in the Mad Scientist Career path",
            points=5,
            trigger=didNotCheat() && inGame() && prev(word_be(followPointer(0x0037d948, 0x17A))) == 4 && word_be(followPointer(0x0037d948, 0x17A)) == 5
)

achievement("I’m This Close to a Death Star",
            description="Get promoted to Death Ray Inventor in the Mad Scientist Career path",
            points=10,
            trigger=didNotCheat() && inGame() && prev(word_be(followPointer(0x0037d948, 0x17A))) == 9 && word_be(followPointer(0x0037d948, 0x17A)) == 10
)

achievement("Days of Our Lives",
            description="Get promoted to Soap Opera Extra in the Movie Star Career path",
            points=5,
            trigger=didNotCheat() && inGame() && prev(word_be(followPointer(0x0037d948, 0x17A))) == 4 && word_be(followPointer(0x0037d948, 0x17A)) == 5
)

achievement("I Basically Own Hollywood",
            description="Get promoted to Movie Mogul in the Movie Star Career path",
            points=10,
            trigger=didNotCheat() && inGame() && prev(word_be(followPointer(0x0037d948, 0x17A))) == 9 && word_be(followPointer(0x0037d948, 0x17A)) == 10
)

achievement("Intrinsic Part of the Extraction Team",
            description="Get promoted to Chopper Pilot in the Paramilitary Career path",
            points=5,
            trigger=didNotCheat() && inGame() && prev(word_be(followPointer(0x0037d948, 0x17A))) == 4 && word_be(followPointer(0x0037d948, 0x17A)) == 5
)

achievement("On Top of the Chain of Command",
            description="Get promoted to War Minister in the Paramilitary Career path",
            points=10,
            trigger=didNotCheat() && inGame() && prev(word_be(followPointer(0x0037d948, 0x17A))) == 9 && word_be(followPointer(0x0037d948, 0x17A)) == 10
)

achievement("Chef de Partie", 
            description="Reach level 5 in the Cooking skill", 
            points=5, 
            trigger=didNotCheat() && inGame() && 
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x24))) >= 450 &&
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x24))) < 500 &&
                    word_be(followPointer(followPointer(0x2e679c, 0x188), 0x24)) >= 500
)

achievement("Head Chef", 
            description="Max out your Cooking skill", 
            points=10, 
            trigger=didNotCheat() && inGame() && 
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x24))) >= 950 &&
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x24))) < 1000 &&
                    word_be(followPointer(followPointer(0x2e679c, 0x188), 0x24)) == 1000
)

achievement("Finger Painter", 
            description="Reach level 5 in the Creativity skill", 
            points=5, 
            trigger=didNotCheat() && inGame() && 
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x2E))) >= 450 &&
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x2E))) < 500 &&
                    word_be(followPointer(followPointer(0x2e679c, 0x188), 0x2E)) >= 500
)

achievement("Master of All Arts", 
            description="Max out your Creativity skill", 
            points=10, 
            trigger=didNotCheat() && inGame() && 
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x2E))) >= 950 &&
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x2E))) < 1000 &&
                    word_be(followPointer(followPointer(0x2e679c, 0x188), 0x2E)) == 1000
)

achievement("Tinkerer", 
            description="Reach level 5 in the Mechanical skill", 
            points=5, 
            trigger=didNotCheat() && inGame() && 
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x28))) >= 450 &&
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x28))) < 500 &&
                    word_be(followPointer(followPointer(0x2e679c, 0x188), 0x28)) >= 500
)

achievement("Real Life MacGyver", 
            description="Max out your Mechanical skill", 
            points=10, 
            trigger=didNotCheat() && inGame() && 
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x28))) >= 950 &&
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x28))) < 1000 &&
                    word_be(followPointer(followPointer(0x2e679c, 0x188), 0x28)) == 1000
)

achievement("Sudoku Solver", 
            description="Reach level 5 in the Logic skill", 
            points=5, 
            trigger=didNotCheat() && inGame() && 
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x34))) >= 450 &&
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x34))) < 500 &&
                    word_be(followPointer(followPointer(0x2e679c, 0x188), 0x34)) >= 500
)

achievement("Puzzle Master", 
            description="Max out your Logic skill", 
            points=10, 
            trigger=didNotCheat() && inGame() && 
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x34))) >= 950 &&
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x34))) < 1000 &&
                    word_be(followPointer(followPointer(0x2e679c, 0x188), 0x34)) == 1000
)

achievement("Abs Carver", 
            description="Reach level 5 in the Body skill", 
            points=5, 
            trigger=didNotCheat() && inGame() && 
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x32))) >= 450 &&
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x32))) < 500 &&
                    word_be(followPointer(followPointer(0x2e679c, 0x188), 0x32)) >= 500
)

achievement("Bodybuilder", 
            description="Max out your Body skill", 
            points=10, 
            trigger=didNotCheat() && inGame() && 
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x32))) >= 950 &&
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x32))) < 1000 &&
                    word_be(followPointer(followPointer(0x2e679c, 0x188), 0x32)) == 1000
)
        
achievement("Smooth Talker", 
            description="Reach level 5 in the Charisma skill", 
            points=5,
            trigger=didNotCheat() && inGame() && 
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x26))) >= 450 &&
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x26))) < 500 &&
                    word_be(followPointer(followPointer(0x2e679c, 0x188), 0x26)) >= 500
)

achievement("Magnetic Personality", 
            description="Max out your Charisma skill", 
            points=10, 
            trigger=didNotCheat() && inGame() && 
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x26))) >= 950 &&
                    prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x26))) < 1000 &&
                    word_be(followPointer(followPointer(0x2e679c, 0x188), 0x26)) == 1000
)

achievement("Developing Life Skills", 
            description="Upgrade a skill", 
            points=1, 
            trigger=didNotCheat() && inGame() && 
                    (prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x24))) > 50 &&
                     (1 + prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x24))) / 100) == word_be(followPointer(followPointer(0x2e679c, 0x188), 0x24)) / 100 ||
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x26))) > 50 &&
                     1 + prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x26))) / 100 == word_be(followPointer(followPointer(0x2e679c, 0x188), 0x26)) / 100 ||
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x28))) > 50 &&
                     1 + prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x28))) / 100 == word_be(followPointer(followPointer(0x2e679c, 0x188), 0x28)) / 100 ||
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x2E))) > 50 &&
                     1 + prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x2E))) / 100 == word_be(followPointer(followPointer(0x2e679c, 0x188), 0x2E)) / 100 ||
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x32))) > 50 &&
                     1 + prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x32))) / 100 == word_be(followPointer(followPointer(0x2e679c, 0x188), 0x32)) / 100 ||
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x34))) > 50 &&
                     1 + prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x34))) / 100 == word_be(followPointer(followPointer(0x2e679c, 0x188), 0x34)) / 100)
)


achievement("Basement Dweller", 
            description="Max out all six skills before choosing your first job at Mom's House",
            points=10,
            trigger=didNotCheat() && inGame() && bit6(followPointer(0x0037d948, 0x2EC)) == 0 && 
                    trigger_when(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x24)) == 1000) &&
                    trigger_when(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x26)) == 1000) &&
                    trigger_when(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x28)) == 1000) &&
                    trigger_when(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x2E)) == 1000) &&
                    trigger_when(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x32)) == 1000) &&
                    trigger_when(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x34)) == 1000) &&                    
                    (prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x24))) >= 950 &&
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x24))) < 1000 ||
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x26))) >= 950 &&
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x26))) < 1000 ||
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x28))) >= 950 &&
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x28))) < 1000 ||
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x2E))) >= 950 &&
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x2E))) < 1000 ||
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x32))) >= 950 &&
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x32))) < 1000 ||
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x34))) >= 950 &&
                     prev(word_be(followPointer(followPointer(0x2e679c, 0x188), 0x34))) < 1000)                    
)

