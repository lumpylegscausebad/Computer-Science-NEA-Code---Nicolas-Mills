-- variables
local buttons = script.Parent.Parent.Parent
local transition = buttons.Parent.transition
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CharacterEvent = ReplicatedStorage:WaitForChild("ChangeCharacterEvent")
local CharactersFolder = ReplicatedStorage:WaitForChild("Characters")
local NecromancerEvent = ReplicatedStorage:WaitForChild("SwapNecromancer")
local PlungermanEvent = ReplicatedStorage:WaitForChild("SwapPlungerman")
local UTCMEvent = ReplicatedStorage:WaitForChild("SwapUTCM")
local UTSMEvent = ReplicatedStorage:WaitForChild("SwapUTSM")
local UTTVMEvent = ReplicatedStorage:WaitForChild("SwapUTTVM")
local GToiletEvent = ReplicatedStorage:WaitForChild("SwapGToilet")
local DetainerEvent = ReplicatedStorage:WaitForChild("SwapDetainer")
local JuggernautEvent = ReplicatedStorage:WaitForChild("SwapJuggernaut")
local OverseerEvent = ReplicatedStorage:WaitForChild("SwapOverseer")
local DJToiletEvent = ReplicatedStorage:WaitForChild("SwapDJToilet")

script.Parent.MouseButton1Click:Connect(function() -- activate when the play button is pressed
  -- transition away from the Main Menu
	local map = script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.PersistentValues.Map.Value
	buttons.play.TextButton.UnlockCharacter.Enabled = false
	buttons:TweenPosition(UDim2.new(0.094, 0, 1, 0), "InOut", "Quad", 1, true)
	task.wait(1)
	transition:TweenPosition(UDim2.new(0,0,0,0), "InOut", "Quad", 1, true)
	task.wait(1)
  -- get information on the player
	local players = game:GetService("Players")
	local player = players.LocalPlayer
	local char = player.Character
	local hum = char:WaitForChild("Humanoid")

  -- find the intended character and skin, then modify their values to reflect this. fire this information to the server
    
	if script.Parent.Parent.Parent.Characters.Character.Value == "Necromancer" and script.Parent.Parent.Parent.Skins.Skin.Value == 1 then
		CharacterEvent:FireServer("Necromancer", 1, map)
		NecromancerEvent:FireServer()
		player.PersistentValues.Character.Value = "Necromancer"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "Plungerman" and script.Parent.Parent.Parent.Skins.Skin.Value == 1 then
		CharacterEvent:FireServer("Plungerman", 1, map)
		PlungermanEvent:FireServer()
		player.PersistentValues.Character.Value = "Plungerman"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "UTCM" and script.Parent.Parent.Parent.Skins.Skin.Value == 1 then
		CharacterEvent:FireServer("UTCM", 1, map)
		UTCMEvent:FireServer()
		player.PersistentValues.Character.Value = "UTCM"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "UTSM" and script.Parent.Parent.Parent.Skins.Skin.Value == 1 then
		CharacterEvent:FireServer("UTSM", 1, map)
		UTSMEvent:FireServer()
		player.PersistentValues.Character.Value = "UTSM"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "UTTVM" and script.Parent.Parent.Parent.Skins.Skin.Value == 1 then
		CharacterEvent:FireServer("UTTVM", 1, map)
		UTTVMEvent:FireServer()
		player.PersistentValues.Character.Value = "UTTVM"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "GToilet" and script.Parent.Parent.Parent.Skins.Skin.Value == 1 then
		CharacterEvent:FireServer("GToilet", 1, map)
		GToiletEvent:FireServer()
		player.PersistentValues.Character.Value = "GToilet"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "Juggernaut" and script.Parent.Parent.Parent.Skins.Skin.Value == 1 then
		CharacterEvent:FireServer("Juggernaut", 1, map)
		JuggernautEvent:FireServer()
		player.PersistentValues.Character.Value = "Juggernaut"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "Overseer" and script.Parent.Parent.Parent.Skins.Skin.Value == 1 then
		CharacterEvent:FireServer("Overseer", 1, map)
		OverseerEvent:FireServer()
		player.PersistentValues.Character.Value = "Overseer"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "Necromancer" and script.Parent.Parent.Parent.Skins.Skin.Value == 2 then
		CharacterEvent:FireServer("Necromancer_Noli", 2, map)
		NecromancerEvent:FireServer()
		player.PersistentValues.Character.Value = "Necromancer_Noli"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "Plungerman" and script.Parent.Parent.Parent.Skins.Skin.Value == 2 then
		CharacterEvent:FireServer("Plungerman_Mark", 2, map)
		PlungermanEvent:FireServer()
		player.PersistentValues.Character.Value = "Plungerman_Mark"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "UTCM" and script.Parent.Parent.Parent.Skins.Skin.Value == 2 then
		CharacterEvent:FireServer("UTCM_Onett", 2, map)
		UTCMEvent:FireServer()
		player.PersistentValues.Character.Value = "UTCM_Onett"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "UTSM" and script.Parent.Parent.Parent.Skins.Skin.Value == 2 then
		CharacterEvent:FireServer("UTSM_Executor", 2, map)
		UTSMEvent:FireServer()
		player.PersistentValues.Character.Value = "UTSM_Executor"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "UTTVM" and script.Parent.Parent.Parent.Skins.Skin.Value == 2 then
		CharacterEvent:FireServer("UTTVM_Devesto", 2, map)
		UTTVMEvent:FireServer()
		player.PersistentValues.Character.Value = "UTTVM_Devesto"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "GToilet" and script.Parent.Parent.Parent.Skins.Skin.Value == 2 then
		CharacterEvent:FireServer("GToilet_Limbus", 2, map)
		GToiletEvent:FireServer()
		player.PersistentValues.Character.Value = "GToilet_Limbus"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "Juggernaut" and script.Parent.Parent.Parent.Skins.Skin.Value == 2 then
		CharacterEvent:FireServer("Juggernaut_Zabertron", 2, map)
		JuggernautEvent:FireServer()
		player.PersistentValues.Character.Value = "Juggernaut_Zabertron"
	elseif script.Parent.Parent.Parent.Characters.Character.Value == "Overseer" and script.Parent.Parent.Parent.Skins.Skin.Value == 2 then
		CharacterEvent:FireServer("Overseer_Baldi", 2, map)
		OverseerEvent:FireServer()
		player.PersistentValues.Character.Value = "Overseer_Baldi"
	else -- safeguard in erroneous scenarios
		print("No character selected")
	end
	-- disable mobile inputs
	local uis = game:GetService("UserInputService")
	if uis.TouchEnabled == true then
		uis.ModalEnabled = false
	else
	end
  -- transition out of the Main Menu to the match
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	buttons.play.TextButton.UnlockCharacter.Enabled = true
	workspace.MenuMusic:Stop()
	workspace.AstroIncomingMainMenu:Stop()
	task.wait(3)
	transition:TweenPosition(UDim2.new(-1,0,0,0), "InOut", "Quad", 1, true)
end)
