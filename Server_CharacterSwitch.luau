-- variables
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CharacterEvent = ReplicatedStorage:WaitForChild("ChangeCharacterEvent")
local CharactersFolder = ReplicatedStorage:WaitForChild("Characters")

CharacterEvent.OnServerEvent:Connect(function(player, targetcharacter, skin, map) -- connects when CharacterEvent is fired by the server
	if player then
		if player:WaitForChild("PersistentValues").Gamemode.Value ~= "" then
			if CharactersFolder:FindFirstChild(targetcharacter) then -- does the character the player wants exist
				local TargetCharacterModel = CharactersFolder:FindFirstChild(targetcharacter) -- finds and stores the desired character
				local NewCharacter = TargetCharacterModel:Clone()
				local PlayerCharacter = player.Character
				local player = player
				-- replacing the old character with the new one
				NewCharacter.PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
				NewCharacter:SetPrimaryPartCFrame(PlayerCharacter.PrimaryPart.CFrame)
				NewCharacter.Name = player.Name
				-- replacing animations
				if PlayerCharacter:FindFirstChild("Animate") and not NewCharacter:FindFirstChild("Animate") then
					PlayerCharacter.Animate:Clone().Parent = NewCharacter
				end
        		-- replacing health scripts
				if PlayerCharacter:FindFirstChild("Health") and not NewCharacter:FindFirstChild("Health") then
					PlayerCharacter.Health:Clone().Parent = NewCharacter
				end
       		    -- creating the defaults for the character
				player.Character = NewCharacter
				local RootPart = NewCharacter:FindFirstChild("HumanoidRootPart")
				local PlayerRoot = player.Character:FindFirstChild("HumanoidRootPart")
				if RootPart and PlayerRoot then
					RootPart.CFrame = PlayerRoot.CFrame
				end
				NewCharacter.Parent = game.Workspace
				player.PlayerGui.UniversalGUI.Enabled = true
				player.Character.Head.BillboardGui.PlayerToHideFrom = player
				if player.PersistentValues.Gamemode.Value == "FFA" then -- determine if the players game mode is Free-for-all
					player.PlayerGui.LeaveGUI.Enabled = true -- enable Leave UI
				-- change spawn location based on the players chosen map
				if map == "AlphaHills" then
					player.TeamColor = BrickColor.new("Really black")
				elseif map == "Alaska" then
					player.TeamColor = BrickColor.new("Dark stone grey")
				elseif map == "Kyoto" then
					player.TeamColor = BrickColor.new("Medium stone grey")
				end
				elseif player.PersistentValues.Gamemode.Value == "Squads" then -- determine if the players game mode is Squads
					-- change spawn locations based on the players chosen map and their chosen team
					if player.PersistentValues.Map.Value == "AlphaHills" then
						if player.Team.Value == "Blue" then
							player.TeamColor = BrickColor.new("Electric blue")
						elseif player.Team.Value == "Red" then
							player.TeamColor = BrickColor.new("Really red")
						end
					elseif player.PersistentValues.Map.Value == "Alaska" then
						if player.Team.Value == "Blue" then
							player.TeamColor = BrickColor.new("Bright blue")
						elseif player.Team.Value == "Red" then
							player.TeamColor = BrickColor.new("Bright red")
						end
					elseif player.PersistentValues.Map.Value == "Kyoto" then
						if player.Team.Value == "Blue" then
							player.TeamColor = BrickColor.new("Lapis")
						elseif player.Team.Value == "Red" then
							player.TeamColor = BrickColor.new("Maroon")
						end
					end
				end
				player.Character.Humanoid.Health = 0 -- remove the character to allow for a reset
				-- base parts should be left unanchored so the player can move
				for i, Part in pairs(NewCharacter:GetChildren()) do
					if Part:IsA("BasePart") then
						Part.Anchored = false
	                    -- find the target character and skin, then update zoom controls and images based on the result
						if targetcharacter == "Necromancer" or targetcharacter == "Necromancer_Noli"then
							player.PlayerGui.UniversalGUI.HealthBackground.ImageLabel.Image = "http://www.roblox.com/asset/?id=125576680306354"
							player.CameraMaxZoomDistance = 225
							player.CameraMinZoomDistance = 15
					elseif targetcharacter == "Plungerman" or targetcharacter == "Plungerman_Mark" then
							player.PlayerGui.UniversalGUI.HealthBackground.ImageLabel.Image = "http://www.roblox.com/asset/?id=138970494622489"
							player.CameraMaxZoomDistance = 225
							player.CameraMinZoomDistance = 15
					elseif targetcharacter == "UTCM" or targetcharacter == "UTCM_Onett" then
							player.PlayerGui.UniversalGUI.HealthBackground.ImageLabel.Image = "http://www.roblox.com/asset/?id=112166889012013"
							player.CameraMaxZoomDistance = 900
							player.CameraMinZoomDistance = 150
							player.Character.HumanoidRootPart.UTCM_CoreIdle.Volume = 0.5
					elseif targetcharacter == "UTSM" or targetcharacter == "UTSM_Executor"then
							player.PlayerGui.UniversalGUI.HealthBackground.ImageLabel.Image = "http://www.roblox.com/asset/?id=74938520209385"
							player.CameraMaxZoomDistance = 900
							player.CameraMinZoomDistance = 150
					elseif targetcharacter == "UTTVM" or targetcharacter == "UTTVM_Devesto" then
							player.PlayerGui.UniversalGUI.HealthBackground.ImageLabel.Image = "http://www.roblox.com/asset/?id=124459838511983"
							player.CameraMaxZoomDistance = 900
							player.CameraMinZoomDistance = 150
					elseif targetcharacter == "GToilet" or targetcharacter == "GToilet_Limbus" then
							player.PlayerGui.UniversalGUI.HealthBackground.ImageLabel.Image = "http://www.roblox.com/asset/?id=86894078332246"
							player.CameraMaxZoomDistance = 900
							player.CameraMinZoomDistance = 150
					elseif targetcharacter == "Detainer" then
							player.PlayerGui.UniversalGUI.HealthBackground.ImageLabel.Image = "http://www.roblox.com/asset/?id=136346688444527"
							player.CameraMaxZoomDistance = 900
							player.CameraMinZoomDistance = 150
					elseif targetcharacter == "Juggernaut" or targetcharacter == "Juggernaut_Zabertron" then
							player.PlayerGui.UniversalGUI.HealthBackground.ImageLabel.Image = "http://www.roblox.com/asset/?id=75478129252800"
							player.CameraMaxZoomDistance = 900
							player.CameraMinZoomDistance = 150
					elseif targetcharacter == "Overseer" or targetcharacter == "Overseer_Baldi" then
							player.PlayerGui.UniversalGUI.HealthBackground.ImageLabel.Image = "http://www.roblox.com/asset/?id=82012245432994"
							player.CameraMaxZoomDistance = 450
							player.CameraMinZoomDistance = 75
					elseif targetcharacter == "DJToilet" then
							player.PlayerGui.UniversalGUI.HealthBackground.ImageLabel.Image = "http://www.roblox.com/asset/?id=98809391621629"
							player.CameraMaxZoomDistance = 450
							player.CameraMinZoomDistance = 75
						end
					end
				end
			end
		end
	end
end)
