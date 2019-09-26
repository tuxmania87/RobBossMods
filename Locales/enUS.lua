
local L = LibStub("AceLocale-3.0"):NewLocale("RobBossMods", "enUS", false)
if GetLocale() ~= "deDE" and GetLocale() ~= "enUS" and GetLocale() ~= "enGB" then
	L = LibStub("AceLocale-3.0"):NewLocale("RobBossMods", GetLocale(), false)
end
if not L then return end

--menu entrys
L["AUTHOR1"] = "Author is Robert Hartmann, Germany ( Justicia on EU-die silberne Hand and Lest\195\161 on same server ) Email: robert@keinerspieltmitmir.de"
L["AUTHOR2"] = "Helper for english translation: Stagen@irc.freenode.net and Niadyth@irc.freenode.net"
L["BOSS_DEAD1"] = " is dead. "
L["BOSS_DEAD2"] = " is the next one!"
L["CHOICE"] = "Choice"
L["CURRENTBOSS"] = "Current Boss"
L["DONTKNOW"] = "If somebody does not know the boss, please type !boss in partychat and you will get an explanation!"
L["DONTKNOW_OLD"] = "If somebody dont know the boss, please type !boss in partychat and you will get an explanation!"
L["DRAG"] = "Shift + Left-Click : Drag"
L["EVERY_BOSS_ANNOUNCE"] = "Post when targeting"
L["EVERY_BOSS_ANNOUNCE_DESC"] = "When targeting a boss, post in the party channel that everyone can say !boss to receive Boss Tactics"
L["GUILD"] = "Guild"
L["INFORM_PARTY"] = "Send Party Note"
L["LASTBOSS"] = " was the last boss here. Many thanks for the group!"
L["LEFTCLICK"] = "Left-Click for posting tactics"
L["MENU_AUTHOR"] = " /rbm author -- get informations about the author"
L["MENU_DESCRIPTION"] = "RobBossMods shows Boss Tactics for heroic dificulty. When you are in an instance people can receive boss tactics when typing !boss in the party Channel. You can also Send Boss Tactics and set current boss on your own!"
L["MENU_GENERAL"] = "General Settings"
L["MENU_HINT1"] = " !rbminfo in partychat  -  Gives Information about the addon in Partychat e.g. Link for download"
L["MENU_MINIMAP_OFF"] = " /rbm minioff -- Hide Minimap Icon"
L["MENU_MINIMAP_ON"] = " /rbm minion -- Show minimap icon"
L["MENU_RESETLANG"] = " /rbm resetlang -- reset language settings"
L["MENU_STATE"] = " /rbm state -- returns the status of the addon"
L["MINIMAP_SHOW"] = "Show Minimap Icon"
L["MYSELF"] = "myself"
L["NEW_VER1"] = "You run RBM Version "
L["NEW_VER2"] = " but there is a new version: "
L["NEXT_BOSS_ANNOUNCE"] = "Post next Boss"
L["NEXT_BOSS_ANNOUNCE_DESC"] = "Post in party chat when the boss dies and tell who is the next one."
L["NOBOSS"] = "No boss selected"
L["NONE"] = "none"
L["OPTIONS"] = "Options"
L["PARTY"] = "Party"
L["POSTON"] = "Post on..."
L["RESET_CUSTOM"] = "Reset custom tactics and load default"
L["RESET_CUSTOM_DESC"] = "Reset custom tactics and load default ones. Attention ALL custom tactics will be reseted!"
L["RIGHTCLICK"] = "Right-Click for manual select boss"
L["SAY"] = "say"
L["S_GHUR"] = "Ghur'sha is dead. Ozumat is the next one!"
L["S_HELIX"] = "Helix is dead. Foe Reaper 5000 is the next one!"
L["S_OZUMAT"] = "Ozumat was the last boss here. Many thanks for the group!"
L["T3887"] = "Easy Fight. Worgen adds will spawn, dps them down and change back to the boss. Decurse the party and thats it."
L["T39378"] = "SPELL(80352): Got to be interrupted! \
SPELL(87653): Boss targets a player. The ground under that player becomes dark. Get out of that area because the boss is going to jumo onto you which will cause 'augh' :)\
Occasionally he will go to the middle doing AOE damage. Heal through it! During this phase the boss takes additional damage, so it's a good time to pop heroism/bloodlust/time warp."
L["T39425"] = "Blue stuff on the ground SPELL(75117): Get out ! \
SPELL(74938): Boss is invulnerable while his shield is up. Split your party. Each team has to get to one lever. One of each team has to distract the snakes while the other activates the lever.\
 Afterwards assemble upstairs quickly, kill any remaining snakes (they do a nasty poison debuff which isn't removeable) and interrupt the boss who casts SPELL(75322). This lever phase will occur two times."
L["T39428"] = "Phase 1: normal fight. Get out of the grey ground effect.\
 Phase 2: Boss is submerged. Tank and dps the adds down. Thats it. Achievemtent when completing the fight on a camel."
L["T39587"] = "SPELL(74136): like in Trial of the Champion (Eradic the Pure). Just turn around when she casts supernova, to avoid taking damage and being disorientated.\
 Split: Boss splits at 66% in 3 copies and at 33% in 2 copies. Each copy represents one of the bosses abilities and killing that add removes the corresponding ability.\
 Removing one ability, however, increases the effect of the remaining ones, so choice of which to leave up to the end is down to your group composition."
L["T39625"] = "SPELL(90250): Boss targets a player and charges after 2 seconds. Run away from your position otherwise he could one shot you. Don't stand together.\
SPELL(90249): AoE damage in the area around the boss. Melee and tank will have a short period to get away from Umbriss. \
SPELL(91937): Debuff on the tank, which does incredible damage over time. Only passes if tank gets 90% or more health. The Tank need to be overhealed until the debuff fades! \
 Trogs: 4 trogs spawn. One DPS should kite them away from the boss and kill them. If they die near Umbriss, then he will Frenzy SPELL(90169) and make the fight so much harder."
L["T39665"] = "SPELL(75272): Creatures that will spawn on your position. You must kite them to the tank so he can AoE tank them.\
SPELL(75539): Whole Party will be teleported to the boss. Destroy the chains instantly! Afterwards run away from the boss because he casts SPELL(93453) which will kill you if you are in range."
L["T39679"] = "There will be 3 beams SPELL(75610) on the adds that stands near the boss. You need to stand in between each beam so that it will not hit the add. (chose a ranged player to stand in each)\
 The beam cause a debuff on each player which will stack up, so you should keep a careful eye on this. When you reach 80 stacks of the debuff, step aside so that the beam again hits the add. \
 Let the stacks run out and disappear and then step back into the beam. The tank has to interrupt the SPELL(93462) (because it would fear the players out of the beam and cause a wipe)."
L["T39698"] = "The whole group has to come into the inner circle so that you don't stand on the steel grid.\
 Karsh is almost immune against everything SPELL(75842). To make him vulnerable the tank has to drag him through the pillar of fire in the middle.\
 This will apply a debuff SPELL(75846) on him, which makes him vulnerable. The more stacks the more damage he takes but it also increases the AoE damage it causes to the party.\
 The debuff must not go off him, because if it does then adds will spawn. So just a few seconds before the debuff is about to run out, the tank must pull him into the pillar of fire for just a moment to refresh the debuff."
L["T39700"] = "(normal) If the adds can't be CC'ed then they must be killed first, as they drop SPELL(93666) and cast SPELL(93667) which can be tough to outheal.\
 Other than that, it's straight up tank and spank. Note that if the add 'Runty' is killed then Beauty will Enrage.\
 Fear Ward on the tank or a Tremor Totem is useful for the fear. Move out of the fire!"
L["T39705"] = "Someone should kite the Shadows who will take no damage but reduce the healing taken to their present target if the boss is nearby. SPELL(76189) \
That means they should NOT be near the tank or have aggro on him! The boss itself is quite easy. Obsidius will periodically 'posses' one of his Shadows, switching places and resetting aggro with it."
L["T39731"] = "Boss is tanked normaly. DD instantly change target to the green flower things on the ground which will be constantly spawning. You dont want them to hatch. While they are alive they place a HoT effect on the boss and increase his damage done to the tank.\
 If there is a spore the tank has to bind it. When the spore dies it'll leave SPELL(75701) on the ground. Get the boss into that stain but yourself out so that the boss wont heal himself that much.\
 This fight might take long if the boss is not properly positioned. He will heal himself very much otherwise."
L["T39732"] = "Setesh is not tankable. Tank collects the adds and kites them as good as possible ( use slow and stun effects ). Attention! Boss does damage circles on the ground, get out of them!\
 Setesh goes to a corner and creates a portal. ALL dd have to dps that portal quick. You only want one add and two mana creatures to come out, not more! Tank collects them to kite them around.\
 Party does permanent damage on boss except when portals appear. Ignore the Adds, as they have a reduced damage taken buff."
L["T39788"] = "SPELL(76184): black/purple circles on the ground that dont disappear, get out of them!\
SPELL(91208): AOE. Just heal it."
L["T40177"] = "SPELL(74984): Throngus creates litle AE circles. (looks like Consecration) Don't stand there! \
 If he picks the 2 Swords then the Tank gets a magic debuff which does huge damage. It either has to be dispelled or the tank should receive heavy heals to compensate for the loss of health! Use all cooldowns if necessary. \
 If he picks the mace SPELL(75007), then the tank has to kite the boss while staying out of melee range as best as possible. Throngus will also SPELL(90756) a random party member which will have to recieve a bit extra healing. \
 If he picks a shield, then all DPS needs to get behind him. Use AoE heals, since the party will be taking more damage than the tank."
L["T40319"] = "Phase 1: Boss summons a fire elemental SPELL(75218) which will follow a random party member. The haunted has to run away, all the others should dps the add down as fast as possible. If the fire elemental reaches it target it will detonate - don't let that happen. \
 Phase 2: The flames of the dragon SPELL(90950) will cover half the room, so dps should stand at max range to reduce the damage taken."
L["T40484"] = "SPELL(91081):  Targets a random player and drains life over time. You will need to move otherwise you get damage and you will be rooted.\
SPELL(91086): Again a circle on the ground. Get in there, everyone. While he casts the shadow gale you do much more damage on the boss. Adds: After a Shadow Gale a Faceless Corruptor (2 in heroic) will spawn. Split your dps up because you have to get the Adds down as fast as possible. Adds can be slowed but not stunned. If they reach the eggs, then they will heal the boss and release little adds.]"
L["T40586"] = "SPELL(75722): Blue Circle on the ground. Get out!\
Blue Tornados: Dont stand near them! Keep moving, otherwise you will take a lot of damage and be incapacitated as they move you to the edge of the room.\
SPELL(91477): 2 Second cast. Interrupt it or your tank will almost die.\
 PHASE 2 (at 66% and 33%): She summons two Naga witches (if possible CC one or even both) and a big Naga. CC the caster and nuke the big one or kite the big one and nuke the caster."
L["T40765"] = "SPELL(76047): Creates a Fissure on the ground (where the boss smashes on the ground). Tank needs to start moving away when he is casting this as a direct hit will one-shot an appropriately geared tank.\
 It'll grow in time so you need the tank to kite the boss in a circle.\
SPELL(91484): He takes random party member and squeezes him for 6 seconds. Just heal the poor guy getting squeezed :)\
SPELL(76100): Sometimes boss enrages. Does not that much damage. Can be removed or just ignored because tank runs away from him most of the time."
L["T40792"] = "Phase 1: Kill the faceless caster quickly. Tank gets the big one and tanks him. Bomb these nasty little murlocs.\
 Phase 2: DD nuke the three caster adds. Tank has to kite the huge shadow creatures. Important! Dont get to close to them and get out of the black puddles.\
 Phase 3: Alle become uber big and make A LOT of damage! Kill remaining shadow creatures and instanlty nuke down that giant octupus called Ozumat. Use Everything you wont ever do that much damage again. :)"
L["T40825"] = "Tank the boss with back pointing to the group. He casts SPELL(76170) which should only hit the tank. Shortly afterwards he casts SPELL(91412). Try to interrupt the Bolt!\\\
 Get out of the red circles. When Erunak reaches 50% the Mindbender chooses a new victim from whom he can eat brain :).\
SPELL(76234): Green puddle. Get out because otherwise you wont be able to attack/cast.\
SPELL(91492): When Ghur'sha got that buff every attack against him will heal him and damage us. Because of that: purge, spellsteal or do that special hunter shot which removes buffs. Otherwise: Dmg stop!"
L["T42188"] = "General: Ozruk has to be tanked with the back pointing to the group. SPELL(92659) and SPELL(92429) will reflect spells.\
SPELL(92410): He hits the ground in front of him. 8 yards around this impact there will be much damage. Melee and tank get behind the boss!\
SPELL(92662): Comes direclty after SPELL(92426). Ranged dps stays in max range. Melee and tank run away from him. 15 meters ranged!"
L["T42333"] = "SPELL(79351) (mostly cast on tank): Interrupt! Does heavy damage.\
SPELL(79340): She casts black wells under a random player. Get out there and try to create a wall of these circles to force the adds to run into them.\
SPELL(79002): She throws rocks. Can be easily seen on the ground. Just get out.\
SPELL(92663): Curse which increases taken damage. Got to be decursed!"
L["T4278"] = "Tank has to get out of SPELL(93687). Always kill the adds fast cause they will SPELL(93844) the boss. Tank has to react quickly cause new adds will spawn and try to slice your healer.\
 Optional tactic: CC the two Adds and nuke down the boss as hard as possible ( trinkets, cooldowns, BL/HR/TW )\
 Alternative method: Clear everything up to the boss, then have your tank pull him and use any available run speed increase to run him all the way down into the courtyard.\
 This gives you a lot more space to move him around and out of the death and decay effects and also stops any adds spawning after the first two."
L["T43214"] = "Phase 1: Slabhide is on the ground. Healer and tank have to be in a line of sight. When boss casts SPELL(92265) everyone will have to hide behind the rocks on the ground.\
 Phase 2: Boss is in the air. Avoid the black circles on the ground. Also get out of the red circles on the ground!"
L["T43438"] = "Phase 1: Corborus casts purple shards on the ground SPELL(86881). Get out there (even while the boss casts) because these shards will spawn into flying crystals which must be killed with AoE. Heavy Damage when they explode\
 Phase 2: Boss is submerged. Get out of the ground effects and get down the adds that spawn with aoe. (on heroic you must watch careful on the ground for a ground effect and get out of it before the boss one shots you)"
L["T43612"] = "Phase 1: Boss is tanked. Move away from the pillars of light. A phoenix will appear (like in Kael'thas fight, Tempest Keep).\
 Just like in BC name someone who will pull the bird out of the group and kill him. Phoenix will become an egg.\
 While phoenix is an egg the named DD dps the boss. When the boss reaches 50% phase 2 will start.\
 Phase 2: Boss is not vulnerable. Get out of SPELL(88814) around him. A dark phoenix appears. Just dps him down as fast as possible dont kite anything. Soul Fragments will reach the phoenix make him doing more damage so hurry!\
 When dark phoenix dies phase 1 starts again until the high prophet bites the dust."
L["T43614"] = "SPELL(81642): Periodically smashes the ground with his tail. Melee dont stand behind him, instead stand at his side.\
SPELL(89998): Deals 1850 to 2150 bleeding damage every 2 seconds. Nearby hungry crocolisks can smell your blood! You are a prime target for attack. Get to the Tank or kite them while the others dps them down.\
 Augh: Augh appears and does a little whirlwind. Just avoid him.\
SPELL(81706): 30% Enrage. Remove it or activate trinkets and cooldown abilities."
L["T43778"] = "Add: One has to control the harvest machine to dps the adds that will spawn at the forge. Objective: 2x SPELL(91734) 1xSPELL(91735) so that the adds wont reach the 'stairs'.\
 Boss itself is tanked on the stairs so that the player who controls the add has enough room and the rest of the party does not suffer the fire damage from the adds.\
SPELL(88481): Boss gets crazy and does damage to every player who stands near him. DD run away. Tank taunts him back after the overdrive.\
SPELL(88495): Boss targets a player and creates a red circle under him. That player has to run away AFTER the red circle is visible. All the other melee stand back ( even tank ).\
 When Boss HP reaches 30% he gets SPELL(91720) doing much more damage. Use Cooldowns and heroism/bloodlust/timewarp then."
L["T43873"] = "Tornadoes: The whole place is full of little tornadoes which slightly move. Dodge them!\
 Wind of Altairus: The boss creates a wind that has a certain direction. (Much better seen if you zoom out and look from above). DPS stand with the wind. Tank the other way around.\
SPELL(93989): Boss targets a random player and casts a breath. Don't stand together because then it'll hit more players which means more work for the healer.\
 When DPS stands right they will get SPELL(88282) which increases cast and attack speeds. Make sure you stand right so that you can dps the boss down as fast as possible."
L["T43875"] = "SPELL(87618): Everyone gets this debuff. You are rooted for 18 seconds. Has to be dispelled!\
 Static Trianlge/Groundfield: Asaad casts three points on the ground and connects them to a triangle. Stand in that triangle otherwise you will die from his SPELL(86930).\
 Chain Lighting: Try not to stand close to each other!"
L["T43878"] = "Little Whirlwinds will spawn and they will create an outer circle. From time to time the whirlwinds will come to the middle. Everyone who stands IN one of the whirlwinds will suffer a silence effect and get a lot of damage.\
 Easiest tactic is that EVERYONE stands inside the boss and do normal tank and spank.\
 Optional tactic: Everytime the tornados come to the middle party goes to the outer circle but experience told me that this will create more damage on the party than the nuke tactic."
L["T44577"] = "Boss puts little mines on the ground SPELL(91259). Get away from them. The mines can get inactive (stop glowing) but are still dangerous then. SPELL(91263)\
 Sometimes the boss grabs a player and throws him against the wall. Heal that player.\
SPELL(83445): Boss stops moving and brown lines appear on the ground. Just get out of them.\
 In general: Heal and tank have to be in a line of sight which is not that easy because the tank has to keep moving to avoid the mines."
L["T44819"] = "Its quite easy! Immediately that the fight starts, the boss will get SPELL(84589). Focus the adds then until he drops his shield.\
 Adds: Just tank and spank. Get out of the ground effects (nasty green and grey circles). Thats it :) feel free to correct me."
L["T46962"] = "Tough Fight. Preliminary: Save Bloodlust/Heroism/Time Warp for 25% Boss HP. Healer dont try to heal everyone to full HP. Just keep all alive with around 40%-50%\
SPELL(93712): Channeled spell wich does damage to on partymember. Interrupt because no player will have full HP.\
SPELL(93713): He will heal a lot of his HP. Need to be interrupted so hard!\
SPELL(93710): He lifts everyone up and reducing everyones HP to 1%.\
SPELL(93705): Instantly casts after Asphyxiate. He heals everyone including himself. Let One or Two Ticks go through because otherwise your tank would be a one hit.\
 The Key to that fight is to name the persons that kick the special casts."
L["T46963"] = "SPELL(93617): ALL stay in motion! SPELL(93689): ALL stand still!  \
SPELL(93527): stay in motion and dont get into the blue zones."
L["T46964"] = "Tank tanks in a corner so that Godfrey looks in direction of that corner. When Boss casts SPELL(93520) the tank goes to steps out of it.\
Shortly before SPELL(93520) he SPELL(93707). Tank them and nuke them down while Boss fires his SPELL(93520) into the corner. Important: Decurse EVERYONE quickly because of SPELL(93761)."
L["T47162"] = "Phase 1: Boss does SPELL(87859) or SPELL(87861). Sometimes he blinks with aggro reset. nothing special about that phase.\
 Phase 2: Boss stays in the middle. A SPELL(91398) appears which will rotate around the boss. ATTENTION: Always stay in move. Get out of the blue circles and aoe the adds down."
L["T47297"] = "Helix plants bombs at random on the ground. Naturally, you shouldn't touch these.\
 If a player gets a SPELL(88352) to him, try to get below the tree trunk so that you can avoid getting too much full damage.\
 Sometimes the boss takes a player and runs against the wall. That player needs some extra heal after the crash.\
 When the big guy dies, Helix himself will pester the players by jumping on their backs. Dps him down."
L["T47626"] = "Bossphase: Boss is tanked normally. He sometimes charges a player. In later bossphases there are also adds but not in the first one.\
 Addphase: Little vapors appear. Finish them quickly! Push the v  key so that you can see their life bars so that you can nuke them easier. The vapors will grow.\
 The taller they are the more damage they make. The two phases switch and adds won't stop spawn. When boss reaches 10% he calles more vapors. Ignore them and dps the bown down."
L["T47739"] = "Cookie gets in a big pot. He throws with food. There is good food ( shines yellow ) and bad one ( shines green ). Eat the good food to get haste buff SPELL(92834) and avoid the green SPELL(92066) ( does little AoE damage )"
L["T49541"] = "Vanessa is tanked normally. Two adds will spawn all the time. DPS them down quickly. Especially interrupt the blood mages.\
 When Vanessa reaces 50% health all adds disappear (and her). On the side of the ship 5 cords will spawn. Every party member has to right click one of the cords.\
 fter the tarzan-swing everything keeps going like before until she hits 25% health. Again cords will spawn. Afterwards no more adds will spawn just focus her down. When she dies you have to use the cords one last time."
L["TACTICS"] = "Tactics on "
L["T41570"] = "Tactics on Magmaw: TODO (feel free to add your own tactic here)"
L["T42180"] = "Tactics on Omnitron Defense System  TODO (feel free to add your own tactic here)"
L["T41378"] = "Tactics on Maloriak  TODO (feel free to add your own tactic here)"
L["T41442"] = "Tactics on Atramedes  TODO (feel free to add your own tactic here)"
L["T43296"] = "Tactics on Chimaeron TODO (feel free to add your own tactic here)"
L["T41376"] = "Tactics on Nefarian  TODO (feel free to add your own tactic here)"
L["T44600"] = "Tactics on Halfus Wyrmbreaker  TODO (feel free to add your own tactic here)"
L["T45992"] = "Tactics on Valiona  TODO (feel free to add your own tactic here)"
L["T43735"] = "Tactics on Ascendant Council  TODO (feel free to add your own tactic here)"
L["T43324"] = "Tactics on Cho'gall TODO (feel free to add your own tactic here)"
L["T47120"] = "Tactics on Argaloth TODO (feel free to add your own tactic here)"
L["T45871"] = "Tactics on Conclave of Wind  TODO (feel free to add your own tactic here)"
L["T46753"] = "Tactics on Al'Akir TODO (feel free to add your own tactic here)"
L["RAID"] = "Raid"