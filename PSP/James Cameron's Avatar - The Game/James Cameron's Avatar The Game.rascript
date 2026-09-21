// James Cameron's Avatar: The Game
// #ID = 21931

function followPointer(base, offset) => (dword(base) & 0x1ffffff) + offset

rich_presence_display("Orbs total = {0}",
    rich_presence_macro("Number", bitcount(followPointer(followPointer(followPointer(0xf1b6f4, 0x2d0), 0x6fc), 0x62))
                                  + bitcount(followPointer(followPointer(followPointer(0xf1b6f4, 0x2d0), 0x6fc), 0x61))  
                                  + bitcount(followPointer(followPointer(followPointer(0xf1b6f4, 0x2d0), 0x6fc), 0x60))  
                                  + bitcount(followPointer(followPointer(followPointer(0xf1b6f4, 0x2d0), 0x6fc), 0x63))  
                                  + bitcount(followPointer(followPointer(followPointer(0xf1b6f4, 0x2d0), 0x6fc), 0x64))  
                                  + bitcount(followPointer(followPointer(followPointer(0xf1b6f4, 0x2d0), 0x6fc), 0x65))
                                  + bitcount(followPointer(followPointer(followPointer(0xf1b6f4, 0x2d0), 0x6fc), 0x6))  
    )
)


// I:0xX00f1b6f4&33554431_I:0xX000002d0&33554431_I:0xX000006fc&33554431_0xX00000060=1