# Castle of Illusion starring Mickey Mouse (Genesis/Mega Drive) - Dustoff

## Code notes
- Unused addresses with unclear description have been removed.
- Unused addresses with clear code notes have been rewritten when they were missing something (size, possible values and their meaning, etc.).
- Addresses with size and proper description have been kept as-is.
- One overused address with a code note that was using a question mark and missing key details has been deleted because other stable addresses could be used in its stead for better maintenability.

## Rich presence
- Added a default static RP.
- Added the score to the RP and added more precision to the location mainly to tell if the player is in a boss fight.

## Achievements

### Global changes
- All achievements have been demo-mode protected and can only trigger when alive.
- All measured flags have been removed from the achievements since the measured values were actually displayed in the game UI at all times.
- Achievements about stockpiling items (i.e. ammunition) have their mesured flag replaced by a trigger flag and a missable tag so that the player is made aware that they shouldn't use the items as projectiles if they want to unlock the achievment.

### Specific changes

#### [High-Powered Mouse](https://retroachievements.org/achievement/176)
Added a delta check on the Power value.

#### [Lucky Seven](https://retroachievements.org/achievement/177)
Added a delta check on the Tries count.

#### [Keeping the Doctor Away](https://retroachievements.org/achievement/58)
Added a delta check on the Items count. 
The removed Measured is replaced by a Trigger and missable tag.

#### [Marble Madness](https://retroachievements.org/achievement/4319)
Added a delta check on the Items count. 
The removed Measured is replaced by a Trigger and missable tag.

#### [Sorcerer's Apprentice](https://retroachievements.org/achievement/4343)
Added a delta check on the Items count. 
The removed Measured is replaced by a Trigger and missable tag.

#### [Rodent's Riches](https://retroachievements.org/achievement/4316)
- Rephrased the description to "Score **at least** 75,000 points" since the logics was using `>=`.
- Added a delta check on the Score.
- Changed the logic to use the actual recomputed score rather than its two addresses separately to ease future maintenance.

#### [Mouse-tacular](https://retroachievements.org/achievement/4317)
- Rephrased the description to "Score **at least** 150,000 points" since the logics was using `>=`.
- Added a delta check on the Score.
- Changed the logic to use the actual recomputed score rather than its two addresses separately to ease future maintenance.

#### [High-Scoring Mouse](https://retroachievements.org/achievement/4318)
- Rephrased the description to "Score **at least** 250,000 points on Normal difficulty or higher" since the logics was using `>=`.
- Removed the two weird alts (one would check that the overall Score is at least 250,000 and the other would check that the high address was 3 and became 4, which makes little sense).
- Added a proper delta check on the Score.
Changed the logic to use the actual recomputed score rather than its two addresses separately to ease future maintenance.

#### [Sweet Dreams](https://retroachievements.org/achievement/4336)
- Removed the single line that was based on a former "question mark code note".
- New logic checks the level and delta checks to track the map transition within the level.

#### [Secret Squeak](https://retroachievements.org/achievement/4348)
- Rephrased the description to "Earn a secret bonus of **at least** 25,000" since the logics was using `>=`.
- Added a delta check on the Secret Bonus value.

#### [Terrific Technique](https://retroachievements.org/achievement/4349)
- Rephrased the description to "Earn a technical bonus of **at least** 25,000" since the logics was using `>=`.
- Added a delta check on the Technical Bonus value.

#### [Ravishing Ruby](https://retroachievements.org/achievement/4337)
- Removed the map check based on a former "question mark code note".
- Added a check on the current level.
- Added bonus: this allows the unlock in practice mode, which was not possible with the previous "magic value" and was technically a bug with regards to the achievement description.

#### [Divine Citrine](https://retroachievements.org/achievement/4338)
- Removed the map check based on a former "question mark code note".
- Added a check on the current level.
- Added bonus: this allows the unlock in practice mode, which was not possible with the previous "magic value" and was technically a bug with regards to the achievement description.

#### [Beautiful Beryl](https://retroachievements.org/achievement/4339)
- Removed the map check based on a former "question mark code note".
- Added a check on the current level.
- Added bonus: this allows the unlock in practice mode, which was not possible with the previous "magic value" and was technically a bug with regards to the achievement description.

#### [Enamoring Emerald](https://retroachievements.org/achievement/4340)
- Removed the map check based on a former "question mark code note".
- Added a check on the current level and map (discriminate between `4340` and `4342`).

#### [Lovely Lapis](https://retroachievements.org/achievement/4342)
- Removed the map check based on a former "question mark code note".
- Added a check on the current level and map (discriminate between `4340` and `4342`).

#### [Superb Sapphire](https://retroachievements.org/achievement/4344)
- Removed the map check based on a former "question mark code note".
- Added a check on the current level and map (discriminate between `4344` and `4345`).

#### [Amazing Amethyst](https://retroachievements.org/achievement/4345)
- Removed the map check based on a "question mark code note".
- Added a check on the current level and map (discriminate between `4344` and `4345`).

#### [Happily Ever After](https://retroachievements.org/achievement/4346)
- Added a delta check on the Game State.

#### [Mighty Mouse](https://retroachievements.org/achievement/4347)
- Added a delta check on the Game State.

#### [Decaffeinated](https://retroachievements.org/achievement/4341)
This one was demoted and the complex logics shows evidence of trying to patch it repeatedly without succeeding.

By applying the same logics as `4336` I was able to get it to work.

## Leaderboards

### Global changes
All leaderboards have been demo-mode protected and can only trigger when alive.

### Specific changes

#### [Practice Mouse](https://retroachievements.org/leaderboardinfo.php?i=142111)
- Converted to instant submit to avoid screen pollution since the score is displayed in-game at all times and we already have two leaderboard timers displaying.
- Removed the check on former "question mark code note" which was apparently there to prevent this specific leaderboard to trigger between Levels because the checked Game State transition was weak for this one
- Replaced the weak Game State transition by a check on the Level (which goes from 2 to 3 when the game is won in Practice mode)

#### [Brave Mouse](https://retroachievements.org/leaderboardinfo.php?i=142112)
Converted to instant submit to avoid screen pollution since the score is displayed in-game at all times and we already have two leaderboard timers displaying.


#### [Bravest Mouse](https://retroachievements.org/leaderboardinfo.php?i=142113)
Converted to instant submit to avoid screen pollution since the score is displayed in-game at all times and we already have two leaderboard timers displaying.

#### [Fortress of Illusion Speedrun](https://retroachievements.org/leaderboardinfo.php?i=142114)
- Removed the checks based on the former "question mark code note" which served no purpose (the leaderboard should pop at the very same time the achievement does and the achievement does not need this check)
- Added proper checks to match the logics of `Practice Mouse`

#### [Castle of Illusion Speedrun](https://retroachievements.org/leaderboardinfo.php?i=142115)
- Removed the checks based on the former "question mark code note" which served no purpose (the leaderboard should pop at the very same time the achievement does and the achievement does not need this check)
- Added proper checks on the level

#### [The Enchanted Forest Speedrun](https://retroachievements.org/leaderboardinfo.php?i=142116)
- Removed the checks based on the former "question mark code note" which served no purpose (the leaderboard should pop at the very same time the achievement does and the achievement does not need this check)
- Added proper checks on the level

#### [ToyLand Speedrun](https://retroachievements.org/leaderboardinfo.php?i=142117)
- Removed the checks based on the former "question mark code note" which served no purpose (the leaderboard should pop at the very same time the achievement does and the achievement does not need this check)
- Added proper checks on the level

#### [The Storm Speedrun](https://retroachievements.org/leaderboardinfo.php?i=142118)
- Speedrun has been capitalized in the title
- Removed the checks based on the former "question mark code note" which served no purpose (the leaderboard should pop at the very same time the achievement does and the achievement does not need this check)
- Added proper checks on the level

#### [The Library Speedrun](https://retroachievements.org/leaderboardinfo.php?i=142119)
- Speedrun has been capitalized in the title
- Removed the checks based on the former "question mark code note" which served no purpose (the leaderboard should pop at the very same time the achievement does and the achievement does not need this check)
- Added proper checks on the level

#### [The Castle Speedrun](https://retroachievements.org/leaderboardinfo.php?i=142120)
- Speedrun has been capitalized in the title
- Removed the checks based on the former "question mark code note" which served no purpose (the leaderboard should pop at the very same time the achievement does and the achievement does not need this check)
- Added proper checks on the level

## Achievement ordering
The achievements have been reordered to better fit current player expectations: progression is on top and missables are intertwined where relevant.

## Misc. 
Added a game banner.