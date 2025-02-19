--// Khai báo UI
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({Name = "Blox Fruits Hub", LoadingTitle = "Blox Fruits Script", LoadingSubtitle = "by Alexander Aventaro Fischer"})

--// Tab Farm
local FarmTab = Window:CreateTab("Farm", 4483362458)

local FarmLevel = FarmTab:CreateToggle({
    Name = "Auto Farm Level",
    Callback = function(Value)
        _G.AutoFarm = Value
        while _G.AutoFarm do
            local quest = game:GetService("ReplicatedStorage").Remotes:FindFirstChild("QuestEvent")
            if quest then
                quest:FireServer("StartQuest", "CurrentQuest")
            end
            for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("HumanoidRootPart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                    game:GetService("ReplicatedStorage").Remotes.Combat:FireServer("Attack")
                end
            end
            wait(1)
        end
    end
})

local FarmAura = FarmTab:CreateToggle({
    Name = "Farm Aura",
    Callback = function(Value)
        _G.FarmAura = Value
        while _G.FarmAura do
            for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("HumanoidRootPart") then
                    game:GetService("ReplicatedStorage").Remotes.Combat:FireServer("Attack", enemy)
                end
            end
            wait(0.5)
        end
    end
})

local AutoRaid = FarmTab:CreateToggle({
    Name = "Auto Raid",
    Callback = function(Value)
        _G.AutoRaid = Value
        while _G.AutoRaid do
            -- Code Auto Raid
            wait(1)
        end
    end
})

local AutoSeaBeast = FarmTab:CreateToggle({
    Name = "Auto Sea Beast",
    Callback = function(Value)
        _G.AutoSeaBeast = Value
        while _G.AutoSeaBeast do
            -- Code Auto Sea Beast
            wait(1)
        end
    end
})

--// Tab PvP
local PvPTab = Window:CreateTab("PvP", 4483362458)

local Aimbot = PvPTab:CreateToggle({
    Name = "Aimbot",
    Callback = function(Value)
        _G.Aimbot = Value
        while _G.Aimbot do
            -- Aimbot Code
            wait(0.1)
        end
    end
})

local ESP = PvPTab:CreateToggle({
    Name = "ESP Player",
    Callback = function(Value)
        _G.ESP = Value
        while _G.ESP do
            -- ESP Code
            wait(1)
        end
    end
})

local AimbotSilent = PvPTab:CreateToggle({
    Name = "Aimbot Silent",
    Callback = function(Value)
        _G.AimbotSilent = Value
        while _G.AimbotSilent do
            -- Aimbot Silent Code
            wait(0.1)
        end
    end
})

local AimbotFOV = PvPTab:CreateSlider({
    Name = "Aimbot FOV",
    Min = 50,
    Max = 500,
    Default = 150,
    Callback = function(Value)
        _G.AimbotFOV = Value
    end
})

--// Tab Misc
local MiscTab = Window:CreateTab("Misc", 4483362458)

local Teleport = MiscTab:CreateButton({
    Name = "Teleport to Island",
    Callback = function()
        -- Teleport Code
    end
})

local FruitNotifier = MiscTab:CreateToggle({
    Name = "Fruit Notifier",
    Callback = function(Value)
        _G.FruitNotifier = Value
        while _G.FruitNotifier do
            -- Code Fruit Notifier
            wait(5)
        end
    end
})

local FastAttack = MiscTab:CreateToggle({
    Name = "Fast Attack",
    Callback = function(Value)
        _G.FastAttack = Value
        while _G.FastAttack do
            -- Code Fast Attack
            wait(0.1)
        end
    end
})
