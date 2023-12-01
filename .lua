local function AutoFight(world,enemy) -- world = 1, enemy = 2
    game:GetService("ReplicatedStorage")["Events"]["AutoFight"]:FireServer("Fight",world,enemy)
end
-- WAIT
local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

T1:AddToggle({
  Name = "Auto Punch",
  Default = false,
  Callback = function(Value)
    _G.p = Value
      while wait() do
      if _G.p == false then break end
        
      end
  end    
})
