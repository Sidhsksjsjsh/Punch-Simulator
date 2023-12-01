local function AutoFight(world,enemy) -- world = 1, enemy = 2
    game:GetService("ReplicatedStorage")["Events"]["AutoFight"]:FireServer("Fight",world,enemy)
end

local function child(wrkspc,func)
for i,v in pairs(wrkspc:GetChilrend()) do
        if v:IsA("Model") then
            func(v)
        end
    end
end

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Hatch",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Dungeon",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T4 = Window:MakeTab({
Name = "Fighting",
Icon = "rbxassetid://",
PremiumOnly = false
})

T3:AddToggle({
  Name = "Auto Enter Dungeon",
  Default = false,
  Callback = function(Value)
    _G.edung = Value
      while wait() do
      if _G.edung == false then break end
        game:GetService("ReplicatedStorage")["Events"]["DungeonEvent"]:FireServer("StartDungeon")
      end
  end    
})

T3:AddToggle({
  Name = "Auto Kill",
  Default = false,
  Callback = function(Value)
    _G.dungeonkill = Value
      while wait() do
      if _G.dungeonkill == false then break end
        child(game:GetService("Workspace").BreakableParts.Dungeon,function(target)
           game:GetService("ReplicatedStorage")["Events"]["PunchEvent"]:FireServer(target)
        end)
      end
  end    
})

T4:AddTextbox({
  Name = "World Number",
  Default = "1",
  TextDisappear = false,
  Callback = function(Value)
    _G.AsyncWorld = tonumber(Value)
  end  
})

T4:AddTextbox({
  Name = "Enemy Number",
  Default = "1",
  TextDisappear = false,
  Callback = function(Value)
    _G.AsyncEnemy = tonumber(Value)
  end  
})

T4:AddToggle({
  Name = "FIGHT",
  Default = false,
  Callback = function(Value)
    if Value then
      AutoFight(_G.AsyncWorld,_G.AsyncEnemy)
    else
      game:GetService("ReplicatedStorage")["Events"]["AutoFight"]:FireServer("StopFight")
    end
  end    
})

T2:AddTextbox({
  Name = "Egg number",
  Default = "1",
  TextDisappear = false,
  Callback = function(Value)
    _G.AsyncEgg = Value
  end  
})

T2:AddToggle({
  Name = "Auto Hatch",
  Default = false,
  Callback = function(Value)
    _G.ht = Value
      while wait() do
      if _G.ht == false then break end
        game:GetService("ReplicatedStorage")["Events"]["PlayerPressedKeyOnEgg"]:FireServer(_G.AsyncEgg)
      end
  end    
})

T2:AddToggle({
  Name = "Auto Winter Egg",
  Default = false,
  Callback = function(Value)
    _G.htwe = Value
      while wait() do
      if _G.htwe == false then break end
        game:GetService("ReplicatedStorage")["Events"]["PlayerPressedKeyOnEgg"]:FireServer("WinterEgg")
      end
  end    
})

T2:AddToggle({
  Name = "Auto Equip Best",
  Default = false,
  Callback = function(Value)
    _G.eqb = Value
      while wait() do
      if _G.eqb == false then break end
        game:GetService("ReplicatedStorage")["Events"]["EquipBest"]:InvokeServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Punch",
  Default = false,
  Callback = function(Value)
    _G.p = Value
      while wait() do
      if _G.p == false then break end
        game:GetService("ReplicatedStorage")["Events"]["DamageIncreaseOnClickEvent"]:FireServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Claim Gifts",
  Default = false,
  Callback = function(Value)
    _G.g = Value
      while wait() do
      if _G.g == false then break end
        game:GetService("ReplicatedStorage")["Events"]["PlaytimeRewardUpdateEvent"]:FireServer(1)
        game:GetService("ReplicatedStorage")["Events"]["PlaytimeRewardUpdateEvent"]:FireServer(2)
        game:GetService("ReplicatedStorage")["Events"]["PlaytimeRewardUpdateEvent"]:FireServer(3)
        game:GetService("ReplicatedStorage")["Events"]["PlaytimeRewardUpdateEvent"]:FireServer(4)
        game:GetService("ReplicatedStorage")["Events"]["PlaytimeRewardUpdateEvent"]:FireServer(5)
        game:GetService("ReplicatedStorage")["Events"]["PlaytimeRewardUpdateEvent"]:FireServer(6)
        game:GetService("ReplicatedStorage")["Events"]["PlaytimeRewardUpdateEvent"]:FireServer(7)
        game:GetService("ReplicatedStorage")["Events"]["PlaytimeRewardUpdateEvent"]:FireServer(8)
        game:GetService("ReplicatedStorage")["Events"]["PlaytimeRewardUpdateEvent"]:FireServer(9)
        game:GetService("ReplicatedStorage")["Events"]["PlaytimeRewardUpdateEvent"]:FireServer(10)
        game:GetService("ReplicatedStorage")["Events"]["PlaytimeRewardUpdateEvent"]:FireServer(11)
        game:GetService("ReplicatedStorage")["Events"]["PlaytimeRewardUpdateEvent"]:FireServer(12)
      end
  end    
})

T1:AddToggle({
  Name = "Auto Claim Task",
  Default = false,
  Callback = function(Value)
    _G.task = Value
      while wait() do
      if _G.task == false then break end
        game:GetService("ReplicatedStorage")["Events"]["QuestEvent"]:InvokeServer("Claim")
      end
  end    
})

T1:AddToggle({
  Name = "Auto Ascend",
  Default = false,
  Callback = function(Value)
    _G.asc = Value
      while wait() do
      if _G.asc == false then break end
        game:GetService("ReplicatedStorage")["Events"]["AscendEvent"]:FireServer(true)
      end
  end
})

T1:AddToggle({
  Name = "Auto Spin",
  Default = false,
  Callback = function(Value)
    _G.spin = Value
      while wait() do
      if _G.spin == false then break end
        game:GetService("ReplicatedStorage")["Events"]["SpinWheelEvent"]:FireServer("Spin")
        game:GetService("ReplicatedStorage")["Events"]["SpinWheelEvent"]:FireServer("SpinComplete")
      end
  end
})
