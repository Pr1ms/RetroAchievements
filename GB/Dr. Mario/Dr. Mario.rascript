// Dr. Mario
// #ID = 696

SpeedLookup = {
    0x04: "LOW",
    0x03: "MED",
    0x02: "HI",
}

MusicLookup = {
    0: "FEVER",
    1: "CHILL",
    2: "OFF",
}

PausedLookup = {
    1: "▌▌",
}

function notInDemo() => byte(0xffe4) == 0
function level() => byte(0xffc2)
function win() => prev(byte(0xffe1)) == 4 && byte(0xffe1) == 5 // prev(byte(0xffd1)) > 0 && byte(0xffd1) == 0
function speed() => byte(0xffad)

achievement(
    title = "Doctor, I Have a Problem", points = 1, type="progression",
    description = "Clear Level 0",
    id = 121313, badge = "617101", published = "10/08/2020 20:03:59", modified = "12/05/2021 20:46:25",
    trigger = notInDemo() && level() == 0 && win()
)

achievement(
    title = "Natural Remedies", points = 1, type="progression",
    description = "Clear Level 1",
    id = 121314, badge = "617102", published = "10/08/2020 20:04:11", modified = "12/05/2021 20:46:24",
    trigger = notInDemo() && level() == 1 && win()
)

achievement(
    title = "Getting Rest", points = 1, type="progression",
    description = "Clear Level 2",
    id = 121315, badge = "617103", published = "10/08/2020 20:04:16", modified = "12/05/2021 20:46:24",
    trigger = notInDemo() && level() == 2 && win()
)

achievement(
    title = "Chamomile", points = 1, type="progression",
    description = "Clear Level 3",
    id = 121316, badge = "617104", published = "10/08/2020 20:04:27", modified = "12/05/2021 20:46:24",
    trigger = notInDemo() && level() == 3 && win()
)

achievement(
    title = "Lavender", points = 1, type="progression",
    description = "Clear Level 4",
    id = 121317, badge = "617105", published = "10/08/2020 20:04:32", modified = "12/05/2021 20:46:23",
    trigger = notInDemo() && level() == 4 && win()
)

achievement(
    title = "Lemon Balm", points = 1, type="progression",
    description = "Clear Level 5",
    id = 121318, badge = "617107", published = "10/08/2020 20:04:36", modified = "12/05/2021 20:46:23",
    trigger = notInDemo() && level() == 5 && win()
)

achievement(
    title = "Peppermint", points = 1, type="progression",
    description = "Clear Level 6",
    id = 121319, badge = "617108", published = "10/08/2020 20:04:41", modified = "12/05/2021 20:46:23",
    trigger = notInDemo() && level() == 6 && win()
)

achievement(
    title = "Ginger", points = 2, type="progression",
    description = "Clear Level 7",
    id = 121320, badge = "617109", published = "10/08/2020 20:04:46", modified = "12/05/2021 20:46:22",
    trigger = notInDemo() && level() == 7 && win()
)

achievement(
    title = "Calendula", points = 2, type="progression",
    description = "Clear Level 8",
    id = 121321, badge = "617110", published = "10/08/2020 20:04:50", modified = "12/05/2021 20:46:22",
    trigger = notInDemo() && level() == 8 && win()
)

achievement(
    title = "Sage", points = 2, type="progression",
    description = "Clear Level 9",
    id = 121322, badge = "617111", published = "10/08/2020 20:04:54", modified = "12/05/2021 20:46:22",
    trigger = notInDemo() && level() == 9 && win()
)

achievement(
    title = "Nature Itself Is the Best Physician", points = 2, type="progression",
    description = "Clear Level 10",
    id = 121323, badge = "617112", published = "10/08/2020 20:04:58", modified = "12/05/2021 20:46:18",
    trigger = notInDemo() && level() == 10 && win()
)

achievement(
    title = "Yarrow", points = 2, type="progression",
    description = "Clear Level 11",
    id = 121324, badge = "617113", published = "10/08/2020 20:05:04", modified = "12/05/2021 20:46:21",
    trigger = notInDemo() && level() == 11 && win()
)

achievement(
    title = "Echinacea", points = 2, type="progression",
    description = "Clear Level 12",
    id = 121325, badge = "617114", published = "10/08/2020 20:05:09", modified = "12/05/2021 20:46:21",
    trigger = notInDemo() && level() == 12 && win()
)

achievement(
    title = "Elderberry", points = 2, type="progression",
    description = "Clear Level 13",
    id = 121326, badge = "617115", published = "10/08/2020 20:05:13", modified = "12/05/2021 20:46:20",
    trigger = notInDemo() && level() == 13 && win()
)

achievement(
    title = "Turmeric", points = 2, type="progression",
    description = "Clear Level 14",
    id = 121327, badge = "617116", published = "10/08/2020 20:05:17", modified = "12/05/2021 20:46:20",
    trigger = notInDemo() && level() == 14 && win()
)

achievement(
    title = "Feverfew", points = 3, type="progression",
    description = "Clear Level 15",
    id = 121328, badge = "617117", published = "10/08/2020 20:05:22", modified = "12/05/2021 20:46:20",
    trigger = notInDemo() && level() == 15 && win()
)

achievement(
    title = "Holy Basil", points = 3, type="progression",
    description = "Clear Level 16",
    id = 121329, badge = "617118", published = "10/08/2020 20:05:26", modified = "12/05/2021 20:46:19",
    trigger = notInDemo() && level() == 16 && win()
)

achievement(
    title = "Valerian", points = 3, type="progression",
    description = "Clear Level 17",
    id = 121330, badge = "617119", published = "10/08/2020 20:05:31", modified = "12/05/2021 20:46:19",
    trigger = notInDemo() && level() == 17 && win()
)

achievement(
    title = "Dandelion", points = 4, type="progression",
    description = "Clear Level 18",
    id = 121331, badge = "617120", published = "10/08/2020 20:05:36", modified = "12/05/2021 20:46:19",
    trigger = notInDemo() && level() == 18 && win()
)

achievement(
    title = "Yew", points = 4, type="progression",
    description = "Clear Level 19",
    id = 121309, badge = "617121", published = "10/08/2020 16:58:59", modified = "12/05/2021 20:46:25",
    trigger = notInDemo() && level() == 19 && win()
)

achievement(
    title = "The Pain Won't Stop", points = 5, type="win_condition",
    description = "Clear Level 20",
    id = 121308, badge = "617122", published = "10/08/2020 16:58:49", modified = "12/05/2021 20:46:25",
    trigger = notInDemo() && level() == 20 && win()
)

achievement(
    title = "We Need to Order More Tests ", points = 1,
    description = "Clear Level 0 on Medium speed or faster",
    id = 121332, badge = "617123", published = "10/08/2020 20:05:41", modified = "12/05/2021 20:46:26",
    trigger = notInDemo() && speed() <= 3 && level() == 0 && win()
)

achievement(
    title = "Over the Counter Medication", points = 1,
    description = "Clear Level 1 on Medium speed or faster",
    id = 121333, badge = "617124", published = "10/08/2020 20:05:45", modified = "12/05/2021 20:46:26",
    trigger = notInDemo() && speed() <= 3 && level() == 1 && win()
)

achievement(
    title = "Saline", points = 1,
    description = "Clear Level 2 on Medium speed or faster",
    id = 121334, badge = "617125", published = "10/08/2020 20:05:47", modified = "12/05/2021 20:46:26",
    trigger = notInDemo() && speed() <= 3 && level() == 2 && win()
)

achievement(
    title = "Vitamin C", points = 1,
    description = "Clear Level 3 on Medium speed or faster",
    id = 121335, badge = "617126", published = "10/08/2020 20:05:51", modified = "12/05/2021 20:46:27",
    trigger = notInDemo() && speed() <= 3 && level() == 3 && win()
)

achievement(
    title = "Antacid", points = 1,
    description = "Clear Level 4 on Medium speed or faster",
    id = 121336, badge = "617127", published = "10/08/2020 20:05:54", modified = "12/05/2021 20:46:27",
    trigger = notInDemo() && speed() <= 3 && level() == 4 && win()
)

achievement(
    title = "Acetaminophen", points = 2,
    description = "Clear Level 5 on Medium speed or faster",
    id = 121337, badge = "617128", published = "10/08/2020 20:05:57", modified = "12/05/2021 20:46:27",
    trigger = notInDemo() && speed() <= 3 && level() == 5 && win()
)

achievement(
    title = "Ibuprofen", points = 3,
    description = "Clear Level 6 on Medium speed or faster",
    id = 121338, badge = "617129", published = "10/08/2020 20:05:59", modified = "12/05/2021 20:46:28",
    trigger = notInDemo() && speed() <= 3 && level() == 6 && win()
)

achievement(
    title = "Aspirin", points = 3,
    description = "Clear Level 7 on Medium speed or faster",
    id = 121339, badge = "617130", published = "10/08/2020 20:06:02", modified = "12/05/2021 20:46:28",
    trigger = notInDemo() && speed() <= 3 && level() == 7 && win()
)

achievement(
    title = "Diphenhydramine", points = 3,
    description = "Clear Level 8 on Medium speed or faster",
    id = 121340, badge = "617131", published = "10/08/2020 20:06:04", modified = "12/05/2021 20:46:28",
    trigger = notInDemo() && speed() <= 3 && level() == 8 && win()
)

achievement(
    title = "Cough Syrup", points = 3,
    description = "Clear Level 9 on Medium speed or faster",
    id = 121341, badge = "617132", published = "10/08/2020 20:06:07", modified = "12/05/2021 20:46:29",
    trigger = notInDemo() && speed() <= 3 && level() == 9 && win()
)

achievement(
    title = "I Need a New Prescription ", points = 3,
    description = "Clear Level 10 on Medium speed or faster",
    id = 121342, badge = "617133", published = "10/08/2020 20:06:10", modified = "12/05/2021 20:46:29",
    trigger = notInDemo() && speed() <= 3 && level() == 10 && win()
)

achievement(
    title = "Decongestant", points = 3,
    description = "Clear Level 11 on Medium speed or faster",
    id = 121343, badge = "617134", published = "10/08/2020 20:06:13", modified = "12/05/2021 20:46:29",
    trigger = notInDemo() && speed() <= 3 && level() == 11 && win()
)

achievement(
    title = "Antiviral", points = 3,
    description = "Clear Level 12 on Medium speed or faster",
    id = 121344, badge = "617135", published = "10/08/2020 20:06:16", modified = "12/05/2021 20:46:30",
    trigger = notInDemo() && speed() <= 3 && level() == 12 && win()
)

achievement(
    title = "Insulin", points = 3,
    description = "Clear Level 13 on Medium speed or faster",
    id = 121345, badge = "617136", published = "10/08/2020 20:06:18", modified = "12/05/2021 20:46:30",
    trigger = notInDemo() && speed() <= 3 && level() == 13 && win()
)

achievement(
    title = "Steroids", points = 3,
    description = "Clear Level 14 on Medium speed or faster",
    id = 121346, badge = "617137", published = "10/08/2020 20:06:21", modified = "12/05/2021 20:46:30",
    trigger = notInDemo() && speed() <= 3 && level() == 14 && win()
)

achievement(
    title = "Morphine", points = 5,
    description = "Clear Level 15 on Medium speed or faster",
    id = 121347, badge = "617138", published = "10/08/2020 20:06:24", modified = "12/05/2021 20:46:31",
    trigger = notInDemo() && speed() <= 3 && level() == 15 && win()
)

achievement(
    title = "Rocuronium", points = 5,
    description = "Clear Level 16 on Medium speed or faster",
    id = 121348, badge = "617139", published = "10/08/2020 20:06:27", modified = "12/05/2021 20:46:31",
    trigger = notInDemo() && speed() <= 3 && level() == 16 && win()
)

achievement(
    title = "Midazolam", points = 5,
    description = "Clear Level 17 on Medium speed or faster",
    id = 121349, badge = "617140", published = "10/08/2020 20:06:29", modified = "12/05/2021 20:46:31",
    trigger = notInDemo() && speed() <= 3 && level() == 17 && win()
)

achievement(
    title = "Propofol", points = 5,
    description = "Clear Level 18 on Medium speed or faster",
    id = 121350, badge = "617141", published = "10/08/2020 20:06:31", modified = "12/05/2021 20:46:32",
    trigger = notInDemo() && speed() <= 3 && level() == 18 && win()
)

achievement(
    title = "Anesthetic", points = 10,
    description = "Clear Level 19 on Medium speed or faster",
    id = 121351, badge = "617142", published = "10/08/2020 20:06:33", modified = "12/05/2021 20:46:32",
    trigger = notInDemo() && speed() <= 3 && level() == 19 && win()
)

achievement(
    title = "Emergency Room ", points = 10,
    description = "Clear Level 20 on Medium speed or faster",
    id = 121352, badge = "617143", published = "10/08/2020 20:06:35", modified = "12/05/2021 20:46:32",
    trigger = notInDemo() && speed() <= 3 && level() == 20 && win()
)

achievement(
    title = "Doctor, It's Getting Worse... ", points = 1,
    description = "Clear Level 0 on High speed",
    id = 121353, badge = "617150", published = "10/08/2020 20:07:02", modified = "12/05/2021 20:46:33",
    trigger = notInDemo() && speed() == 2 && level() == 0 && win()
)

achievement(
    title = "Experimental Treatment", points = 1,
    description = "Clear Level 1 on High speed",
    id = 121354, badge = "617151", published = "10/08/2020 20:07:05", modified = "12/05/2021 20:46:33",
    trigger = notInDemo() && speed() == 2 && level() == 1 && win()
)

achievement(
    title = "Hoping for the Best", points = 1,
    description = "Clear Level 2 on High speed",
    id = 121355, badge = "617152", published = "10/08/2020 20:07:07", modified = "12/05/2021 20:46:33",
    trigger = notInDemo() && speed() == 2 && level() == 2 && win()
)

achievement(
    title = "Psychotherapy", points = 1,
    description = "Clear Level 3 on High speed",
    id = 121356, badge = "617153", published = "10/08/2020 20:07:10", modified = "12/05/2021 20:46:34",
    trigger = notInDemo() && speed() == 2 && level() == 3 && win()
)

achievement(
    title = "Hypnotherapy", points = 1,
    description = "Clear Level 4 on High speed",
    id = 121357, badge = "617154", published = "10/08/2020 20:07:12", modified = "12/05/2021 20:46:34",
    trigger = notInDemo() && speed() == 2 && level() == 4 && win()
)

achievement(
    title = "Acupuncture", points = 3,
    description = "Clear Level 5 on High speed",
    id = 121358, badge = "617155", published = "10/08/2020 20:07:15", modified = "12/05/2021 20:46:34",
    trigger = notInDemo() && speed() == 2 && level() == 5 && win()
)

achievement(
    title = "Aromatherapy", points = 4,
    description = "Clear Level 6 on High speed",
    id = 121359, badge = "617156", published = "10/08/2020 20:07:17", modified = "12/05/2021 20:46:35",
    trigger = notInDemo() && speed() == 2 && level() == 6 && win()
)

achievement(
    title = "Can't Give Up", points = 4,
    description = "Clear Level 7 on High speed",
    id = 121360, badge = "617157", published = "10/08/2020 20:07:20", modified = "12/05/2021 20:46:35",
    trigger = notInDemo() && speed() == 2 && level() == 7 && win()
)

achievement(
    title = "Trying Everything", points = 5,
    description = "Clear Level 8 on High speed",
    id = 121361, badge = "617158", published = "10/08/2020 20:07:22", modified = "12/05/2021 20:46:35",
    trigger = notInDemo() && speed() == 2 && level() == 8 && win()
)

achievement(
    title = "Nothing's Working", points = 5,
    description = "Clear Level 9 on High speed",
    id = 121362, badge = "617159", published = "10/08/2020 20:07:24", modified = "12/05/2021 20:46:36",
    trigger = notInDemo() && speed() == 2 && level() == 9 && win()
)

achievement(
    title = "Bedridden", points = 5,
    description = "Clear Level 10 on High speed",
    id = 121363, badge = "617160", published = "10/08/2020 20:07:27", modified = "12/05/2021 20:46:36",
    trigger = notInDemo() && speed() == 2 && level() == 10 && win()
)

achievement(
    title = "Immediate Intervention", points = 5,
    description = "Clear Level 11 on High speed",
    id = 121364, badge = "617161", published = "10/08/2020 20:07:29", modified = "12/05/2021 20:46:36",
    trigger = notInDemo() && speed() == 2 && level() == 11 && win()
)

achievement(
    title = "Virotherapy", points = 5,
    description = "Clear Level 12 on High speed",
    id = 121365, badge = "617162", published = "10/08/2020 20:07:33", modified = "12/05/2021 20:46:37",
    trigger = notInDemo() && speed() == 2 && level() == 12 && win()
)

achievement(
    title = "Signs of Improvement", points = 5,
    description = "Clear Level 13 on High speed",
    id = 121366, badge = "617163", published = "10/08/2020 20:07:36", modified = "12/05/2021 20:46:37",
    trigger = notInDemo() && speed() == 2 && level() == 13 && win()
)

achievement(
    title = "Turning Point", points = 5,
    description = "Clear Level 14 on High speed",
    id = 121367, badge = "617164", published = "10/08/2020 20:07:39", modified = "12/05/2021 20:46:37",
    trigger = notInDemo() && speed() == 2 && level() == 14 && win()
)

achievement(
    title = "Physical Rehabilitation", points = 10,
    description = "Clear Level 15 on High speed",
    id = 121368, badge = "617165", published = "10/08/2020 20:07:42", modified = "12/05/2021 20:46:38",
    trigger = notInDemo() && speed() == 2 && level() == 15 && win()
)

achievement(
    title = "Cognitive Reinforcement", points = 10,
    description = "Clear Level 16 on High speed",
    id = 121369, badge = "617166", published = "10/08/2020 20:07:44", modified = "12/05/2021 20:46:38",
    trigger = notInDemo() && speed() == 2 && level() == 16 && win()
)

achievement(
    title = "Routine Reintegration", points = 10,
    description = "Clear Level 17 on High speed",
    id = 121370, badge = "617167", published = "10/08/2020 20:07:46", modified = "12/05/2021 20:46:39",
    trigger = notInDemo() && speed() == 2 && level() == 17 && win()
)

achievement(
    title = "Independence Training", points = 10,
    description = "Clear Level 18 on High speed",
    id = 121371, badge = "617168", published = "10/08/2020 20:07:48", modified = "12/05/2021 20:46:39",
    trigger = notInDemo() && speed() == 2 && level() == 18 && win()
)

achievement(
    title = "Advance Care Planning", points = 25,
    description = "Clear Level 19 on High speed",
    id = 121372, badge = "617169", published = "10/08/2020 20:07:52", modified = "12/05/2021 20:46:39",
    trigger = notInDemo() && speed() == 2 && level() == 19 && win()
)

achievement(
    title = "A Full Recovery", points = 25,
    description = "Clear Level 20 on High speed",
    id = 121373, badge = "617170", published = "10/08/2020 20:07:54", modified = "12/05/2021 20:46:40",
    trigger = notInDemo() && speed() == 2 && level() == 20 && win()
)

// THE THREE MUSKETEERS
function gotACombo() => prev(word(0xdfe6)) == 0 && prev(word(0xdfee)) == 0 && 
                       (word(0xdfe6) == 0x61ab && word(0xdfee) == 0x61bf || word(0xdfe6) == 0x61d4 && word(0xdfee) == 0x61e0 || word(0xdfe6) == 0x61f1 && word(0xdfee) == 0x6201)
achievement(
    title = "Laceration", points = 3,
    description = "Create a combo",
    id = 121395, badge = "617144", published = "10/08/2020 21:46:10", modified = "12/05/2021 20:46:41",
    trigger = notInDemo() && gotACombo()
)

achievement(
    title = "[DEMOTED BY QA] Tommy John Surgery", points = 0,
    description = "Clear 5 sets of blocks with a single pill",
    id = 121396, badge = "617145", published = "10/08/2020 21:46:14", modified = "12/05/2021 20:46:41",
    trigger = notInDemo() && byte(0x00FFD8) >= 16
)

achievement(
    title = "[DEMOTED BY QA] Brain Surgery", points = 0,
    description = "Achieve a huge combo",
    id = 121397, badge = "617146", published = "10/08/2020 21:46:20", modified = "12/05/2021 20:46:42",
    trigger = notInDemo() && byte(0x00FFD8) >= 64
)

//
achievement(
    title = "Hand Transplant", points = 25,
    description = "Clear Level 21",
    id = 121438, badge = "617147", published = "10/08/2020 21:59:12", modified = "12/05/2021 20:46:42",
    trigger = notInDemo() && level() == 21 && win()
)

achievement(
    title = "Heart Transplant", points = 25,
    description = "Clear Level 21 on Medium speed or faster",
    id = 121440, badge = "617148", published = "10/08/2020 21:59:21", modified = "12/05/2021 20:46:43",
    trigger = notInDemo() && speed() <= 3 && level() == 21 && win()
)

achievement(
    title = "Head Transplant", points = 50,
    description = "Clear Level 21 on High speed",
    id = 121439, badge = "617149", published = "10/08/2020 21:59:16", modified = "12/05/2021 20:46:43",
    trigger = notInDemo() && speed() == 2 && level() == 21 && win()
)

leaderboard(
    id = 9390, title = "LOW",
    description = "Highest Level cleared",
    start  = notInDemo() && speed() == 4 && win(),
    cancel = always_false(),
    submit = always_true(),
    value  = level(),
    format = "VALUE"
)

leaderboard(
    id = 9391, title = "MED",
    description = "Highest Level cleared",
    start  = notInDemo() && speed() == 3 && win(),
    cancel = always_false(),
    submit = always_true(),
    value  = level(),
    format = "VALUE"
)

leaderboard(
    id = 9392, title = "HI",
    description = "Highest Level cleared",
    start  = notInDemo() && speed() == 2 && win(),
    cancel = always_false(),
    submit = always_true(),
    value  = level(),
    format = "VALUE"
)

rich_presence_conditional_display(byte(0x00FFE1) == 1, "💊Title Screen💊")

rich_presence_conditional_display(byte(0x00FFB1) == 1, "💊Competing with another Doctor💊")

rich_presence_conditional_display(byte(0xffe4) == 0, "💊Watching the Demo💊")

rich_presence_conditional_display(always_true() &&
    ((byte(0x00FFE1) == 4) ||
     (byte(0x00FFE1) == 10)), "💊Curing viruses! | Level {0}, Speed:{1} 🎼{2}",
    rich_presence_value("Digit", level()),
    rich_presence_lookup("Speed", byte(0x00FFAD), SpeedLookup),
    rich_presence_lookup("Music", byte(0x00FFC1), MusicLookup)
)

rich_presence_conditional_display(byte(0x00FFE1) == 5, "💊Round clear! | Level {0}, Speed:{1} 🎼{2}",
    rich_presence_value("Digit", level()),
    rich_presence_lookup("Speed", byte(0x00FFAD), SpeedLookup),
    rich_presence_lookup("Music", byte(0x00FFC1), MusicLookup)
)

rich_presence_conditional_display(byte(0x00FFE1) == 6, "💊It's a draw! | Level {0}, Speed:{1} 🎼{2}",
    rich_presence_value("Digit", level()),
    rich_presence_lookup("Speed", byte(0x00FFAD), SpeedLookup),
    rich_presence_lookup("Music", byte(0x00FFC1), MusicLookup)
)

rich_presence_conditional_display(byte(0x00FFE1) == 7, "💊Watching some underwater rewards | Level {0}, Speed:{1} 🎼{2}",
    rich_presence_value("Digit", level()),
    rich_presence_lookup("Speed", byte(0x00FFAD), SpeedLookup),
    rich_presence_lookup("Music", byte(0x00FFC1), MusicLookup)
)

rich_presence_conditional_display(byte(0x00FFE1) == 16, "💊Press Start to move on! | Level {0}, Speed:{1} 🎼{2}",
    rich_presence_value("Digit", level()),
    rich_presence_lookup("Speed", byte(0x00FFAD), SpeedLookup),
    rich_presence_lookup("Music", byte(0x00FFC1), MusicLookup)
)

rich_presence_conditional_display(byte(0x00FFE1) == 12, "💊Choosing Level | Level {0}, Speed:{1} 🎼{2}",
    rich_presence_value("Digit", level()),
    rich_presence_lookup("Speed", byte(0x00FFAD), SpeedLookup),
    rich_presence_lookup("Music", byte(0x00FFC1), MusicLookup)
)

rich_presence_conditional_display(byte(0x00FFE1) == 13, "💊Choosing Speed | Level {0}, Speed:{1} 🎼{2}",
    rich_presence_value("Digit", level()),
    rich_presence_lookup("Speed", byte(0x00FFAD), SpeedLookup),
    rich_presence_lookup("Music", byte(0x00FFC1), MusicLookup)
)

rich_presence_conditional_display(byte(0x00FFE1) == 14, "💊Choosing Music | Level {0}, Speed:{1} 🎼{2}",
    rich_presence_value("Digit", level()),
    rich_presence_lookup("Speed", byte(0x00FFAD), SpeedLookup),
    rich_presence_lookup("Music", byte(0x00FFC1), MusicLookup)
)

rich_presence_display("💊Playing Dr. Mario💊")
