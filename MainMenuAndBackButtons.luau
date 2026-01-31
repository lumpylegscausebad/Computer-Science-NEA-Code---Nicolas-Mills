-- variables
local buttons = script.Parent.Parent.Parent.Parent.button
local popups = buttons.Parent.PlayPopup 
local play = buttons.Play
local back = popups.Back

play.MouseButton1Click:Connect(function() -- trigger function upon the play button being pressed 
  -- disable all starting screen buttons 
  buttons.Play.TextButton.LocalScript.Enabled = false 
  buttons.Achievements.TextButton.LocalScript.Enabled = false 
  buttons.Settings.TextButton.LocalScript.Enabled = false 
  buttons:TweenPosition(UDim2.new(0.094, 0, 1, 0), "InOut", "Quad", 1, true) -- move the buttons off the screen 
  buttons.Parent.TextLabel:TweenPosition(UDim2.new(0.49, 0, -1, 0), "InOut", "Quad", 1, true) 
  task.wait(1) 
  popups:TweenPosition(UDim2.new(0.1, 0, 0.05, 0), "InOut", "Quad", 1, true) -- move the Game mode UI onto the screen 
end) 

back.MouseButton1Click:Connect(function() -- trigger function upon the button being clicked 
  popups:TweenPosition(UDim2.new(0.1, 0, 1, 0), "InOut", "Quad", 1, true) -- animate the Game mode UI going off screen 
  task.wait(1) 
  
  -- make all buttons clickable again to access all descendant UIs 
  
  buttons.Play.TextButton.LocalScript.Enabled = true 
  buttons.Achievements.TextButton.LocalScript.Enabled = true 
  buttons.Settings.TextButton.LocalScript.Enabled = true 
    
  -- animate the buttons and title coming back on screen 
    
  buttons:TweenPosition(UDim2.new(0.094, 0, 0.651, 0), "InOut", "Quad", 1, true) 
  buttons.Parent.TextLabel:TweenPosition(UDim2.new(0.49, 0, 0.02, 0), "InOut", "Quad", 1, true) 
end) 
