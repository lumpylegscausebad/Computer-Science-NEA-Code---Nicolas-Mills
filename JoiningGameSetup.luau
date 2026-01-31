-- variables
local cam = workspace. Camera
local Camera = game.Workspace.MenuLocation.MenuCamera
local players = game:GetService("Players")
local player = players.LocalPlayer 
local char = player.Character 
local hum = char:WaitForChild("Humanoid") 

repeat wait() until cam. CameraSubject ~= nil  -- wait until the player loads into the game 
  cam.CameraType = Enum.CameraType.Scriptable -- set the players camera type to scriptable to let the rest of the algorithm work 
  cam.CFrame = Camera.CFrame -- changes camera position to the parts position 
  game.Workspace.AstroIncomingMainMenu:Play() -- starts the main menu music 
  game.Workspace.AstroIncomingMainMenu.Playing = true
end

-- prevent the player from being able to move while on the main menu 
hum.WalkSpeed = 0 
hum.JumpHeight = 0 
local uis = game:GetService("UserInputService") 
if uis.TouchEnabled == true then 
  uis.ModalEnabled = true -- removes the built in roblox movement UI for mobile devices 
else 
  end 
end 
