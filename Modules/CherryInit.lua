-- Cherry Hub Premium UI Library - Core Initialization
local CherryHub = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Main UI Elements
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CherryHubPremium"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Create the main window
function CherryHub:CreateWindow(title)
    local UI = {}
    
    -- Main frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -175)
    MainFrame.Size = UDim2.new(0, 600, 0, 350)
    MainFrame.ClipsDescendants = true
    
    -- Add shadow
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.Parent = MainFrame
    Shadow.BackgroundTransparency = 1
    Shadow.Position = UDim2.new(0.5, -340, 0.5, -215)
    Shadow.Size = UDim2.new(0, 680, 0, 430)
    Shadow.ZIndex = 0
    Shadow.Image = "rbxassetid://6014261993"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.1
    
    -- Add corner radius
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 8)
    MainCorner.Parent = MainFrame
    
    -- Store UI elements
    UI.MainFrame = MainFrame
    UI.ScreenGui = ScreenGui
    UI.Components = {}
    
    -- Load components
    for name, component in pairs(CherryHub.Components) do
        UI.Components[name] = component(UI)
    end
    
    -- Create header
    UI.Components.Header:Create(title)
    
    -- Create tab container
    UI.Components.TabContainer:Create()
    
    -- Create content container
    UI.Components.ContentContainer:Create()
    
    return UI
end

-- Store registered components
CherryHub.Components = {}

return CherryHub