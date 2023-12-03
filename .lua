--[[
Next Update: Complete features, all game systems are here!
]]

local function AutoFight(world,enemy) -- world = 1, enemy = 2
    game:GetService("ReplicatedStorage")["Events"]["AutoFight"]:FireServer("Fight",world,enemy)
end

local function child(wrkspc,func)
for i,v in pairs(wrkspc:GetChildren()) do
        func(v)
    end
end

local function PlayerFounder(func)
for _,v in pairs(game.Players:GetPlayers()) do
        func(v)
    end
end

local function descend(wrkspc,func)
for i,v in pairs(wrkspc:GetDescendants()) do
        func(v)
    end
end

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})
local lp = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")

local function NearNPC(str,array)
    local NPCTerdekat
    --local jarakTerdekat = math.huge
    
    child(str,function(npc)
        if npc:IsA("Model") and npc:FindFirstChild("Humanoid") then
            local jarak = (npc:FindFirstChild("HumanoidRootPart").Position - lp.Character.HumanoidRootPart.Position).Magnitude
            if jarak < array then
                NPCTerdekat = npc
                --jarakTerdekat = jarak
            end
        end
    end)
    
    return NPCTerdekat
end

--[[Main loop
while true do
    wait(1)  -- Ubah sesuai kebutuhan
    
    local NPC = CariNPCTerdekat()
    
    if NPC then
        print("NPC terdekat ditemukan:", NPC.Name)
        -- Lakukan tindakan terhadap NPC terdekat di sini
    else
        print("Tidak ada NPC terdekat.")
    end
end]]

local GlovesHandler = {}
local EggHandler = {}
local upgradeList = {
    "CoinBoost",
    "GemBoost",
    "ScrewCopperBoltBoost",
    "EggLuck",
    "TankSpeed",
    "CoinCollectionRange"
}


OrionLib:AddTable(game:GetService("ReplicatedStorage").Gloves,GlovesHandler)
OrionLib:AddTable(game:GetService("Workspace").EggVendors,EggHandler)

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

local T5 = Window:MakeTab({
Name = "Teleport",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T6 = Window:MakeTab({
Name = "Config & Troll",
Icon = "rbxassetid://",
PremiumOnly = false
})

local S1 = T6:AddSection({
Name = "CONFIGS | GET ITEMS"
})

local S2 = T6:AddSection({
Name = "TROLLING | SPAM TRADE"
})

local T7 = Window:MakeTab({
Name = "Gloves",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T8 = Window:MakeTab({
Name = "ProximityPrompt",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T9 = Window:MakeTab({
Name = "Upgrades",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T10 = Window:MakeTab({
Name = "Skills",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T11 = Window:MakeTab({
Name = "Powercore",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T12 = Window:MakeTab({
Name = "Perks",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T13 = Window:MakeTab({
Name = "Wishing",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T14 = Window:MakeTab({
Name = "Equipment Store",
Icon = "rbxassetid://",
PremiumOnly = false
})

T9:AddDropdown({
   Name = "Select Item Name",
   Default = upgradeList[1],
   Options = upgradeList,
   Callback = function(Value)
      _G.AsyncUpgradeList = Value
   end    
})

T8:AddToggle({
  Name = "Remove ProximityPrompt Duration",
  Default = false,
  Callback = function(Value)
    _G.ppcd = Value
      while wait() do
      if _G.ppcd == false then break end
        descend(workspace,function(Prompt)
            if Prompt:IsA("ProximityPrompt") then
               Prompt.HoldDuration = 0
               Prompt.ActionText = "🚫 Cooldown Removed 🚫"
            end
        end)
      end
  end    
})

T5:AddTextbox({
  Name = "Enter World",
  Default = "1",
  TextDisappear = false,
  Callback = function(Value)
    _G.AsyncWorldNumber = tonumber(Value)
  end  
})

T5:AddButton({
Name = "Teleport",
Callback = function()
      game:GetService("ReplicatedStorage")["Events"]["TeleportEvent"]:InvokeServer("Teleport",_G.AsyncWorldNumber)
      OrionLib:MakeNotification({Name = "Teleported!",Content = "Successfully teleported to the zone",Image = "rbxassetid://",Time = 5})
  end    
})

T5:AddButton({
Name = "Buy Zone",
Callback = function()
      game:GetService("ReplicatedStorage")["Events"]["TeleportEvent"]:InvokeServer("PurchaseTeleport",_G.AsyncWorldNumber)
      OrionLib:MakeNotification({Name = "Purchased!",Content = "Successfully purchased the zone!",Image = "rbxassetid://",Time = 5})
  end    
})

T7:AddDropdown({
   Name = "Select Gloves",
   Default = GlovesHandler[1],
   Options = GlovesHandler,
   Callback = function(Value)
      _G.AsyncGloveShop = Value
   end    
})

T7:AddButton({
Name = "Equip Glove",
Callback = function()
      game:GetService("ReplicatedStorage")["Events"]["ClickedGlovesButton"]:FireServer(_G.AsyncGloveShop)
      game:GetService("ReplicatedStorage")["Events"]["RequestGloveShop"]:FireServer()
  end    
})

S1:AddDropdown({
   Name = "Select Item",
   Default = "Gems",
   Options = {"Gems","Screws","Bolts","Coppers"},
   Callback = function(Value)
      _G.AsyncItems = Value
   end    
})

S1:AddToggle({
  Name = "Get Item ( with bad chance 😭 )",
  Default = false,
  Callback = function(Value)
    _G.getItems = Value
      while wait() do
      if _G.getItems == false then break end
        game:GetService("ReplicatedStorage")["CollectedCurrency"]:FireServer(_G.AsyncItems,math.random(2.1))
      end
  end    
})

S2:AddToggle({
  Name = "Spam Trade",
  Default = false,
  Callback = function(Value)
    _G.strd = Value
      while wait() do
      if _G.strd == false then break end
        PlayerFounder(function(shit)
           game:GetService("ReplicatedStorage")["Events"]["SendTradeInvite"]:FireServer(shit)
        end)
      end
  end    
})

S2:AddToggle({
  Name = "Auto Ready Trade",
  Default = false,
  Callback = function(Value)
    _G.rtrd = Value
      while wait() do
      if _G.rtrd == false then break end
        game:GetService("ReplicatedStorage")["Events"]["TradeState"]:FireServer("Ready")
      end
  end    
})

S2:AddToggle({
  Name = "Auto Cancel Trade",
  Default = false,
  Callback = function(Value)
    _G.ctrd = Value
      while wait() do
      if _G.ctrd == false then break end
        game:GetService("ReplicatedStorage")["Events"]["TradeState"]:FireServer("Cancel")
      end
  end    
})

S2:AddToggle({
  Name = "Auto Decline Trade Request",
  Default = false,
  Callback = function(Value)
    _G.dtrd = Value
      while wait() do
      if _G.dtrd == false then break end
        PlayerFounder(function(plr)
           game:GetService("ReplicatedStorage")["Events"]["TradeState"]:FireServer("Decline",plr)
        end)
      end
  end    
})

S2:AddToggle({
  Name = "Auto Accept Trade Request",
  Default = false,
  Callback = function(Value)
    _G.atrdr = Value
      while wait() do
      if _G.atrdr == false then break end
        PlayerFounder(function(plr)
           game:GetService("ReplicatedStorage")["Events"]["TradeState"]:FireServer("Accept",plr)
        end)
      end
  end    
})

T3:AddTextbox({
  Name = "Bring Distance",
  Default = "11",
  TextDisappear = false,
  Callback = function(Value)
    _G.AsyncDistance = -tonumber(Value)
    --_G.getAsyncKillDistance = tonumber(Value)
  end  
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
  Name = "Auto Kill Nearest",
  Default = false,
  Callback = function(Value)
    _G.dungeonkill = Value
      while wait() do
      if _G.dungeonkill == false then break end
        child(game:GetService("Workspace").BreakableParts.Dungeon,function(target)
            if target:IsA("Model") then
                game:GetService("ReplicatedStorage")["Events"]["PunchEvent"]:FireServer(NearNPC(game:GetService("Workspace").BreakableParts.Dungeon,11))
            end
        end)
      end
  end    
})

T3:AddToggle({
  Name = "Auto Freeze NPCs",
  Default = false,
  Callback = function(Value)
    _G.fnpc = Value
      while wait() do
      if _G.fnpc == false then break end
        child(game:GetService("Workspace").BreakableParts.Dungeon,function(target)
            if target:IsA("Model") then
                target.Humanoid.WalkSpeed = 0
            end
        end)
      end
  end    
})

T3:AddToggle({
  Name = "Auto Bring NPCs",
  Default = false,
  Callback = function(Value)
    _G.bnpc = Value
      while wait() do
      if _G.bnpc == false then break end
        child(game:GetService("Workspace").BreakableParts.Dungeon,function(target)
            if target:IsA("Model") and target:FindFirstChild("HumanoidRootPart") then
                target.HumanoidRootPart.CFrame = lp.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,_G.AsyncDistance)
            end
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

--[[T2:AddTextbox({
  Name = "Egg number",
  Default = "1",
  TextDisappear = false,
  Callback = function(Value)
    _G.AsyncEgg = Value
  end  
})
]]

T2:AddDropdown({
   Name = "Select Eggs",
   Default = EggHandler[1],
   Options = EggHandler,
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

T9:AddToggle({
  Name = "Auto Upgrade",
  Default = false,
  Callback = function(Value)
    _G.upg = Value
      while wait() do
      if _G.upg == false then break end
        game:GetService("ReplicatedStorage")["Events"]["GemStoreEvent"]:InvokeServer("Purchase",_G.AsyncUpgradeList)
      end
  end
})

T10:AddTextbox({
  Name = "Insert Skill Name",
  Default = "Dagger",
  TextDisappear = false,
  Callback = function(Value)
    _G.AsyncSkills = Value
  end  
})

T10:AddTextbox({
  Name = "Insert Skill ID",
  Default = "0",
  TextDisappear = false,
  Callback = function(Value)
    _G.AsyncSkillsConvert = Value
  end  
})

T10:AddToggle({
  Name = "Auto Craft",
  Default = false,
  Callback = function(Value)
    _G.skills = Value
      while wait() do
      if _G.skills == false then break end
        game:GetService("ReplicatedStorage")["Events"]["CraftingEvent"]:FireServer(_G.AsyncSkills)
      end
  end
})

T10:AddToggle({
  Name = "Auto Merge",
  Default = false,
  Callback = function(Value)
    _G.skillscr = Value
      while wait() do
      if _G.skillscr == false then break end
        game:GetService("ReplicatedStorage")["Events"]["PlayerMergeEquipment"]:FireServer({_G.AsyncSkillsConvert,_G.AsyncSkillsConvert,_G.AsyncSkillsConvert})
      end
  end
})

T11:AddToggle({
  Name = "Auto Upgrade Powercore Level",
  Default = false,
  Callback = function(Value)
    _G.powercorelvl = Value
      while wait() do
      if _G.powercorelvl == false then break end
        game:GetService("ReplicatedStorage")["Events"]["PowerCore"]:InvokeServer("PurchaseNext")
      end
  end
})

T12:AddToggle({
  Name = "Auto Upgrade Perks",
  Default = false,
  Callback = function(Value)
    _G.perksupg = Value
      while wait() do
      if _G.perksupg == false then break end
        game:GetService("ReplicatedStorage")["Events"]["BuyPerkTier"]:FireServer(1)
        game:GetService("ReplicatedStorage")["Events"]["BuyPerkTier"]:FireServer(2)
        game:GetService("ReplicatedStorage")["Events"]["BuyPerkTier"]:FireServer(3)
        game:GetService("ReplicatedStorage")["Events"]["BuyPerkTier"]:FireServer(4)
        game:GetService("ReplicatedStorage")["Events"]["BuyPerkTier"]:FireServer(5)
        game:GetService("ReplicatedStorage")["Events"]["BuyPerkTier"]:FireServer(6)
        game:GetService("ReplicatedStorage")["Events"]["BuyPerkTier"]:FireServer(7)
      end
  end
})

T13:AddButton({
Name = "Buy Tier 1 [ Small ]",
Callback = function()
      game:GetService("ReplicatedStorage")["Events"]["WishingWell"]:FireServer("Small")
  end    
})

T13:AddButton({
Name = "Buy Tier 2 [ Medium ]",
Callback = function()
      game:GetService("ReplicatedStorage")["Events"]["WishingWell"]:FireServer("Medium")
  end    
})

T13:AddButton({
Name = "Buy Tier 3 [ Mega ]",
Callback = function()
      game:GetService("ReplicatedStorage")["Events"]["WishingWell"]:FireServer("Mega")
  end    
})

T14:AddButton({
Name = "Buy Tier 1",
Callback = function()
      game:GetService("ReplicatedStorage")["Events"]["EquipmentStoreEvent"]:InvokeServer("Purchase",1)
  end    
})

T14:AddButton({
Name = "Buy Tier 2",
Callback = function()
      game:GetService("ReplicatedStorage")["Events"]["EquipmentStoreEvent"]:InvokeServer("Purchase",2)
  end    
})

T14:AddButton({
Name = "Buy Tier 3",
Callback = function()
      game:GetService("ReplicatedStorage")["Events"]["EquipmentStoreEvent"]:InvokeServer("Purchase",3)
  end    
})
