// Golden Sun
// #ID = 767

achievementsetluckoftheadepts = achievement_set("Luck of the Adepts", type="BONUS", id=38643)

CharIDLookup = {
    0x00: "Isaac",
    0x01: "Garet",
    0x02: "Ivan",
    0x03: "Mia",
    0x04: "Felix",
    0x05: "Jenna",
    0x06: "Sheba",
}

achievement(
    title = "Washed Away", points = 2, type="progression",
    description = "Survive the incident",
    id = 15732, badge = "110204", published = "18/10/2014 21:11:42", modified = "05/08/2021 05:12:42",
    trigger = bit4(0x008146) < prev(bit4(0x008146)) && prior(dword(0x008400)) == 1245189 && dword(0x008400) == 65536
)

achievement(
    title = "The Origins of Alchemy", points = 3, type="progression",
    description = "Find the heart of the Sol Sanctum",
    id = 15733, badge = "110205", published = "18/10/2014 21:47:52", modified = "01/06/2024 10:30:44",
    trigger = bit3(0x008147) == 1 && prev(bit3(0x008147)) == 0 && dword(0x008400) == 655377
)

achievement(
    title = "The Windseer", points = 5, type="progression",
    description = "Recruit Ivan",
    id = 16363, badge = "110206", published = "29/10/2014 19:55:41", modified = "18/07/2020 12:41:53",
    trigger = bit2(0x008040) > prior(bit2(0x008040)) && bit6(0x00814A) > prev(bit6(0x00814A)) &&
              dword(0x008400) == 655381 && prev(dword(0x008400)) != 65537
)

achievement(
    title = "Out of Order", points = 25, type="missable",
    description = "Complete the Mercury Lighthouse before fighting Tret",
    id = 34238, badge = "110263", published = "02/04/2016 19:28:27", modified = "28/02/2020 18:01:26",
    trigger = bit0(0x008150) == 1 && bit1(0x008150) == 1 && byte(0x008150) != 255 && bit4(0x008148) == 0
)

achievement(
    title = "The Cursed Tree", points = 5, type="progression",
    description = "Defeat Tret",
    id = 16417, badge = "110240", published = "30/10/2014 02:26:34", modified = "28/02/2020 18:00:50",
    trigger = bit4(0x008148) > prev(bit4(0x008148)) && prior(dword(0x008400)) == 6947326 && dword(0x008400) == 1245229
)

achievement(
    title = "Cleansing Light", points = 10, type="progression",
    description = "Complete the Mercury Lighthouse",
    id = 34217, badge = "110242", published = "02/04/2016 19:21:57", modified = "18/07/2020 14:37:31",
    trigger = bit0(0x008150) > prev(bit0(0x008150)) && bit1(0x008150) > prev(bit1(0x008150)) &&
              dword(0x008400) == 131130 && prior(dword(0x008400)) == 7078398
)

achievement(
    title = "Phrasing?!", points = 5, type="missable",
    description = "Get rewarded for saving a girl from being washed downstream",
    id = 34226, badge = "110251", published = "02/04/2016 19:26:31", modified = "18/07/2020 14:42:10",
    trigger = bit1(0x008149) > prev(bit1(0x008149)) && (dword(0x008400) == 65571 || dword(0x008400) == 131107) &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "Killer Kong", points = 10, type="progression",
    description = "Defeat the beast of Mogall Forest",
    id = 34218, badge = "110243", published = "02/04/2016 19:22:42", modified = "18/07/2020 14:00:25",
    trigger = bit6(0x008153) > prev(bit6(0x008153)) && prior(dword(0x008400)) == 9110014 && dword(0x008400) == 983110
)

achievement(
    title = "May the Force Not Be With You", points = 10, type="missable",
    description = "Clear the way to the ruins in Altin Peak before picking up the Orb of Force in Fuchin Falls",
    id = 34239, badge = "110264", published = "02/04/2016 19:28:31", modified = "28/05/2024 14:10:39",
    trigger = prev(bit0(0x008161)) == 0 && bit0(0x008161) == 1 && byte(0x008161) != 255 && bit4(0x008222) == 0 &&
              dword(0x008400) == 262229
)

achievement(
    title = "Dry Season", points = 10, type="progression",
    description = "Save Altin from the floods",
    id = 34219, badge = "110244", published = "02/04/2016 19:22:46", modified = "18/07/2020 14:25:37",
    trigger = bit1(0x008161) > prev(bit1(0x008161)) && prior(dword(0x008400)) == 10355198 && dword(0x008400) == 6488150
)

achievement(
    title = "Do You Even Lift?", points = 5, type="missable",
    description = "Rescue Hsu",
    id = 34227, badge = "110252", published = "02/04/2016 19:26:39", modified = "18/07/2020 14:46:52",
    trigger = dword(0x008400) == 196696 && bit2(0x008156) == 1
)

achievement(
    title = "Poison Tail", points = 10, type="progression",
    description = "Defeat the Manticore",
    id = 34220, badge = "110245", published = "02/04/2016 19:22:53", modified = "28/02/2020 18:00:58",
    trigger = bit2(0x008161) == 1 && byte(0x008161) != 255 && byte(0x008400) == 91
)

achievement(
    title = "Competently Incompetent", points = 5, type="missable",
    description = "Pick an imbalanced rowing team and explore the uncharted island",
    id = 34230, badge = "110255", published = "02/04/2016 19:27:00", modified = "28/02/2020 18:01:12",
    trigger = once(word(0x008400) == 109) && dword(0x008400) == 65649 && prev(dword(0x008400)) == 4849666 &&
              never(dword(0x008400) == 65537)
)

achievement(
    title = "Drenched", points = 10, type="progression",
    description = "Slay the Kraken",
    id = 34221, badge = "110246", published = "02/04/2016 19:23:01", modified = "28/02/2020 18:01:00",
    trigger = bit0(0x008165) == 1 && bit1(0x008165) == 1 && bit2(0x008165) == 1 && bit3(0x008165) == 1 &&
              byte(0x008165) != 255 && byte(0x008400) == 109
)

achievement(
    title = "Colosso King", points = 10, type="missable",
    description = "Win the Colosso Finals",
    id = 34222, badge = "110247", published = "02/04/2016 19:25:36", modified = "18/07/2020 17:44:04",
    trigger = bit6(0x008161) == 1 && bit7(0x008161) == 1 && bit0(0x00816A) > prev(bit0(0x00816A)) &&
              bit1(0x00816A) > prev(bit1(0x00816A)) && dword(0x008400) == 6488202
)

achievement(
    title = "Run, Isaac, Run!", points = 10, type="missable",
    description = "Outrun the Storm Lizard's tornado and escape Suhalla Desert",
    id = 34224, badge = "110249", published = "02/04/2016 19:25:54", modified = "29/03/2020 08:12:44",
    trigger = bit7(0x008176) == 0 && dword(0x008400) == 3604482
)

achievement(
    title = "Tornado DDT", points = 10,
    description = "Defeat the Storm Lizard",
    id = 34223, badge = "110248", published = "02/04/2016 19:25:45", modified = "26/04/2024 17:06:35",
    trigger = bit7(0x008176) == 1 && byte(0x008176) != 255 && byte(0x008400) == 165
)

achievement(
    title = "Red Mist", points = 10,
    description = "Defeat the Tempest Lizard",
    id = 34225, badge = "110250", published = "02/04/2016 19:26:01", modified = "27/04/2023 01:41:20",
    trigger = prev(dword(0x008400)) == 18940414 &&
              ((dword(0x008400) == 196773 && bit4(0x0080A2) == 1) ||
               (word(0x008400) == 2 && bit1(0x00809E) == 1))
)

achievement(
    title = "Mad Dash", points = 5,
    description = "Find out what happened to the Bandit Trio",
    id = 34228, badge = "110253", published = "02/04/2016 19:26:46", modified = "14/01/2021 12:41:12",
    trigger = bit0(0x00814D) == 1 && byte(0x00814D) != 255 && byte(0x039067) == 1 && byte(0x008400) == 24
)

achievement(
    title = "Worried Sick", points = 5,
    description = "Check in on Dora",
    id = 34229, badge = "110254", published = "02/04/2016 19:26:50", modified = "28/02/2020 18:01:11",
    trigger = bit6(0x008143) == 1 && byte(0x008143) != 255 && byte(0x008400) == 8
)

achievement(
    title = "Dark Blessing", points = 10,
    description = "Rescue Lord Hammet",
    id = 34231, badge = "110256", published = "02/04/2016 19:27:05", modified = "29/03/2020 06:11:30",
    trigger = dword(0x008400) == 262307 && bit2(0x008168) == 1 && bit1(0x008168) == 1
)

achievement(
    title = "Praise the Sun!", points = 25, type="win_condition",
    description = "Defeat the final boss and complete the game",
    id = 16412, badge = "110235", published = "30/10/2014 01:48:46", modified = "27/11/2022 22:03:57",
    trigger = byte(0x0388B0) == 0 && byte(0x0388B1) == 0 && prior(dword(0x008400)) != 65726 &&
              prior(dword(0x008400)) != 524478 && dword(0x008400) != 524478 && bit4(0x008112) > prev(bit4(0x008112)) &&
              word(0x008400) == 510
)

achievement(
    title = "Pirate's Treasure", points = 25,
    description = "Defeat Deadbeard and obtain his treasure",
    id = 34232, badge = "110257", published = "02/04/2016 19:27:15", modified = "28/02/2020 18:01:17",
    trigger = bit1(0x00815A) == 1 && bit6(0x00821C) == 1 && byte(0x008400) == 125
)

achievement(
    title = "Battle Seeker", points = 5,
    description = "Defeat 3 consecutive hordes of enemies in Battle Mode",
    id = 16413, badge = "110236", published = "30/10/2014 02:11:56", modified = "29/04/2024 13:38:40",
    trigger = measured(byte(0x0084EA) == 3) && prev(byte(0x0084EA)) == 2 && dword(0x008400) == 524478
)

achievement(
    title = "Battle Master", points = 10,
    description = "Defeat 10 consecutive hordes of enemies in Battle Mode",
    id = 16414, badge = "110237", published = "30/10/2014 02:11:58", modified = "29/04/2024 13:38:51",
    trigger = measured(byte(0x0084EA) == 10) && prev(byte(0x0084EA)) == 9 && dword(0x008400) == 524478
)

achievement(
    title = "Battle God", points = 10,
    description = "Defeat 15 consecutive hordes of enemies in Battle Mode",
    id = 16415, badge = "110238", published = "30/10/2014 02:12:01", modified = "29/04/2024 13:39:02",
    trigger = measured(byte(0x0084EA) == 15) && prev(byte(0x0084EA)) == 14 && dword(0x008400) == 524478
)

achievement(
    title = "Lord of Gods", points = 25,
    description = "Defeat 25 consecutive hordes of enemies in Battle Mode while Isaac is level 40 or higher",
    id = 16416, badge = "110239", published = "30/10/2014 02:12:04", modified = "29/04/2024 13:39:15",
    trigger = measured(byte(0x0084EA) == 25, when=byte(0x00850F) >= 40) &&
              prev(byte(0x0084EA)) == 24 && dword(0x008400) == 524478
)

achievement(
    title = "Mortal Danger", points = 10,
    description = "Obtain the Assassin Blade.",
    id = 34237, badge = "110262", published = "02/04/2016 19:28:20", modified = "17/01/2021 09:29:35",
    trigger = dword(0x008400) == 65725 && prev(dword(0x008400)) != 65537 && byte(0x007E30) == 23 &&
              prev(byte(0x007E30)) == 3
)

achievement(
    title = "Titan Blade", points = 10,
    description = "Obtain the Gaia Blade",
    id = 34235, badge = "110260", published = "02/04/2016 19:28:12", modified = "18/01/2021 08:39:32",
    trigger = (dword(0x008400) == 852154 || dword(0x008400) == 917690) && prev(dword(0x008400)) != 65537 &&
              bit6(0x008226) == 1 && prev(bit6(0x008226)) == 0
)

achievement(
    title = "Demon Fire", points = 10,
    description = "Obtain the Muramasa and the Cleric's Ring",
    id = 34236, badge = "110261", published = "02/04/2016 19:28:16", modified = "15/02/2021 20:56:12",
    trigger = (dword(0x008400) == 65659 || dword(0x008400) == 131195 || dword(0x008400) == 65658 || dword(0x008400) == 131194) &&
              prev(dword(0x008400)) != 65537 && (bit4(0x00821C) + bit0(0x00821C)) == 2 &&
              (prev(bit4(0x00821C)) + prev(bit0(0x00821C))) == 1
)

achievement(
    title = "Dance of Ashura", points = 10,
    description = "Obtain the Kikuichimonji",
    id = 34233, badge = "110258", published = "02/04/2016 19:28:04", modified = "10/02/2025 09:40:54",
    trigger = (prior(dword(0x008400)) == 1179831 || prior(dword(0x008400)) == 1048759 ||
                  prior(dword(0x008400)) == 1114295 || prior(dword(0x008400)) == 983223 ||
                  prior(dword(0x008400)) == 655543 || prior(dword(0x008400)) == 721079 ||
                  prior(dword(0x008400)) == 458936 || prior(dword(0x008400)) == 786615 ||
                  prior(dword(0x008400)) == 393399 || prior(dword(0x008400)) == 852151 ||
                  prior(dword(0x008400)) == 131255 || prior(dword(0x008400)) == 1245367 ||
                  prior(dword(0x008400)) == 65719 || prior(dword(0x008400)) == 65720 || prior(dword(0x008400)) == 196791 ||
                  prior(dword(0x008400)) == 327863 || prior(dword(0x008400)) == 262327 ||
                  prior(dword(0x008400)) == 196792 || prior(dword(0x008400)) == 131256 ||
                  prior(dword(0x008400)) == 655544 || prior(dword(0x008400)) == 327864 ||
                  prior(dword(0x008400)) == 524472 || prior(dword(0x008400)) == 590008 ||
                  prior(dword(0x008400)) == 721080 || prior(dword(0x008400)) == 458935 ||
                  prior(dword(0x008400)) == 917687 || prior(dword(0x008400)) == 262328 ||
                  prior(dword(0x008400)) == 524471 || prior(dword(0x008400)) == 393400 ||
                  prior(dword(0x008400)) == 1114297 || prior(dword(0x008400)) == 1048761 ||
                  prior(dword(0x008400)) == 917689 || prior(dword(0x008400)) == 262330 ||
                  prior(dword(0x008400)) == 655545 || prior(dword(0x008400)) == 393401 ||
                  prior(dword(0x008400)) == 590009 || prior(dword(0x008400)) == 196793 ||
                  prior(dword(0x008400)) == 327865 || prior(dword(0x008400)) == 131257 ||
                  prior(dword(0x008400)) == 262329 || prior(dword(0x008400)) == 65722 || prior(dword(0x008400)) == 65721 ||
                  prior(dword(0x008400)) == 196794 || prior(dword(0x008400)) == 131258 ||
                  prior(dword(0x008400)) == 1179834 || prior(dword(0x008400)) == 590010 ||
                  prior(dword(0x008400)) == 852153 || prior(dword(0x008400)) == 852154 ||
                  prior(dword(0x008400)) == 655546 || prior(dword(0x008400)) == 721082 ||
                  prior(dword(0x008400)) == 917690 || prior(dword(0x008400)) == 524474 ||
                  prior(dword(0x008400)) == 1245370 || prior(dword(0x008400)) == 458937 ||
                  prior(dword(0x008400)) == 327866 || prior(dword(0x008400)) == 721081 ||
                  prior(dword(0x008400)) == 458938 || prior(dword(0x008400)) == 786617 ||
                  prior(dword(0x008400)) == 1114298 || prior(dword(0x008400)) == 1507510 || prior(dword(0x008400)) == 393402
              ) && (word(0x038588) == 25 || word(0x03858A) == 25 || word(0x03858C) == 25 || word(0x03858E) == 25) &&
              (dword(0x008624) > prev(dword(0x008624)) || dword(0x008770) > prev(dword(0x008770)) ||
                  dword(0x0088BC) > prev(dword(0x0088BC)) || dword(0x008A08) > prev(dword(0x008A08))
              )
)

achievement(
    title = "RNG Goddess", points = 10,
    description = "Obtain the Blessed Mace",
    id = 34234, badge = "110259", published = "02/04/2016 19:28:09", modified = "15/02/2021 21:01:39",
    trigger = (prior(dword(0x008400)) == 1179831 || prior(dword(0x008400)) == 1048759 ||
                  prior(dword(0x008400)) == 1114295 || prior(dword(0x008400)) == 983223 ||
                  prior(dword(0x008400)) == 655543 || prior(dword(0x008400)) == 721079 ||
                  prior(dword(0x008400)) == 458936 || prior(dword(0x008400)) == 786615 ||
                  prior(dword(0x008400)) == 393399 || prior(dword(0x008400)) == 852151 ||
                  prior(dword(0x008400)) == 131255 || prior(dword(0x008400)) == 1245367 ||
                  prior(dword(0x008400)) == 65719 || prior(dword(0x008400)) == 65720 || prior(dword(0x008400)) == 196791 ||
                  prior(dword(0x008400)) == 327863 || prior(dword(0x008400)) == 262327 ||
                  prior(dword(0x008400)) == 196792 || prior(dword(0x008400)) == 131256 ||
                  prior(dword(0x008400)) == 655544 || prior(dword(0x008400)) == 327864 ||
                  prior(dword(0x008400)) == 524472 || prior(dword(0x008400)) == 590008 ||
                  prior(dword(0x008400)) == 721080 || prior(dword(0x008400)) == 458935 ||
                  prior(dword(0x008400)) == 917687 || prior(dword(0x008400)) == 262328 ||
                  prior(dword(0x008400)) == 524471 || prior(dword(0x008400)) == 393400 ||
                  prior(dword(0x008400)) == 1114297 || prior(dword(0x008400)) == 1048761 ||
                  prior(dword(0x008400)) == 917689 || prior(dword(0x008400)) == 262330 ||
                  prior(dword(0x008400)) == 655545 || prior(dword(0x008400)) == 393401 ||
                  prior(dword(0x008400)) == 590009 || prior(dword(0x008400)) == 196793 ||
                  prior(dword(0x008400)) == 327865 || prior(dword(0x008400)) == 131257 ||
                  prior(dword(0x008400)) == 262329 || prior(dword(0x008400)) == 65722 || prior(dword(0x008400)) == 65721 ||
                  prior(dword(0x008400)) == 196794 || prior(dword(0x008400)) == 131258 ||
                  prior(dword(0x008400)) == 1179834 || prior(dword(0x008400)) == 590010 ||
                  prior(dword(0x008400)) == 852153 || prior(dword(0x008400)) == 852154 ||
                  prior(dword(0x008400)) == 655546 || prior(dword(0x008400)) == 721082 ||
                  prior(dword(0x008400)) == 917690 || prior(dword(0x008400)) == 524474 ||
                  prior(dword(0x008400)) == 1245370 || prior(dword(0x008400)) == 458937 ||
                  prior(dword(0x008400)) == 327866 || prior(dword(0x008400)) == 721081 ||
                  prior(dword(0x008400)) == 458938 || prior(dword(0x008400)) == 786617 ||
                  prior(dword(0x008400)) == 1114298 || prior(dword(0x008400)) == 393402 ||
                  prior(dword(0x008400)) == 19661310 || prior(dword(0x008400)) == 852141 ||
                  prior(dword(0x008400)) == 1048749
              ) && (word(0x038588) == 49 || word(0x03858A) == 49 || word(0x03858C) == 49 || word(0x03858E) == 49) &&
              (dword(0x008624) > prev(dword(0x008624)) || dword(0x008770) > prev(dword(0x008770)) ||
                  dword(0x0088BC) > prev(dword(0x0088BC)) || dword(0x008A08) > prev(dword(0x008A08))
              )
)

achievement(
    title = "Djinni Journey - Flint", points = 5,
    description = "Find Flint, the first Venus Djinni",
    id = 15734, badge = "110207", published = "18/10/2014 22:48:13", modified = "29/04/2024 13:40:34",
    trigger = bit0(0x008046) > prev(bit0(0x008046)) && bit0(0x0085F8) == 1 && dword(0x008400) == 65538 &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Granite", points = 5,
    description = "Find Granite, the second Venus Djinni",
    id = 15735, badge = "110208", published = "18/10/2014 23:50:34", modified = "29/04/2024 13:40:47",
    trigger = bit1(0x008046) > prev(bit1(0x008046)) && dword(0x008400) == 524324 && prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Quartz", points = 5,
    description = "Find Quartz, the third Venus Djinni",
    id = 15736, badge = "110209", published = "18/10/2014 23:50:36", modified = "29/04/2024 13:40:59",
    trigger = bit2(0x008046) > prev(bit2(0x008046)) &&
              (dword(0x008400) == 655429 || dword(0x008400) == 720965 || dword(0x008400) == 786501) &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Vine", points = 5,
    description = "Find Vine, the fourth Venus Djinni",
    id = 15737, badge = "110210", published = "18/10/2014 23:50:37", modified = "29/04/2024 13:41:12",
    trigger = bit3(0x008046) > prev(bit3(0x008046)) && prior(dword(0x008400)) == 23659006 && word(0x008400) == 2
)

achievement(
    title = "Djinni Journey - Sap", points = 5,
    description = "Find Sap, the fifth Venus Djinni",
    id = 15738, badge = "110211", published = "18/10/2014 23:50:39", modified = "29/04/2024 13:41:27",
    trigger = bit4(0x008046) > prev(bit4(0x008046)) && dword(0x008400) == 917527 && prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Ground", points = 5,
    description = "Find Ground, the sixth Venus Djinni",
    id = 15739, badge = "110212", published = "18/10/2014 23:50:41", modified = "29/04/2024 13:41:38",
    trigger = bit5(0x008046) > prev(bit5(0x008046)) && dword(0x008400) == 262251 && prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Bane", points = 5,
    description = "Find Bane, the seventh Venus Djinni",
    id = 15740, badge = "110213", published = "18/10/2014 23:50:42", modified = "29/04/2024 13:41:59",
    trigger = bit6(0x008046) > prev(bit6(0x008046)) && (dword(0x008400) == 65656 || dword(0x008400) == 131192) &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Forge", points = 5,
    description = "Find Forge, the first Mars Djinni",
    id = 16364, badge = "110214", published = "29/10/2014 20:41:26", modified = "29/04/2024 13:42:12",
    trigger = bit0(0x00804B) > prev(bit0(0x00804B)) && (dword(0x008400) == 196635 || dword(0x008400) == 131099) &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Fever", points = 5,
    description = "Find Fever, the second Mars Djinni",
    id = 16365, badge = "110215", published = "29/10/2014 20:41:27", modified = "29/04/2024 13:42:35",
    trigger = bit1(0x00804B) > prev(bit1(0x00804B)) && dword(0x008400) == 65588 && prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Corona", points = 5,
    description = "Find Corona, the third Mars Djinni",
    id = 16366, badge = "110216", published = "29/10/2014 20:41:29", modified = "29/04/2024 13:42:50",
    trigger = bit2(0x00804B) > prev(bit2(0x00804B)) && prior(dword(0x008400)) == 24379902 && word(0x008400) == 2
)

achievement(
    title = "Djinni Journey - Scorch", points = 5,
    description = "Find Scorch, the fourth Mars Djinni",
    id = 16367, badge = "110217", published = "29/10/2014 20:41:31", modified = "29/04/2024 13:43:16",
    trigger = bit3(0x00804B) > prev(bit3(0x00804B)) && (dword(0x008400) == 262300 || dword(0x008400) == 196764) &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Ember", points = 5,
    description = "Find Ember, the fifth Mars Djinni",
    id = 16368, badge = "110218", published = "29/10/2014 20:41:32", modified = "29/04/2024 13:43:27",
    trigger = bit4(0x00804B) > prev(bit4(0x00804B)) && word(0x008400) == 135 && prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Flash", points = 5,
    description = "Find Flash, the sixth Mars Djinni",
    id = 16369, badge = "110219", published = "29/10/2014 20:41:34", modified = "29/04/2024 13:43:40",
    trigger = bit5(0x00804B) > prev(bit5(0x00804B)) && prior(dword(0x008400)) == 24445438 &&
              (dword(0x008400) == 65701 || dword(0x008400) == 131237 || dword(0x008400) == 262309) &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Torch", points = 5,
    description = "Find Torch, the seventh Mars Djinni",
    id = 16370, badge = "110220", published = "29/10/2014 20:41:35", modified = "29/04/2024 13:43:54",
    trigger = bit6(0x00804B) > prev(bit6(0x00804B)) && dword(0x008400) == 721074 && prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Gust", points = 5,
    description = "Find Gust, the first Jupiter Djinni",
    id = 16371, badge = "110221", published = "29/10/2014 22:17:19", modified = "29/04/2024 13:44:05",
    trigger = bit4(0x00804D) > prev(bit4(0x00804D)) && dword(0x008400) == 196640 && prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Breeze", points = 5,
    description = "Find Breeze, the second Jupiter Djinni",
    id = 16399, badge = "110222", published = "30/10/2014 00:23:56", modified = "29/04/2024 13:44:16",
    trigger = bit5(0x00804D) > prev(bit5(0x00804D)) && (dword(0x008400) == 327726 || dword(0x008400) == 524334) &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Zephyr", points = 5,
    description = "Find Zephyr, the third Jupiter Djinni",
    id = 16400, badge = "110223", published = "30/10/2014 00:23:58", modified = "29/04/2024 13:44:28",
    trigger = bit6(0x00804D) > prev(bit6(0x00804D)) && (dword(0x008400) == 65599 || dword(0x008400) == 131135) &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Smog", points = 5,
    description = "Find Smog, the fourth Jupiter Djinni",
    id = 16401, badge = "110224", published = "30/10/2014 00:24:02", modified = "29/04/2024 13:44:45",
    trigger = bit7(0x00804D) > prev(bit7(0x00804D)) && (dword(0x008400) == 65626 || dword(0x008400) == 131162) &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Kite", points = 5,
    description = "Find Kite, the fifth Jupiter Djinni",
    id = 16402, badge = "110225", published = "30/10/2014 00:24:04", modified = "29/04/2024 13:44:57",
    trigger = bit0(0x00804E) > prev(bit0(0x00804E)) && (dword(0x008400) == 327774 || dword(0x008400) == 458846) &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Squall", points = 5,
    description = "Find Squall, the sixth Jupiter Djinni",
    id = 16403, badge = "110226", published = "30/10/2014 00:24:05", modified = "29/04/2024 13:45:09",
    trigger = bit1(0x00804E) > prev(bit1(0x00804E)) && (dword(0x008400) == 1966229 || dword(0x008400) == 2031765) &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Luff", points = 5,
    description = "Find Luff, the seventh Jupiter Djinni",
    id = 16404, badge = "110227", published = "30/10/2014 00:24:07", modified = "29/04/2024 13:45:33",
    trigger = bit2(0x00804E) > prev(bit2(0x00804E)) && dword(0x008400) == 786607 && prior(dword(0x008400)) == 24838654
)

achievement(
    title = "Djinni Journey - Fizz", points = 5,
    description = "Find Fizz, the first Mercury Djinni",
    id = 16405, badge = "110228", published = "30/10/2014 00:57:34", modified = "29/04/2024 13:45:46",
    trigger = bit4(0x008048) > prev(bit4(0x008048)) && bit0(0x0089E0) == 1 && dword(0x008400) == 589878 &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Sleet", points = 5,
    description = "Find Sleet, the second Mercury Djinni",
    id = 16406, badge = "110229", published = "30/10/2014 00:57:54", modified = "29/04/2024 13:45:59",
    trigger = bit5(0x008048) > prev(bit5(0x008048)) && dword(0x008400) == 655415 && prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Mist", points = 5,
    description = "Find Mist, the third Mercury Djinni",
    id = 16407, badge = "110230", published = "30/10/2014 00:57:56", modified = "29/04/2024 13:46:11",
    trigger = bit6(0x008048) > prev(bit6(0x008048)) && word(0x008400) == 72 && prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Spritz", points = 5,
    description = "Find Spritz, the fourth Mercury Djinni",
    id = 16408, badge = "110231", published = "30/10/2014 00:57:59", modified = "29/04/2024 13:46:24",
    trigger = bit7(0x008048) > prev(bit7(0x008048)) && (dword(0x008400) == 65619 || dword(0x008400) == 131155) &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Hail", points = 5,
    description = "Find Hail, the fifth Mercury Djinni",
    id = 16409, badge = "110232", published = "30/10/2014 00:58:03", modified = "29/04/2024 13:46:35",
    trigger = bit0(0x008049) > prev(bit0(0x008049)) && word(0x008400) == 2 && prior(dword(0x008400)) == 24052222
)

achievement(
    title = "Djinni Journey - Tonic", points = 5,
    description = "Find Tonic, the sixth Mercury Djinni",
    id = 16410, badge = "110233", published = "30/10/2014 00:58:06", modified = "29/04/2024 13:46:47",
    trigger = bit1(0x008049) > prev(bit1(0x008049)) && dword(0x008400) == 1507489 && prev(dword(0x008400)) != 65537
)

achievement(
    title = "Djinni Journey - Dew", points = 5,
    description = "Find Dew, the seventh Mercury Djinni",
    id = 16411, badge = "110234", published = "30/10/2014 00:58:09", modified = "29/04/2024 13:46:58",
    trigger = bit2(0x008049) > prev(bit2(0x008049)) && prior(dword(0x008400)) == 24117758 &&
              (dword(0x008400) == 196778 || dword(0x008400) == 262314 || dword(0x008400) == 327850) &&
              prev(dword(0x008400)) != 65537
)

achievement(
    title = "God of War", points = 50,
    description = "Defeat 50 hordes of enemies in Battle Mode while Isaac is level 40 or higher",
    id = 22701, badge = "110241", published = "10/05/2015 00:51:33", modified = "16/12/2020 21:12:07",
    trigger = word(0x0084EA) == 50 && prev(word(0x0084EA)) == 49 && dword(0x008400) == 524478 && byte(0x00850F) >= 40
)

leaderboard(
    id = 120361, title = "Lowest Level Run",
    description = "Complete the game with the lowest average Party Level you can manage!",
    start  = dword(0x008400) == 589824 && prior(dword(0x008400)) == 65724,
    cancel = always_false(),
    submit = always_true(),
    value  = measured((byte(0x00850F) / 4 + byte(0x00865B) / 4 + byte(0x0087A7) / 4 + byte(0x0088F3) / 4)),
    format = "VALUE", lower_is_better = true
)



rich_presence_conditional_display(word(0x8400) == 0, "On the Title Screen")
rich_presence_conditional_display(word(0x8400) == 1, "In the Main Menu")
rich_presence_conditional_display(word(0x8400) > 1, "{0} Lv {1}, {2} Lv {3}, {4} Lv {5}, {6} Lv {7}. IGT: {8}",
    rich_presence_lookup("CharID", byte(0x008438), CharIDLookup),
    rich_presence_value("Level", byte(0x00850F)),
    rich_presence_lookup("CharID", byte(0x008439), CharIDLookup),
    rich_presence_value("Level", byte(0x00865B)),
    rich_presence_lookup("CharID", byte(0x00843A), CharIDLookup),
    rich_presence_value("Level", byte(0x0087A7)),
    rich_presence_lookup("CharID", byte(0x00843B), CharIDLookup),
    rich_presence_value("Level", byte(0x0088F3)),
    rich_presence_value("Time", dword(0x001C9C), format="FRAMES")
)
rich_presence_display("Playing Golden Sun")

// CORE ADDITIONS
function location32(values){
    cond = always_false()
    for value in values
    {
       cond = cond || dword(0x8400) == value
    }
    return cond
}

function saveProtection() => prev(word(0x8400) != 0x0001)

function location(value) => word(0x8400) == value
function entrance(value) => word(0x8402) == value
    

achievement(title="Concealed Identity", points=1, type="missable",
            description="Before reaching the heart of Sol Sanctum with Kraden, talk to the strange masked man in Vale's inn",
            trigger=bit1(0x8141) == 0 && bit5(0x8040) == 1 && trigger_when(location(0x0008) && entrance(0x0008) && prev(word(0x381f4)) == 0x0000 && word(0x381f4) == 0x0010)
)

achievement(title="Treasures of the Sanctum", points=2, type="missable",
             description="Open every chest in Sol Sanctum",
             trigger=saveProtection() && prev(bit0(0x8228)) == 0 && location(0x000b) && measured(bit1(0x8220) + bit2(0x8220) + bit0(0x8228) == 3, when=bit2(0x8140) == 1 && bit1(0x814f) == 0) 
)

achievement(title="A Mayor's Reward", points=5, type="missable",
             description="Obtain a Water of Life from Vault's mayor after defeating the Bandits",
             trigger=saveProtection() && location(0x0015) && entrance(0x000a) && prev(bit7(0x814a)) == 0 && bit7(0x814a) == 1
)

achievement(title="Whispers of the Trees", points=1, type="missable",
            description="Use the Psynergy Mind Read and hear the inner voice of any of the Bilibin/Kolima NPCs who have been transformed into trees",
            trigger=(location(0x001e) && word(0x381f4) == 9 || location(0x0023) || location(0x0024) || location(0x0025)) && bit5(0x8148) == 0 && byte(0x3817e) == 0x8d && prev(word(0x2024)) == 0x15 && word(0x2024) == 0x0001
)

// SUBSET ACHIEVEMENTS

luckyFountainItems =  [
    ["Assassin Blade", 0x17, "Mortal Danger"],
    ["Earth Shield", 0x7c, ""],
    ["Spirit Armor", 0x51, ""],
    ["Adept's Helm", 0x98, ""],
    ["Burning Axe", 0x25, ""],
    ["Cocktail Dress", 0x91, ""],
    ["Glittering Tiara", 0xab, ""],
    ["Grievous Mace", 0x30, ""],
    ["Guardian Armlet", 0x8e, ""],
    ["Battle Gloves", 0x85, ""],
    ["Kimono", 0x61, ""],
    ["Ninja Hood", 0xa0, ""],
]

for luckyFountainItem in luckyFountainItems{
    achievement(
    title = luckyFountainItem[0], points = 5, set=achievementsetluckoftheadepts,
    description = "Win the " + luckyFountainItem[0] + " at the Lucky Fountain",    
    trigger = dword(0x008400) == 65725 && prev(dword(0x008400)) != 65537 && byte(0x007E30) == luckyFountainItem[1] &&
              prev(byte(0x007E30)) == 0x03
    )
}

