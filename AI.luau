-- variables 
local MaxLookDistance = 1500 -- maximum looking distance 
local Players = game:GetService("Players") 
local ReplicatedStorage = game:GetService("ReplicatedStorage") 
local TV = script.Parent 
local team = script.Team.Value -- team of the user 

local function getNearestPlayer() 
	local closest = workspace:FindFirstChild(script.Closest.Value) 
	local part = nil 
	local dist = MaxLookDistance 
	for _,v in Players:GetPlayers() do -- iterate through every player 
		local character = v.Character 
		if character and character == closest and closest:WaitForChild("Values").Team.Value ~= team or closest:WaitForChild("Values").Team.Value == 0 and closest.Name ~= script.Owner.Value then -- only attack enemies 
			local root = character:FindFirstChild("Head") 
			if root then 
				local thisDist = (root.Position-TV.Position).Magnitude 
				if thisDist < dist then 
					dist = thisDist 
					part = root 
					task.wait(0.2) 
					local BulletSP = {1, 0.8, 0.9, 1.1} -- differing audio speeds 
					local Bullet = ReplicatedStorage.Projectiles.TVBullet:Clone() -- clone bullet 
					Bullet.Parent = workspace 
					Bullet.Fire:Play() 
					Bullet.CFrame = script.Parent.CFrame 
					Bullet.Fire.PlaybackSpeed = BulletSP[math.random(1,#BulletSP)] 
				end 
			end 
		end 
	end 
	return part 
end 

function findTorso(pos) 
	local torso = nil 
	local dist = 1500 
	local child = workspace:GetChildren() -- find every part in the game 
	for i=1, #child do 
		if child[i].ClassName == "Model" then 
			local Humanoid = child[i]:FindFirstChild("Humanoid") -- check if the part is a player 
			if Humanoid ~= nil then 
				local check = child[i]:FindFirstChild("Torso") -- check if player has torso 
				if check ~= nil then 
					if (check.Position - pos).magnitude < dist then -- check if player is within the allocated distance 
						torso = check 
						dist = (check.Position - pos).magnitude 
						script.Parent.Main.Closest.Value = tostring(Humanoid.Parent.Name) -- set this player as the closest 
					end 
				end 
			end 
		end 
	end 
	return torso 
end 

while true do -- repeatedly move the TV asset and shoot at enemies
	task.wait(0.5) 
  getNearestPlayer() 
	local torso = findTorso(script.Parent.Position) 
	if torso ~= nil then 
		script.Parent.CFrame = CFrame.new(script.Parent.Position, torso.Position) -- adjust the orientation of the asset to look at the closest player 
	end 
end 
