-- variables
local selected = script.Parent
local Overview = script.Parent.Parent.Parent.Overview
local Skins = script.Parent.Parent.Parent.Skins

selected.GToilet.MouseButton1Click:Connect(function() -- activate when the character is selected 
	script.Parent.Parent.Character.Value = "GToilet" -- change the Character value in the players Values folder to load the correct character 
	Overview.Picture.Image = "http://www.roblox.com/asset/?id=86894078332246" 
  -- adjust Overview UI to contain correct character, health, passive, ultimate, abilities and descriptions 
	Overview.CharacterLabel.Text = "Character: G-Toilet" 
	Overview.HealthLabel.Text = "Health: 2250 HP" 
	Overview.Passive1Label.Text = "Passive: Sensitivity Endurance" 
	Overview.Passive2Label.Text = " - G-Toilet takes 0.5x damage from sound and TV attacks" 
	Overview.Ultimate1Label.Text = "Ultimate: Berserk" 
	Overview.Ultimate2Label.Text = " - G-Toilet and teammates go berserk, damage is doubled and movespeed is doubled for 30s" 
	Overview.Ability1Label.Text = "Ability 1: Stealth Orb" 
	Overview.Ability1Description.Text = " - Launch a silent orb - 100 DMG - 25s cooldown" 
	Overview.Ability2Label.Text = "Ability 2: Detonator Orb" 
	Overview.Ability2Description.Text = " - Launch a hacked orb which ragdolls the enemy - 150 DMG - 30s cooldown" 
	Overview.Ability3Label.Text = "Ability 3: Corruptor Orb" 
	Overview.Ability3Description.Text = " - Launch a corrupted orb which stuns the enemy - 150 DMG - 30s cooldown" 
	Overview.Ability4Label.Text = "Ability 4: Laser Barrage" 
	Overview.Ability4Description.Text = " - Fire lasers for 5s - up to 350 DMG - 15s cooldown" 
	Overview.Ability5Label.Text = "Ability 5: Lunge" 
	Overview.Ability5Description.Text = " - Launch yourself at your cursor to stun the enemy - 100 DMG - 20s cooldown" 
	Overview.Ability6Label.Text = "Ability 6: Shriek" 
	Overview.Ability6Description.Text = " - Stun enemies within 1000 studs, can be used during stun - No DMG - 60s cooldown" 
  -- left blank as G-Toilet does not have a 7th ability 
	Overview.Ability7Label.Text = "" 
	Overview.Ability7Description.Text = ""
  -- update the Skins UI
  Skins.Skin1.Image = "http://www.roblox.com/asset/?id=86894078332246"
	Skins.Skin2.Image = "http://www.roblox.com/asset/?id=122906579839992"
end)

selected.UTCM.MouseButton1Click:Connect(function() -- activate when the character is selected 
	script.Parent.Parent.Character.Value = "UTCM" -- change the Character value in the players Values folder to load the correct character 
	script.Parent.Parent.Parent.Overview.Picture.Image = "http://www.roblox.com/asset/?id=112166889012013"
  -- adjust Overview UI to contain correct character, health, passive, ultimate, abilities and descriptions 
	Overview.CharacterLabel.Text = "Character: Titan Cameraman"
	Overview.HealthLabel.Text = "Health: 2250 HP"
	Overview.Passive1Label.Text = "Passive: Undeterred"
	Overview.Passive2Label.Text = " - Titan Cameraman cannot be affected by taunts"
	Overview.Ultimate1Label.Text = "Ultimate: Core Overheat"
	Overview.Ultimate2Label.Text = " - Incinerate everyone in front of you for 5s, including teammates - 130 DMG/s"
	Overview.Ability1Label.Text = "Ability 1: Hammer Slam"
	Overview.Ability1Description.Text = " - Slam a hammer in front of you to stun - 250 DMG - 25s cooldown"
	Overview.Ability2Label.Text = "Ability 2: Surgical Precision"
	Overview.Ability2Description.Text = " - Churn a buzzsaw into the enemy for 5s - 20 DMG/s - 45s cooldown"
	Overview.Ability3Label.Text = "Ability 3: Acidic Spout"
	Overview.Ability3Description.Text = " - Blast acid around you, poisoning enemies for 15s - 10 DMG/s - 45s cooldown"
	Overview.Ability4Label.Text = "Ability 4: Railgun Blitz"
	Overview.Ability4Description.Text = " - Shoot 3 blasts at your cursor - 40 DMG each - 25s cooldown"
	Overview.Ability5Label.Text = "Ability 5: Finger Gun"
	Overview.Ability5Description.Text = " - Snipe an enemy with a finger blast - 80 DMG - 20s cooldown"
	Overview.Ability6Label.Text = "Ability 6: Thumbs Up"
	Overview.Ability6Description.Text = " - Grant 100 HP and +50% Attack and Defence to your team - 45s cooldown"
  -- left blank as Titan Cameraman does not have a 7th ability 
	Overview.Ability7Label.Text = ""
	Overview.Ability7Description.Text = ""
  -- update the Skins UI
	Skins.Skin1.Image = "http://www.roblox.com/asset/?id=112166889012013"
	Skins.Skin2.Image = "http://www.roblox.com/asset/?id=11397597665"
end)

selected.UTSM.MouseButton1Click:Connect(function() -- activate when the character is selected 
	script.Parent.Parent.Character.Value = "UTSM" -- change the Character value in the players Values folder to load the correct character 
	script.Parent.Parent.Parent.Overview.Picture.Image = "http://www.roblox.com/asset/?id=74938520209385"
  -- adjust Overview UI to contain correct character, health, passive, ultimate, abilities and descriptions 
	Overview.CharacterLabel.Text = "Character: Titan Speakerman"
	Overview.HealthLabel.Text = "Health: 2000 HP"
	Overview.Passive1Label.Text = "Passive: See No Evil"
	Overview.Passive2Label.Text = " - Titan Speakerman is immune to TV screen attacks"
	Overview.Ultimate1Label.Text = "Ultimate: Justified Crashout"
	Overview.Ultimate2Label.Text = " - You and your team gain +100% Attack and +200% Movespeed for 20s, and unleash a barrage of attacks all at once"
	Overview.Ability1Label.Text = "Ability 1: Cannon Barrage"
	Overview.Ability1Description.Text = " - Fire 6 blasts at your cursor - 25 DMG each - 20s cooldown"
	Overview.Ability2Label.Text = "Ability 2: Core Beam"
	Overview.Ability2Description.Text = " - Launch a laser beam from your core for 3s - 50 DMG/s - 25s cooldown"
	Overview.Ability3Label.Text = "Ability 3: Knife Snipe"
	Overview.Ability3Description.Text = " - Launch a knife from a speaker to your cursor - 150 DMG - 45s cooldown"
	Overview.Ability4Label.Text = "Ability 4: Earpierce"
	Overview.Ability4Description.Text = " - Stun enemies within 1500 studs, can be used during stun - No DMG - 60s cooldown"
	Overview.Ability5Label.Text = "Ability 5: Temper Tantrum"
	Overview.Ability5Description.Text = " - Grant your team +50% Attack and Defence for 20s - 60s cooldown"
	Overview.Ability6Label.Text = "Ability 6: Adrenaline"
	Overview.Ability6Description.Text = " - Gain +100% Movespeed for 10s - 60s cooldown"
	Overview.Ability7Label.Text = "Ability 7: Concert"
	Overview.Ability7Description.Text = " - Grant your team +30% Attack and Movespeed and 25 HP/s for 10s - 45s cooldown"
  -- update the Skins UI
	Skins.Skin1.Image = "http://www.roblox.com/asset/?id=74938520209385"
	Skins.Skin2.Image = "http://www.roblox.com/asset/?id=72525526369291"
end)

selected.UTTVM.MouseButton1Click:Connect(function() -- activate when the character is selected 
	script.Parent.Parent.Character.Value = "UTTVM" -- change the Character value in the players Values folder to load the correct character 
	script.Parent.Parent.Parent.Overview.Picture.Image = "http://www.roblox.com/asset/?id=124459838511983"
  -- adjust Overview UI to contain correct character, health, passive, ultimate, abilities and descriptions 
	Overview.CharacterLabel.Text = "Character: Titan TV Man"
	Overview.HealthLabel.Text = "Health: 1250 HP"
	Overview.Passive1Label.Text = "Passive: See No Evil"
	Overview.Passive2Label.Text = " - Titan TV Man is immune to TV screen attacks"
	Overview.Ultimate1Label.Text = "Ultimate: Red Screen Of Death"
	Overview.Ultimate2Label.Text = " - Activate your monitors to deal 50 DMG/s for 15s, stunning all players, including teammates"
	Overview.Ability1Label.Text = "Ability 1: Impale"
	Overview.Ability1Description.Text = " - Pierce your sword into an enemy to ragdoll and stun - 250 DMG - 30s cooldown"
	Overview.Ability2Label.Text = "Ability 2: Claw Lunge"
	Overview.Ability2Description.Text = " - Lunge your claws to stun - 150 DMG - 30s cooldown"
	Overview.Ability3Label.Text = "Ability 3: Core Snipe"
	Overview.Ability3Description.Text = " - Fire a quick shot from your core at your cursor which stuns - 150 DMG - 30s cooldown"
	Overview.Ability4Label.Text = "Ability 4: Disintegrator Beam"
	Overview.Ability4Description.Text = " - Unleash your core beam to damage enemies and teammates for 5s - 25 DMG/s - 60s cooldown"
	Overview.Ability5Label.Text = "Ability 5: Disassemble"
	Overview.Ability5Description.Text = " - Detach a TV to act as a sentry, shooting enemies. Has 300 HP - 15 DMG each - 120s cooldown"
	Overview.Ability6Label.Text = "Ability 6: Absorption"
	Overview.Ability6Description.Text = " - Absorb attacks to heal the damage it would have done - ? HP - 60s cooldown"
	Overview.Ability7Label.Text = "Ability 7: Teleport"
	Overview.Ability7Description.Text = " - Teleport yourself to your spawnpoint - No DMG - 60s cooldown"
  -- update the Skins UI
	Skins.Skin1.Image = "http://www.roblox.com/asset/?id=124459838511983"
	Skins.Skin2.Image = "http://www.roblox.com/asset/?id=78419710630139"
end)

selected.Juggernaut.MouseButton1Click:Connect(function() -- activate when the character is selected 
	script.Parent.Parent.Character.Value = "Juggernaut" -- change the Character value in the players Values folder to load the correct character 
	script.Parent.Parent.Parent.Overview.Picture.Image = "http://www.roblox.com/asset/?id=75478129252800"
  -- adjust Overview UI to contain correct character, health, passive, ultimate, abilities and descriptions 
	Overview.CharacterLabel.Text = "Character: Astro Juggernaut"
	Overview.HealthLabel.Text = "Health: 1250 HP"
	Overview.Passive1Label.Text = "Passive: Watchman"
	Overview.Passive2Label.Text = " - All enemy locations are highlighted for you"
	Overview.Ultimate1Label.Text = "Ultimate: Vengeance"
	Overview.Ultimate2Label.Text = " - You and your team replenish 400 HP and gain +150% Defence for 20s"
	Overview.Ability1Label.Text = "Ability 1: Haymaker"
	Overview.Ability1Description.Text = " - Punch to stun enemies in place - 250 DMG - 40s cooldown"
	Overview.Ability2Label.Text = "Ability 2: Uppercut"
	Overview.Ability2Description.Text = " - Uppercut to stun, ragdoll and fling - 250 DMG - 40s cooldown"
	Overview.Ability3Label.Text = "Ability 3: Fake Out"
	Overview.Ability3Description.Text = " - Fake teleport and reappear to stun enemies you teleport to - 75 DMG - 60s cooldown"
	Overview.Ability4Label.Text = "Ability 4: Planetary Annihilation"
	Overview.Ability4Description.Text = " - Charge a projectile that damages anyone within 5000 studs - 500 DMG - 60s cooldown"
	Overview.Ability5Label.Text = "Ability 5: Taunt"
	Overview.Ability5Description.Text = " - Enemies within 500 studs have non-attacking abilities disabled - No DMG - 200s cooldown"
	Overview.Ability6Label.Text = "Ability 6: Warp"
	Overview.Ability6Description.Text = " - Teleport yourself to your spawnpoint - No DMG - 30s cooldown"
  -- left blank as the Astro Juggernaut does not have a 7th ability 
	Overview.Ability7Label.Text = ""
	Overview.Ability7Description.Text = ""
  -- update the Skins UI
	Skins.Skin1.Image = "http://www.roblox.com/asset/?id=75478129252800"
	Skins.Skin2.Image = "http://www.roblox.com/asset/?id=120050054454804"
end)

selected.Overseer.MouseButton1Click:Connect(function() -- activate when the character is selected 
	script.Parent.Parent.Character.Value = "Overseer" -- change the Character value in the players Values folder to load the correct character 
	script.Parent.Parent.Parent.Overview.Picture.Image = "http://www.roblox.com/asset/?id=82012245432994"
  -- adjust Overview UI to contain correct character, health, passive, ultimate, abilities and descriptions 
	Overview.CharacterLabel.Text = "Character: Astro Overseer"
	Overview.HealthLabel.Text = "Health: 900 HP"
	Overview.Passive1Label.Text = "Passive: Astro Autocrat"
	Overview.Passive2Label.Text = " - Astro Overseer's parry window is increased by 50%"
	Overview.Ultimate1Label.Text = "Ultimate: Annihilate This Place"
	Overview.Ultimate2Label.Text = " - Command the Astro Mothership to demolish your current location and players in its path"
	Overview.Ability1Label.Text = "Ability 1: Charged Shot"
	Overview.Ability1Description.Text = " - Blast a shot at your cursor, heals if shot at teammate - 75 DMG/HP - 20s cooldown"
	Overview.Ability2Label.Text = "Ability 2: Death Stare"
	Overview.Ability2Description.Text = " - Fire lasers out your eyes for 5s - 20 DMG/s - 30s cooldown"
	Overview.Ability3Label.Text = "Ability 3: Whirlwind"
	Overview.Ability3Description.Text = " - Trap enemies in a whirlwind for 15s, preventing them from moving - No DMG - 90s cooldown"
	Overview.Ability4Label.Text = "Ability 4: Imperial Motivation"
	Overview.Ability4Description.Text = " - Heal 250 HP and grant +50% Attack and Defence for 30s - 90s cooldown"
	Overview.Ability5Label.Text = "Ability 5: Adrenaline"
	Overview.Ability5Description.Text = " - Gain +100% Movespeed for 10s - 60s cooldown"
	Overview.Ability6Label.Text = "Ability 6: Taunt"
	Overview.Ability6Description.Text = " - Enemies within 500 studs have non-attacking abilities disabled - No DMG - 200s cooldown"
	Overview.Ability7Label.Text = "Ability 7: Warp"
	Overview.Ability7Description.Text = " - Teleport yourself to your spawnpoint - No DMG - 30s cooldown"
  -- update the Skins UI
	Skins.Skin1.Image = "http://www.roblox.com/asset/?id=82012245432994"
	Skins.Skin2.Image = "http://www.roblox.com/asset/?id=1826333315"
end)

selected.Necromancer.MouseButton1Click:Connect(function() -- activate when the character is selected 
	script.Parent.Parent.Character.Value = "Necromancer" -- change the Character value in the players Values folder to load the correct character 
	script.Parent.Parent.Parent.Overview.Picture.Image = "http://www.roblox.com/asset/?id=125576680306354"
  -- adjust Overview UI to contain correct character, health, passive, ultimate, abilities and descriptions 
	Overview.CharacterLabel.Text = "Character: The Necromancer"
	Overview.HealthLabel.Text = "Health: 1000 HP"
	Overview.Passive1Label.Text = "Passive: Entropy"
	Overview.Passive2Label.Text = " - Upon spawning, a random stat will be increased by 50%"
	Overview.Ultimate1Label.Text = "Ultimate: Soul Driven Scythe"
	Overview.Ultimate2Label.Text = " - Summon a humongous scythe and carve it where you face to permanently reduce all stats of all players hit by it by 50% - 500 DMG"
	Overview.Ability1Label.Text = "Ability 1: Conjured Slash"
	Overview.Ability1Description.Text = " - Slash your scythe in front of you - 120 DMG - 30s cooldown"
	Overview.Ability2Label.Text = "Ability 2: Life Drain"
	Overview.Ability2Description.Text = " - Grab an enemy and transfer 20% of their HP to you - ? DMG - 25s cooldown"
	Overview.Ability3Label.Text = "Ability 3: Revenant Hurl"
	Overview.Ability3Description.Text = " - Grab an enemy and launch them at your cursor - 100 DMG - 40s cooldown"
	Overview.Ability4Label.Text = "Ability 4: Whiplash"
	Overview.Ability4Description.Text = " - Grab an enemy and throw them to the ground and ragdolling - 150 DMG - 40s cooldown"
	Overview.Ability5Label.Text = "Ability 5: Hallowed Totem"
	Overview.Ability5Description.Text = " - Summon a totem to grant +150% Defence for your team, with 500 HP needed to break it - 90s cooldown"
	Overview.Ability6Label.Text = "Ability 6: Hypersensitivity"
	Overview.Ability6Description.Text = " - Movespeed is increased by +150% for 5s - 30s cooldown"
	Overview.Ability7Label.Text = "Ability 7: Spectre Form"
	Overview.Ability7Description.Text = " - Turn invisible for 15s, yet still be able to use abilities - No DMG - 90s cooldown"
  -- update the Skins UI
	Skins.Skin1.Image = "http://www.roblox.com/asset/?id=125576680306354"
	Skins.Skin2.Image = "http://www.roblox.com/asset/?id=96082216141107"
end)

selected.Plungerman.MouseButton1Click:Connect(function() -- activate when the character is selected 
	script.Parent.Parent.Character.Value = "Plungerman" -- change the Character value in the players Values folder to load the correct character 
	script.Parent.Parent.Parent.Overview.Picture.Image = "http://www.roblox.com/asset/?id=138970494622489"
  -- adjust Overview UI to contain correct character, health, passive, ultimate, abilities and descriptions 
	Overview.CharacterLabel.Text = "Character: Plungerman"
	Overview.HealthLabel.Text = "Health: 900 HP"
	Overview.Passive1Label.Text = "Passive: Speedster"
	Overview.Passive2Label.Text = " - Getting stunned lasts half the time and Movespeed is increased by +50% after taking damage for 3s"
	Overview.Ultimate1Label.Text = "Ultimate: Critical Strike"
	Overview.Ultimate2Label.Text = " - Charge forward for 4 seconds to remove half of an enemies health"
	Overview.Ability1Label.Text = "Ability 1: Energized Plunger"
	Overview.Ability1Description.Text = " - Throw a plunger at your cursor to reduce enemy Movespeed by -75% for 10s - 80 DMG - 25s cooldown"
	Overview.Ability2Label.Text = "Ability 2: Energy Overload"
	Overview.Ability2Description.Text = " - Dash uncontrollably around damaging all enemies in the area - up to 100 DMG - 30s cooldown"
	Overview.Ability3Label.Text = "Ability 3: Quick Pierce"
	Overview.Ability3Description.Text = " - Dash towards your cursor to stun the enemy - 100 DMG - 30s cooldown"
	Overview.Ability4Label.Text = "Ability 4: Plunger Of Life"
	Overview.Ability4Description.Text = " - Throw a plunger onto a teammate to provide a stream of HP for 45s - 10 HP/s - 75s cooldown"
	Overview.Ability5Label.Text = "Ability 5: Leaders Fortitude"
	Overview.Ability5Description.Text = " - Replenishes HP by 250 and Attack, Defence and Movespeed are increased by +30% - 90s cooldown"
	Overview.Ability6Label.Text = "Ability 6: Speed Of Sound"
	Overview.Ability6Description.Text = " - Movespeed is increased by +200% for 5s - 60s cooldown"
	Overview.Ability7Label.Text = "Ability 7: Blitz"
	Overview.Ability7Description.Text = " - Teleport yourself to your spawnpoint - No DMG - 60s cooldown"
  -- update the Skins UI
	Skins.Skin1.Image = "http://www.roblox.com/asset/?id=138970494622489"
	Skins.Skin2.Image = "http://www.roblox.com/asset/?id=1129362632"
end)
