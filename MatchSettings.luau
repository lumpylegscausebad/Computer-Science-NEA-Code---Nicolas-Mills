-- variables
local Settings = script.Parent.Parent.Parent.Parent.MainMenuGUI.mainframe.MiniSettingsPopup 
local Visible = false 
local Clickable = true 

script.Parent.MouseButton1Click:Connect(function() -- activate when the settings button is pressed
	if Visible == false and Clickable == true then -- determine if the UI is OFF screen and if the button is clickable
    -- update variables
		Visible = true 
		Clickable = false 
		Settings.Close.TextButton.LocalScript.Enabled = false -- disable the settings script
		Settings:TweenPosition(UDim2.new(0.1, 0, 0.05, 0), "InOut", "Quad", 0.5, true) -- move the Settings UI onto the screen
		task.wait(0.5) 
		Clickable = true -- make the button clickable
		Settings.Close.TextButton.LocalScript.Enabled = true -- reenable the settings script
	elseif Visible == true and Clickable == true then -- determine if the UI is ON screen and if the button is clickable
    -- update variables
		Visible = false 
		Clickable = false 
		Settings.Close.TextButton.LocalScript.Enabled = false -- disable the settings script
		Settings:TweenPosition(UDim2.new(0.1, 0, 1, 0), "InOut", "Quad", 0.5, true) -- move the Settings UI off the screen
		task.wait(0.5) 
		Clickable = true -- make the button clickable
		Settings.Close.TextButton.LocalScript.Enabled = true -- reenable the settings script
	end 
end) 
