-- variables
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage") 
local running = true 
local berserk = false 
local juggernaut = false 
local timeleft = 300 
local active = false 
 
local function timer() -- timer function 
	if active == true then 
		for count = 900, 0, -1 do -- set maximum amount of minutes for count (15 minutes) 
			local minutes = timeleft // 60 -- calculate minutes and seconds based off of the time remaining 
			local seconds = timeleft % 60 
			if timeleft == 0 then -- change text when the time hits 0 
				script.Parent.Text = "Match Over" 
				running = false 
				active = false 
			end 
			if running == true then -- check if the timer is ticking down 
				timeleft -= 1 -- increment time 
				if seconds >= 10 then -- check if the seconds has 2 digits 
					script.Parent.Text = tostring(minutes..":"..seconds) 
				elseif seconds < 10 then  
					script.Parent.Text = tostring(minutes..":0"..seconds) -- add 0 in front if just 1 digit in seconds 
				end 
				task.wait(1) 
			elseif running == false and berserk == true then -- check if g-toilet ultimate is active 
				script.Parent.Text = "R:UN" 
				script.Parent.TextColor3 = Color3.new(255, 0, 0) 
				task.wait(1) 
			elseif running == false and juggernaut == true then -- check if juggernaut ultimate is active 
				for extend = 0, 60, 1 do -- add 60 seconds to the timer gradually 
					if timeleft < 300 then 
						timeleft += 1 
						print(timeleft) 
					end 
					minutes = timeleft // 60 
					seconds = timeleft % 60 
					if seconds >= 10 then 
						script.Parent.Text = tostring(minutes..":"..seconds) 
					elseif seconds < 10 then 
						script.Parent.Text = tostring(minutes..":0"..seconds) -- add 0 in front if just 1 digit in seconds 
					end 
					script.Parent.TextColor3 = Color3.new(0, 255, 0) 
					task.wait(0.1) 
				end 
				script.Parent.TextColor3 = Color3.new(255, 255, 255) 
			end 
		end 
	end 
end 
 
ReplicatedStorage.MatchStart.OnServerEvent:Connect(function() -- start the timer when the match starts 
	timer() -- call timer function to begin countdown
  -- adjust variables
	running = true 
	active = true 
end) 
 
ReplicatedStorage.Events.GToilet.UltimateUsed.OnServerEvent:Connect(function() -- activate upon gtoilet ultimate being used 
  -- adjust variables
	berserk = true 
	running = false 
	task.wait(20) 
	berserk = false 
	running = true 
	script.Parent.TextColor3 = Color3.new(255, 255, 255) 
end) 

ReplicatedStorage.Events.Juggernaut.UltimateUsed.OnServerEvent:Connect(function() -- active upon juggernaut ultimate being used 
  -- adjust variables
	juggernaut = true 
	running = false 
	task.wait(6) 
	juggernaut = false 
	running = true 
end) 
