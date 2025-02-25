-- Fake Lag Script for Blox Fruits
local FakeLag = false
local FakeLagButton = Instance.new("TextButton")

-- UI Setup
FakeLagButton.Size = UDim2.new(0, 100, 0, 50)
FakeLagButton.Position = UDim2.new(0.5, -50, 0.1, 0)
FakeLagButton.Text = "FakeLag"
FakeLagButton.Parent = game.CoreGui
FakeLagButton.Draggable = true
FakeLagButton.Active = true
FakeLagButton.BackgroundColor3 = Color3.new(1, 0, 0)

FakeLagButton.MouseButton1Click:Connect(function()
    FakeLag = not FakeLag
    FakeLagButton.BackgroundColor3 = FakeLag and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
    if FakeLag then
        spawn(function()
            while FakeLag do
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then
                        local character = player.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            local lagClone = Instance.new("Part")
                            lagClone.Size = Vector3.new(3, 6, 3)
                            lagClone.Color = Color3.new(1, 0, 0)
                            lagClone.Position = character.HumanoidRootPart.Position
                            lagClone.Anchored = true
                            lagClone.CanCollide = false
                            lagClone.Parent = workspace

                            local touchConnection
                            touchConnection = lagClone.Touched:Connect(function(hit)
                                local hitPlayer = game.Players:GetPlayerFromCharacter(hit.Parent)
                                if hitPlayer == player then
                                    hitPlayer.Character.Humanoid:TakeDamage(20)
                                    touchConnection:Disconnect()
                                    lagClone:Destroy()
                                end
                            end)
                            
                            lagClone.ChildAdded:Connect(function(child)
                                if child:IsA("Explosion") or child:IsA("ParticleEmitter") or child:IsA("Beam") then
                                    hitPlayer.Character.Humanoid:TakeDamage(30)
                                end
                            end)
                            
                            game:GetService("Debris"):AddItem(lagClone, 3)
                        end
                    end
                end
                wait(1.5)
            end
        end)
    end
end)
