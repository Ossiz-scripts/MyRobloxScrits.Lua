local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local flingActive = false

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlingGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 180, 0, 100)
mainFrame.Position = UDim2.new(0.5, -90, 0.1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.Draggable = true
mainFrame.Active = true

local creditText = Instance.new("TextLabel", mainFrame)
creditText.Size = UDim2.new(1, 0, 0, 20)
creditText.Position = UDim2.new(0, 0, 0.05, 0)
creditText.BackgroundTransparency = 1
creditText.Text = "Ossiz15 script"
creditText.TextColor3 = Color3.fromRGB(255, 255, 255)
creditText.Font = Enum.Font.SourceSansBold
creditText.TextSize = 16

local btn = Instance.new("TextButton", mainFrame)
btn.Size = UDim2.new(0.9, 0, 0, 50)
btn.Position = UDim2.new(0.05, 0, 0.35, 0)
btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
btn.Text = "FLING: AV (F)"
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.SourceSansBold
btn.TextSize = 20

local function toggle()
    flingActive = not flingActive
    if flingActive then
        btn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        btn.Text = "FLING: PÅ (F)"
    else
        btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        btn.Text = "FLING: AV (F)"
    end
end

UserInputService.InputBegan:Connect(function(input, processed)
    if input.KeyCode == Enum.KeyCode.F and not UserInputService:GetFocusedTextBox() then
        toggle()
    end
end)

btn.MouseButton1Click:Connect(toggle)

RunService.Heartbeat:Connect(function()
    if flingActive and player.Character then
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local oldVel = hrp.Velocity
            hrp.Velocity = Vector3.new(25000, 25000, 25000)
            RunService.RenderStepped:Wait()
            if hrp then hrp.Velocity = oldVel end
        end
    end
end)
