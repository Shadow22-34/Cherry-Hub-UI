-- Cherry Hub Premium UI Library
local CherryHub = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Main UI Elements
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Shadow = Instance.new("ImageLabel")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Logo = Instance.new("ImageLabel")
local CloseButton = Instance.new("ImageButton")
local MinimizeButton = Instance.new("ImageButton")
local TabContainer = Instance.new("Frame")
local ContentContainer = Instance.new("Frame")

-- UI Properties
ScreenGui.Name = "CherryHubPremium"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Shadow effect
Shadow.Name = "Shadow"
Shadow.Parent = ScreenGui
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(0, 620, 0, 420)
Shadow.Image = "rbxassetid://6015897843"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.6
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(49, 49, 450, 450)

-- Main frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20) -- Base dark color
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.ClipsDescendants = true

-- Round corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Top bar
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(15, 15, 20) -- Match main frame color
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 40)

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 10)
TopBarCorner.Parent = TopBar

-- Cherry Hub Logo
Logo.Name = "Logo"
Logo.Parent = TopBar
Logo.BackgroundTransparency = 1
Logo.Position = UDim2.new(0, 10, 0.5, -12)
Logo.Size = UDim2.new(0, 24, 0, 24)
Logo.Image = "rbxassetid://6031302931" -- Cherry icon
Logo.ImageColor3 = Color3.fromRGB(255, 80, 100)

-- Title
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 44, 0, 0)
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "Cherry Hub Premium"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Add premium text effects to the title
local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 150, 170)),
    ColorSequenceKeypoint.new(0.7, Color3.fromRGB(255, 100, 120)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 80, 100))
})
titleGradient.Parent = Title

-- Add a subtle glow effect behind the title
local titleGlow = Instance.new("ImageLabel")
titleGlow.Name = "TitleGlow"
titleGlow.Parent = Title
titleGlow.BackgroundTransparency = 1
titleGlow.Position = UDim2.new(0, -5, 0, -2)
titleGlow.Size = UDim2.new(1, 10, 1, 4)
titleGlow.Image = "rbxassetid://4996891970" -- Radial gradient
titleGlow.ImageColor3 = Color3.fromRGB(255, 80, 100)
titleGlow.ImageTransparency = 0.7
titleGlow.ZIndex = Title.ZIndex - 1

-- Add a subtle stroke effect to the title
local titleStroke = Instance.new("UIStroke")
titleStroke.Color = Color3.fromRGB(255, 100, 120)
titleStroke.Thickness = 1
titleStroke.Transparency = 0.7
titleStroke.Parent = Title

-- Animate the title gradient
spawn(function()
    local offset = 0
    while Title.Parent do
        offset = (offset + 0.001) % 1
        titleGradient.Offset = Vector2.new(offset, 0)
        
        -- Subtle pulse animation for the glow
        for i = 0, 10 do
            if not titleGlow.Parent then break end
            titleGlow.ImageTransparency = 0.7 + (math.sin(i/10 * math.pi) * 0.2)
            wait(0.1)
        end
    end
end)

-- Close and Minimize buttons
CloseButton = Instance.new("ImageButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundTransparency = 1
CloseButton.Position = UDim2.new(1, -30, 0.5, -10)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Image = "rbxassetid://6031094678" -- Close icon
CloseButton.ImageColor3 = Color3.fromRGB(255, 80, 100)

MinimizeButton = Instance.new("ImageButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TopBar
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Position = UDim2.new(1, -60, 0.5, -10)
MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
MinimizeButton.Image = "rbxassetid://6031090990" -- Minimize icon
MinimizeButton.ImageColor3 = Color3.fromRGB(200, 200, 200)

-- Tab Container
TabContainer.Name = "TabContainer"
TabContainer.Parent = MainFrame
TabContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 20) -- Match main frame color
TabContainer.BorderSizePixel = 0
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.Size = UDim2.new(0, 150, 1, -40)

-- Remove the container gradient for cleaner look
if TabContainer:FindFirstChild("UIGradient") then
    TabContainer:FindFirstChild("UIGradient"):Destroy()
end

local TabContainerCorner = Instance.new("UICorner")
TabContainerCorner.CornerRadius = UDim.new(0, 8)
TabContainerCorner.Parent = TabContainer

-- Fix the corner overlap with a frame
local CornerFix = Instance.new("Frame")
CornerFix.Name = "CornerFix"
CornerFix.Parent = TabContainer
CornerFix.BackgroundColor3 = Color3.fromRGB(15, 15, 20) -- Match TabContainer color
CornerFix.BorderSizePixel = 0
CornerFix.Position = UDim2.new(1, -8, 0, 0)
CornerFix.Size = UDim2.new(0, 8, 0, 8)

-- Add a header to the tab container with matching colors
local tabHeader = Instance.new("Frame")
tabHeader.Name = "TabHeader"
tabHeader.Parent = TabContainer
tabHeader.BackgroundColor3 = Color3.fromRGB(15, 15, 20) -- Match TabContainer color
tabHeader.BorderSizePixel = 0
tabHeader.Position = UDim2.new(0, 0, 0, 0)
tabHeader.Size = UDim2.new(1, 0, 0, 30)

local headerText = Instance.new("TextLabel")
headerText.Name = "HeaderText"
headerText.Parent = tabHeader
headerText.BackgroundTransparency = 1
headerText.Position = UDim2.new(0, 15, 0, 0)
headerText.Size = UDim2.new(1, -15, 1, 0)
headerText.Font = Enum.Font.GothamBold
headerText.Text = "NAVIGATION"
headerText.TextColor3 = Color3.fromRGB(255, 80, 100)
headerText.TextSize = 11
headerText.TextXAlignment = Enum.TextXAlignment.Left

-- Add a more subtle separator line with enhanced glow effect
local separator = Instance.new("Frame")
separator.Name = "Separator"
separator.Parent = TabContainer
separator.BackgroundColor3 = Color3.fromRGB(255, 80, 100) -- Cherry red color
separator.BorderSizePixel = 0
separator.Position = UDim2.new(0, 10, 0, 30)
separator.Size = UDim2.new(1, -20, 0, 1)
separator.Transparency = 0.2

-- Create a wider gradient pattern that repeats seamlessly
local separatorGradient = Instance.new("UIGradient")
separatorGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 100)),
    ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 100, 120)),
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 80, 100)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(255, 100, 120)),
    ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 80, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 80, 100))
})
separatorGradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.8),
    NumberSequenceKeypoint.new(0.2, 0.2),
    NumberSequenceKeypoint.new(0.4, 0.8),
    NumberSequenceKeypoint.new(0.6, 0.2),
    NumberSequenceKeypoint.new(0.8, 0.8),
    NumberSequenceKeypoint.new(1, 0.8)
})
-- Set initial offset to make the pattern start in the middle
separatorGradient.Offset = Vector2.new(-0.2, 0)
separatorGradient.Parent = separator

-- Add glow effect under the separator
local separatorGlow = Instance.new("ImageLabel")
separatorGlow.Name = "SeparatorGlow"
separatorGlow.Parent = separator
separatorGlow.BackgroundTransparency = 1
separatorGlow.Position = UDim2.new(0, -10, 0, -2)
separatorGlow.Size = UDim2.new(1, 20, 0, 5)
separatorGlow.Image = "rbxassetid://4996891970" -- Radial gradient
separatorGlow.ImageColor3 = Color3.fromRGB(255, 80, 100)
separatorGlow.ImageTransparency = 0.5
separatorGlow.ScaleType = Enum.ScaleType.Slice
separatorGlow.SliceCenter = Rect.new(10, 10, 10, 10)

-- Improved animation that creates a truly continuous flow
spawn(function()
    -- Create a continuous animation that never needs to reset
    local offset = -0.2 -- Start at the same position as the initial offset
    local animationSpeed = 0.0008 -- Very slow speed for subtle effect
    
    while separator.Parent do
        -- Move the gradient pattern
        offset = offset + animationSpeed
        
        -- When we reach a certain point, reset the position but keep the visual pattern aligned
        if offset >= 0.8 then
            offset = -0.2 -- Reset to starting position (creates a seamless loop)
        end
        
        separatorGradient.Offset = Vector2.new(offset, 0)
        game:GetService("RunService").Heartbeat:Wait() -- Sync with frame rate
    end
end)

-- Tab List with updated position
local TabList = Instance.new("ScrollingFrame")
TabList.Name = "TabList"
TabList.Parent = TabContainer
TabList.Active = true
TabList.BackgroundTransparency = 1
TabList.Position = UDim2.new(0, 0, 0, 40) -- Adjusted for header
TabList.Size = UDim2.new(1, 0, 1, -50) -- Adjusted for header and footer
TabList.CanvasSize = UDim2.new(0, 0, 0, 0)
TabList.ScrollBarThickness = 2
TabList.ScrollBarImageColor3 = Color3.fromRGB(255, 80, 100)
TabList.ScrollBarImageTransparency = 0.8
TabList.AutomaticCanvasSize = Enum.AutomaticSize.Y

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.Parent = TabList
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 8) -- Increased padding between tabs

local TabListPadding = Instance.new("UIPadding")
TabListPadding.Parent = TabList
TabListPadding.PaddingLeft = UDim.new(0, 10)
TabListPadding.PaddingRight = UDim.new(0, 10)
TabListPadding.PaddingTop = UDim.new(0, 5)
TabListPadding.PaddingBottom = UDim.new(0, 5)

-- Content Container
ContentContainer.Name = "ContentContainer"
ContentContainer.Parent = MainFrame
ContentContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 25) -- Slightly lighter for content area
ContentContainer.BorderSizePixel = 0
ContentContainer.Position = UDim2.new(0, 150, 0, 40)
ContentContainer.Size = UDim2.new(1, -150, 1, -40)

-- Tab creation function
function CherryHub:CreateTab(name, icon)
    -- Create a container for the tab to hold both icon and text
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = name.."Container"
    tabContainer.Parent = TabList
    tabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 30) -- Lighter tab background
    tabContainer.BorderSizePixel = 0
    tabContainer.Size = UDim2.new(1, 0, 0, 36)
    
    -- Add ripple effect function
    local function createRipple(x, y)
        local ripple = Instance.new("Frame")
        ripple.Name = "Ripple"
        ripple.Parent = tabContainer
        ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ripple.BackgroundTransparency = 0.8
        ripple.BorderSizePixel = 0
        ripple.Position = UDim2.new(0, x - 5, 0, y - 5)
        ripple.Size = UDim2.new(0, 10, 0, 10)
        ripple.ZIndex = 10
        
        local rippleCorner = Instance.new("UICorner")
        rippleCorner.CornerRadius = UDim.new(1, 0)
        rippleCorner.Parent = ripple
        
        -- Animate the ripple
        TweenService:Create(ripple, TweenInfo.new(0.5), {
            Size = UDim2.new(0, 150, 0, 150),
            Position = UDim2.new(0, x - 75, 0, y - 75),
            BackgroundTransparency = 1
        }):Play()
        
        -- Remove the ripple after animation
        game:GetService("Debris"):AddItem(ripple, 0.5)
    end
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 6)
    containerCorner.Parent = tabContainer
    
    -- Add a subtle gradient to the tab
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 32, 37)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 28, 33))
    })
    gradient.Rotation = 90
    gradient.Parent = tabContainer
    
    -- Add a subtle stroke effect
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 65)
    stroke.Thickness = 1
    stroke.Transparency = 0.7
    stroke.Parent = tabContainer
    
    local tabButton = Instance.new("TextButton")
    tabButton.Name = name.."Tab"
    tabButton.Parent = tabContainer
    tabButton.BackgroundTransparency = 1
    tabButton.Size = UDim2.new(1, 0, 1, 0)
    tabButton.Font = Enum.Font.GothamSemibold
    tabButton.Text = name
    tabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    tabButton.TextSize = 14
    tabButton.AutoButtonColor = false
    tabButton.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Add a selection indicator
    local selectionIndicator = Instance.new("Frame")
    selectionIndicator.Name = "SelectionIndicator"
    selectionIndicator.Parent = tabContainer
    selectionIndicator.BackgroundColor3 = Color3.fromRGB(255, 80, 100)
    selectionIndicator.BorderSizePixel = 0
    selectionIndicator.Position = UDim2.new(0, 0, 0, 0)
    selectionIndicator.Size = UDim2.new(0, 3, 1, 0)
    selectionIndicator.Visible = false
    
    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(0, 2)
    indicatorCorner.Parent = selectionIndicator
    
    local tabIcon
    if icon then
        tabIcon = Instance.new("ImageLabel")
        tabIcon.Name = "Icon"
        tabIcon.Parent = tabContainer
        tabIcon.BackgroundTransparency = 1
        tabIcon.Position = UDim2.new(0, 12, 0.5, -10)
        tabIcon.Size = UDim2.new(0, 20, 0, 20)
        tabIcon.Image = icon
        tabIcon.ImageColor3 = Color3.fromRGB(200, 200, 200)
        
        -- Add a subtle glow effect to the icon
        local iconGlow = Instance.new("ImageLabel")
        iconGlow.Name = "Glow"
        iconGlow.Parent = tabIcon
        iconGlow.BackgroundTransparency = 1
        iconGlow.Position = UDim2.new(0.5, -15, 0.5, -15)
        iconGlow.Size = UDim2.new(0, 30, 0, 30)
        iconGlow.Image = "rbxassetid://4996891970" -- Radial gradient
        iconGlow.ImageColor3 = Color3.fromRGB(255, 80, 100)
        iconGlow.ImageTransparency = 1 -- Start invisible
        iconGlow.ZIndex = tabIcon.ZIndex - 1
        
        -- Adjust text position
        tabButton.TextXAlignment = Enum.TextXAlignment.Left
        tabButton.Position = UDim2.new(0, 40, 0, 0)
        tabButton.Size = UDim2.new(1, -40, 1, 0)
    end
    
    -- Create content page
    local contentPage = Instance.new("ScrollingFrame")
    contentPage.Name = name.."Page"
    contentPage.Parent = ContentContainer
    contentPage.BackgroundTransparency = 1
    contentPage.BorderSizePixel = 0
    contentPage.Size = UDim2.new(1, 0, 1, 0)
    contentPage.CanvasSize = UDim2.new(0, 0, 0, 0)
    contentPage.ScrollBarThickness = 4
    contentPage.ScrollBarImageColor3 = Color3.fromRGB(255, 80, 100)
    contentPage.Visible = false
    contentPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
    
    local contentPadding = Instance.new("UIPadding")
    contentPadding.Parent = contentPage
    contentPadding.PaddingLeft = UDim.new(0, 15)
    contentPadding.PaddingRight = UDim.new(0, 15)
    contentPadding.PaddingTop = UDim.new(0, 15)
    contentPadding.PaddingBottom = UDim.new(0, 15)
    
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Parent = contentPage
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Padding = UDim.new(0, 10)
    
    -- Tab selection logic
    local function selectTab()
        -- Hide all pages
        for _, child in pairs(ContentContainer:GetChildren()) do
            if child:IsA("ScrollingFrame") then
                child.Visible = false
            end
        end
        
        -- Reset all tab buttons
        for _, child in pairs(TabList:GetChildren()) do
            if child:IsA("Frame") then
                -- Reset gradient
                if child:FindFirstChild("UIGradient") then
                    child.UIGradient.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 32, 37)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 28, 33))
                    })
                end
                
                -- Reset stroke
                if child:FindFirstChild("UIStroke") then
                    child.UIStroke.Color = Color3.fromRGB(60, 60, 65)
                    child.UIStroke.Transparency = 0.7
                end
                
                -- Reset selection indicator
                if child:FindFirstChild("SelectionIndicator") then
                    child.SelectionIndicator.Visible = false
                end
                
                -- Reset text color
                if child:FindFirstChild(child.Name:gsub("Container", "Tab")) then
                    child[child.Name:gsub("Container", "Tab")].TextColor3 = Color3.fromRGB(200, 200, 200)
                end
                
                -- Reset icon color and glow
                if child:FindFirstChild("Icon") then
                    child.Icon.ImageColor3 = Color3.fromRGB(200, 200, 200)
                    if child.Icon:FindFirstChild("Glow") then
                        TweenService:Create(child.Icon.Glow, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
                    end
                end
            end
        end
        
        -- Show selected page and highlight tab
        contentPage.Visible = true
        
        -- Update gradient for selected tab
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 120)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 80, 100))
        })
        
        -- Update stroke for selected tab
        stroke.Color = Color3.fromRGB(255, 120, 140)
        stroke.Transparency = 0.5
        
        -- Show selection indicator with animation
        selectionIndicator.Visible = true
        selectionIndicator.Size = UDim2.new(0, 3, 0, 0)
        selectionIndicator.Position = UDim2.new(0, 0, 0.5, 0)
        TweenService:Create(selectionIndicator, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 3, 1, 0),
            Position = UDim2.new(0, 0, 0, 0)
        }):Play()
        
        -- Update text color
        tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        -- Update icon and animate glow
        if tabIcon then
            tabIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
            TweenService:Create(tabIcon, TweenInfo.new(0.3), {
                Position = UDim2.new(0, 14, 0.5, -10) -- Subtle movement
            }):Play()
            
            if tabIcon:FindFirstChild("Glow") then
                TweenService:Create(tabIcon.Glow, TweenInfo.new(0.5), {ImageTransparency = 0.7}):Play()
            end
        end
    end
    
    tabButton.MouseButton1Click:Connect(selectTab)
    
    -- Hover effects
    tabContainer.MouseEnter:Connect(function()
        if not contentPage.Visible then
            -- Animate gradient on hover
            TweenService:Create(gradient, TweenInfo.new(0.2), {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 55, 60)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 50))
                })
            }):Play()
            
            -- Animate stroke on hover
            TweenService:Create(stroke, TweenInfo.new(0.2), {
                Transparency = 0.5
            }):Play()
            
            -- Subtle scale effect
            TweenService:Create(tabContainer, TweenInfo.new(0.2), {
                Size = UDim2.new(1, 0, 0, 38)
            }):Play()
            
            if tabIcon then
                -- Subtle icon movement
                TweenService:Create(tabIcon, TweenInfo.new(0.2), {
                    Position = UDim2.new(0, 14, 0.5, -10)
                }):Play()
            end
        end
    end)
    
    tabContainer.MouseLeave:Connect(function()
        if not contentPage.Visible then
            -- Reset gradient on leave
            TweenService:Create(gradient, TweenInfo.new(0.2), {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 50)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 40))
                })
            }):Play()
            
            -- Reset stroke on leave
            TweenService:Create(stroke, TweenInfo.new(0.2), {
                Transparency = 0.7
            }):Play()
            
            -- Reset scale
            TweenService:Create(tabContainer, TweenInfo.new(0.2), {
                Size = UDim2.new(1, 0, 0, 36)
            }):Play()
            
            if tabIcon then
                -- Reset icon position
                TweenService:Create(tabIcon, TweenInfo.new(0.2), {
                    Position = UDim2.new(0, 12, 0.5, -10)
                }):Play()
            end
        end
    end)
    
    local tabFunctions = {}
    
    function tabFunctions:Select()
        selectTab()
    end
    
    return tabFunctions
end

-- Make UI draggable
local dragging
local dragInput
local dragStart
local startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    Shadow.Position = MainFrame.Position
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
end)

-- Close and minimize functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    Shadow.Visible = MainFrame.Visible
end)

-- Create the three tabs with icons
local homeTab = CherryHub:CreateTab("Home", "rbxassetid://6026568198") -- Home icon
local example1Tab = CherryHub:CreateTab("Example 1", "rbxassetid://6031763426") -- Settings icon
local example2Tab = CherryHub:CreateTab("Example 2", "rbxassetid://6031225819") -- Star icon

-- Create interactive dashboard for Home tab
local homePage = ContentContainer:FindFirstChild("HomePage")
if homePage then
    -- Welcome section with animated gradient
    local welcomeFrame = Instance.new("Frame")
    welcomeFrame.Name = "WelcomeFrame"
    welcomeFrame.Parent = homePage
    welcomeFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    welcomeFrame.BorderSizePixel = 0
    welcomeFrame.Size = UDim2.new(1, 0, 0, 100)
    welcomeFrame.LayoutOrder = 1
    
    local welcomeCorner = Instance.new("UICorner")
    welcomeCorner.CornerRadius = UDim.new(0, 8)
    welcomeCorner.Parent = welcomeFrame
    
    local welcomeGradient = Instance.new("UIGradient")
    welcomeGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 45)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 35))
    })
    welcomeGradient.Rotation = 45
    welcomeGradient.Parent = welcomeFrame
    
    -- Animate the welcome gradient
    spawn(function()
        local rotation = 45
        while welcomeGradient.Parent do
            rotation = (rotation + 0.2) % 360
            welcomeGradient.Rotation = rotation
            wait(0.03)
        end
    end)
    
    -- Enhanced welcome title with premium font and text effect
    local welcomeTitle = Instance.new("TextLabel")
    welcomeTitle.Name = "WelcomeTitle"
    welcomeTitle.Parent = welcomeFrame
    welcomeTitle.BackgroundTransparency = 1
    welcomeTitle.Position = UDim2.new(0, 20, 0, 15)
    welcomeTitle.Size = UDim2.new(1, -40, 0, 30)
    welcomeTitle.Font = Enum.Font.SourceSansBold -- Premium font
    welcomeTitle.Text = "Welcome to Cherry Hub Premium"
    welcomeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    welcomeTitle.TextSize = 20 -- Slightly larger
    welcomeTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Add text stroke for a premium look
    local titleStroke = Instance.new("UIStroke")
    titleStroke.Color = Color3.fromRGB(255, 100, 120)
    titleStroke.Thickness = 1
    titleStroke.Transparency = 0.7
    titleStroke.Parent = welcomeTitle
    
    -- Add text shadow effect
    local titleShadow = Instance.new("TextLabel")
    titleShadow.Name = "TitleShadow"
    titleShadow.Parent = welcomeTitle
    titleShadow.BackgroundTransparency = 1
    titleShadow.Position = UDim2.new(0, 1, 0, 1)
    titleShadow.Size = UDim2.new(1, 0, 1, 0)
    titleShadow.Font = Enum.Font.SourceSansBold
    titleShadow.Text = "Welcome to Cherry Hub Premium"
    titleShadow.TextColor3 = Color3.fromRGB(255, 80, 100)
    titleShadow.TextSize = 20
    titleShadow.TextTransparency = 0.8
    titleShadow.TextXAlignment = Enum.TextXAlignment.Left
    titleShadow.ZIndex = welcomeTitle.ZIndex - 1
    
    -- Text reveal animation
    spawn(function()
        local originalText = welcomeTitle.Text
        welcomeTitle.Text = ""
        titleShadow.Text = ""
        
        for i = 1, #originalText do
            welcomeTitle.Text = string.sub(originalText, 1, i)
            titleShadow.Text = string.sub(originalText, 1, i)
            wait(0.03)
        end
        
        -- Subtle pulse animation after text reveal
        while welcomeTitle.Parent do
            for i = 0, 10 do
                titleStroke.Transparency = 0.7 + (math.sin(i/10 * math.pi) * 0.3)
                wait(0.1)
            end
        end
    end)
    
    local welcomeMessage = Instance.new("TextLabel")
    welcomeMessage.Name = "WelcomeMessage"
    welcomeMessage.Parent = welcomeFrame
    welcomeMessage.BackgroundTransparency = 1
    welcomeMessage.Position = UDim2.new(0, 20, 0, 50)
    welcomeMessage.Size = UDim2.new(1, -40, 0, 40)
    welcomeMessage.Font = Enum.Font.SourceSans -- Matching font
    welcomeMessage.Text = "Thank you for purchasing Cherry Hub Premium. Enjoy exclusive features and premium support."
    welcomeMessage.TextColor3 = Color3.fromRGB(200, 200, 200)
    welcomeMessage.TextSize = 14
    welcomeMessage.TextWrapped = true
    welcomeMessage.TextXAlignment = Enum.TextXAlignment.Left
    welcomeMessage.TextTransparency = 0.1 -- Slightly transparent for elegant look
    
    -- Add subtle glow effect to the title
    local titleGlow = Instance.new("ImageLabel")
    titleGlow.Name = "TitleGlow"
    titleGlow.Parent = welcomeTitle
    titleGlow.BackgroundTransparency = 1
    titleGlow.Position = UDim2.new(0, -10, 0, -5)
    titleGlow.Size = UDim2.new(1, 20, 1, 10)
    titleGlow.Image = "rbxassetid://4996891970" -- Radial gradient
    titleGlow.ImageColor3 = Color3.fromRGB(255, 80, 100)
    titleGlow.ImageTransparency = 0.85
    titleGlow.ZIndex = welcomeTitle.ZIndex - 2
    
    -- Animate the glow
    spawn(function()
        while titleGlow.Parent do
            for i = 0, 20 do
                titleGlow.ImageTransparency = 0.85 + (math.sin(i/20 * math.pi) * 0.1)
                wait(0.1)
            end
        end
    end)
    
    -- Stats section with animated counters
    local statsFrame = Instance.new("Frame")
    statsFrame.Name = "StatsFrame"
    statsFrame.Parent = homePage
    statsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    statsFrame.BorderSizePixel = 0
    statsFrame.Size = UDim2.new(1, 0, 0, 80)
    statsFrame.LayoutOrder = 2
    statsFrame.Position = UDim2.new(0, 0, 0, 110)
    
    local statsCorner = Instance.new("UICorner")
    statsCorner.CornerRadius = UDim.new(0, 8)
    statsCorner.Parent = statsFrame
    
    -- Create a horizontal layout for the stat cards
    local statsLayout = Instance.new("UIListLayout")
    statsLayout.Parent = statsFrame
    statsLayout.FillDirection = Enum.FillDirection.Horizontal
    statsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    statsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    statsLayout.Padding = UDim.new(0, 15)
    
    -- Function to create stat cards
    local function createStatCard(title, value, icon)
        local statCard = Instance.new("Frame")
        statCard.Name = title.."Card"
        statCard.Parent = statsFrame
        statCard.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        statCard.BorderSizePixel = 0
        statCard.Size = UDim2.new(0, 120, 0, 60)
        
        local cardCorner = Instance.new("UICorner")
        cardCorner.CornerRadius = UDim.new(0, 6)
        cardCorner.Parent = statCard
        
        local cardStroke = Instance.new("UIStroke")
        cardStroke.Color = Color3.fromRGB(255, 80, 100)
        cardStroke.Thickness = 1
        cardStroke.Transparency = 0.8
        cardStroke.Parent = statCard
        
        local iconImage = Instance.new("ImageLabel")
        iconImage.Name = "Icon"
        iconImage.Parent = statCard
        iconImage.BackgroundTransparency = 1
        iconImage.Position = UDim2.new(0, 10, 0, 10)
        iconImage.Size = UDim2.new(0, 20, 0, 20)
        iconImage.Image = icon
        iconImage.ImageColor3 = Color3.fromRGB(255, 80, 100)
        
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Name = "Title"
        titleLabel.Parent = statCard
        titleLabel.BackgroundTransparency = 1
        titleLabel.Position = UDim2.new(0, 40, 0, 10)
        titleLabel.Size = UDim2.new(1, -50, 0, 20)
        titleLabel.Font = Enum.Font.GothamSemibold
        titleLabel.Text = title
        titleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        titleLabel.TextSize = 12
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local valueLabel = Instance.new("TextLabel")
        valueLabel.Name = "Value"
        valueLabel.Parent = statCard
        valueLabel.BackgroundTransparency = 1
        valueLabel.Position = UDim2.new(0, 10, 0, 35)
        valueLabel.Size = UDim2.new(1, -20, 0, 20)
        valueLabel.Font = Enum.Font.GothamBold
        valueLabel.Text = "0"
        valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        valueLabel.TextSize = 16
        valueLabel.TextXAlignment = Enum.TextXAlignment.Center
        
        -- Animate counter
        spawn(function()
            local target = tonumber(value)
            local current = 0
            local increment = math.ceil(target / 50)
            
            while current < target do
                current = math.min(current + increment, target)
                valueLabel.Text = tostring(current)
                wait(0.02)
            end
        end)
        
        return statCard
    end
    
    -- Create stat cards
    createStatCard("Scripts", "42", "rbxassetid://6026568198")
    createStatCard("Games", "128", "rbxassetid://6031225819")
    createStatCard("Updates", "7", "rbxassetid://6031763426")
    
    -- Quick actions section
    local actionsFrame = Instance.new("Frame")
    actionsFrame.Name = "ActionsFrame"
    actionsFrame.Parent = homePage
    actionsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    actionsFrame.BorderSizePixel = 0
    actionsFrame.Size = UDim2.new(1, 0, 0, 150) -- Adjusted height
    actionsFrame.LayoutOrder = 3
    actionsFrame.Position = UDim2.new(0, 0, 0, 200)
    
    local actionsCorner = Instance.new("UICorner")
    actionsCorner.CornerRadius = UDim.new(0, 8)
    actionsCorner.Parent = actionsFrame
    
    local actionsTitle = Instance.new("TextLabel")
    actionsTitle.Name = "ActionsTitle"
    actionsTitle.Parent = actionsFrame
    actionsTitle.BackgroundTransparency = 1
    actionsTitle.Position = UDim2.new(0, 15, 0, 10)
    actionsTitle.Size = UDim2.new(1, -30, 0, 20)
    actionsTitle.Font = Enum.Font.GothamBold
    actionsTitle.Text = "Quick Actions"
    actionsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    actionsTitle.TextSize = 14
    actionsTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Remove any existing layouts
    if actionsFrame:FindFirstChild("UIGridLayout") then
        actionsFrame:FindFirstChild("UIGridLayout"):Destroy()
    end
    
    if actionsFrame:FindFirstChild("UIPadding") then
        actionsFrame:FindFirstChild("UIPadding"):Destroy()
    end
    
    -- Improved function to create action buttons with cool effects
    local function createActionButton(name, icon, posX, posY)
        local actionButton = Instance.new("TextButton")
        actionButton.Name = name.."Button"
        actionButton.Parent = actionsFrame
        actionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        actionButton.BorderSizePixel = 0
        actionButton.Text = ""
        actionButton.Position = UDim2.new(posX, 15, posY, 0)
        actionButton.Size = UDim2.new(0.5, -25, 0, 40)
        actionButton.AutoButtonColor = false
        actionButton.ClipsDescendants = true -- Enable clipping for ripple effect
        
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 6)
        buttonCorner.Parent = actionButton
        
        -- Add subtle inner glow effect
        local innerGlow = Instance.new("UIStroke")
        innerGlow.Name = "InnerGlow"
        innerGlow.Color = Color3.fromRGB(255, 100, 120)
        innerGlow.Thickness = 1.5
        innerGlow.Transparency = 0.9
        innerGlow.Parent = actionButton
        
        local buttonIcon = Instance.new("ImageLabel")
        buttonIcon.Name = "Icon"
        buttonIcon.Parent = actionButton
        buttonIcon.BackgroundTransparency = 1
        buttonIcon.Position = UDim2.new(0, 15, 0.5, -10)
        buttonIcon.Size = UDim2.new(0, 20, 0, 20)
        buttonIcon.Image = icon
        buttonIcon.ImageColor3 = Color3.fromRGB(255, 80, 100)
        
        -- Add icon glow
        local iconGlow = Instance.new("ImageLabel")
        iconGlow.Name = "IconGlow"
        iconGlow.Parent = buttonIcon
        iconGlow.BackgroundTransparency = 1
        iconGlow.Position = UDim2.new(0.5, -15, 0.5, -15)
        iconGlow.Size = UDim2.new(0, 30, 0, 30)
        iconGlow.Image = "rbxassetid://4996891970" -- Radial gradient
        iconGlow.ImageColor3 = Color3.fromRGB(255, 80, 100)
        iconGlow.ImageTransparency = 0.85
        iconGlow.ZIndex = buttonIcon.ZIndex - 1
        
        local buttonText = Instance.new("TextLabel")
        buttonText.Name = "Text"
        buttonText.Parent = actionButton
        buttonText.BackgroundTransparency = 1
        buttonText.Position = UDim2.new(0, 45, 0, 0)
        buttonText.Size = UDim2.new(1, -55, 1, 0)
        buttonText.Font = Enum.Font.GothamSemibold
        buttonText.Text = name
        buttonText.TextColor3 = Color3.fromRGB(230, 230, 230)
        buttonText.TextSize = 14
        buttonText.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Add subtle shine effect overlay
        local shine = Instance.new("Frame")
        shine.Name = "Shine"
        shine.Parent = actionButton
        shine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        shine.BorderSizePixel = 0
        shine.Size = UDim2.new(0, 10, 1, 0)
        shine.Position = UDim2.new(-0.5, 0, 0, 0)
        shine.BackgroundTransparency = 0.9
        shine.ZIndex = actionButton.ZIndex + 1
        shine.Rotation = 20
        
        -- Create ripple effect function
        local function createRipple(x, y)
            local ripple = Instance.new("Frame")
            ripple.Name = "Ripple"
            ripple.Parent = actionButton
            ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ripple.BackgroundTransparency = 0.85
            ripple.BorderSizePixel = 0
            ripple.Position = UDim2.new(0, x - 5, 0, y - 5)
            ripple.Size = UDim2.new(0, 10, 0, 10)
            ripple.ZIndex = actionButton.ZIndex + 1
            
            local rippleCorner = Instance.new("UICorner")
            rippleCorner.CornerRadius = UDim.new(1, 0)
            rippleCorner.Parent = ripple
            
            -- Animate the ripple
            TweenService:Create(ripple, TweenInfo.new(0.5), {
                Size = UDim2.new(0, 150, 0, 150),
                Position = UDim2.new(0, x - 75, 0, y - 75),
                BackgroundTransparency = 1
            }):Play()
            
            -- Remove the ripple after animation
            game:GetService("Debris"):AddItem(ripple, 0.5)
        end
        
        -- Add hover effect with multiple animations
        actionButton.MouseEnter:Connect(function()
            -- Button background animation
            TweenService:Create(actionButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            }):Play()
            
            -- Inner glow animation
            TweenService:Create(innerGlow, TweenInfo.new(0.3), {
                Transparency = 0.7
            }):Play()
            
            -- Icon animation
            TweenService:Create(buttonIcon, TweenInfo.new(0.3), {
                Position = UDim2.new(0, 17, 0.5, -10), -- Subtle movement
                ImageColor3 = Color3.fromRGB(255, 100, 120) -- Brighter color
            }):Play()
            
            -- Icon glow animation
            TweenService:Create(iconGlow, TweenInfo.new(0.3), {
                ImageTransparency = 0.7
            }):Play()
            
            -- Shine effect animation
            TweenService:Create(shine, TweenInfo.new(0.5), {
                Position = UDim2.new(1.5, 0, 0, 0)
            }):Play()
        end)
        
        actionButton.MouseLeave:Connect(function()
            -- Button background animation
            TweenService:Create(actionButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            }):Play()
            
            -- Inner glow animation
            TweenService:Create(innerGlow, TweenInfo.new(0.3), {
                Transparency = 0.9
            }):Play()
            
            -- Icon animation
            TweenService:Create(buttonIcon, TweenInfo.new(0.3), {
                Position = UDim2.new(0, 15, 0.5, -10), -- Reset position
                ImageColor3 = Color3.fromRGB(255, 80, 100) -- Reset color
            }):Play()
            
            -- Icon glow animation
            TweenService:Create(iconGlow, TweenInfo.new(0.3), {
                ImageTransparency = 0.85
            }):Play()
            
            -- Reset shine for next hover
            shine.Position = UDim2.new(-0.5, 0, 0, 0)
        end)
        
        -- Add click effects
        actionButton.MouseButton1Down:Connect(function(x, y)
            -- Create ripple effect at mouse position
            local relativeX = x - actionButton.AbsolutePosition.X
            local relativeY = y - actionButton.AbsolutePosition.Y
            createRipple(relativeX, relativeY)
            
            -- Button press animation
            TweenService:Create(actionButton, TweenInfo.new(0.1), {
                BackgroundColor3 = Color3.fromRGB(60, 60, 65),
                Size = UDim2.new(0.5, -25, 0, 38) -- Slightly smaller
            }):Play()
            
            -- Icon press animation
            TweenService:Create(buttonIcon, TweenInfo.new(0.1), {
                Size = UDim2.new(0, 18, 0, 18), -- Slightly smaller
                Position = UDim2.new(0, 16, 0.5, -9) -- Adjusted position
            }):Play()
        end)
        
        actionButton.MouseButton1Up:Connect(function()
            -- Button release animation
            TweenService:Create(actionButton, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(50, 50, 55),
                Size = UDim2.new(0.5, -25, 0, 40) -- Reset size
            }):Play()
            
            -- Icon release animation
            TweenService:Create(buttonIcon, TweenInfo.new(0.2), {
                Size = UDim2.new(0, 20, 0, 20), -- Reset size
                Position = UDim2.new(0, 15, 0.5, -10) -- Reset position
            }):Play()
        end)
        
        -- Add subtle pulse animation to the icon glow
        spawn(function()
            while actionButton.Parent do
                for i = 0, 10 do
                    if not iconGlow.Parent then break end
                    local transparency = iconGlow.ImageTransparency
                    local targetTransparency = transparency - 0.05 + (math.sin(i/10 * math.pi) * 0.05)
                    TweenService:Create(iconGlow, TweenInfo.new(0.5), {
                        ImageTransparency = targetTransparency
                    }):Play()
                    wait(0.5)
                end
            end
        end)
        
        return actionButton
    end
    
    -- Create action buttons with exact positioning to match the screenshot
    -- Top row - adjusted Y position to be closer to the title
    createActionButton("Settings", "rbxassetid://6031763426", 0, 0.25)
    createActionButton("Launch Game", "rbxassetid://6026568198", 0.5, 0.25)
    
    -- Bottom row - adjusted Y position for better spacing
    createActionButton("Support", "rbxassetid://6034509993", 0, 0.55)
    createActionButton("Discord", "rbxassetid://6035047391", 0.5, 0.55)
end

-- Create Example 1 tab content with toggle button and slider
local example1Page = ContentContainer:FindFirstChild("Example 1Page")
if example1Page then
    -- Section container
    local settingsSection = Instance.new("Frame")
    settingsSection.Name = "SettingsSection"
    settingsSection.Parent = example1Page
    settingsSection.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    settingsSection.BorderSizePixel = 0
    settingsSection.Size = UDim2.new(1, 0, 0, 150) -- Reduced height after removing color picker
    settingsSection.LayoutOrder = 1
    
    local sectionCorner = Instance.new("UICorner")
    sectionCorner.CornerRadius = UDim.new(0, 8)
    sectionCorner.Parent = settingsSection
    
    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Name = "SectionTitle"
    sectionTitle.Parent = settingsSection
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.Position = UDim2.new(0, 15, 0, 10)
    sectionTitle.Size = UDim2.new(1, -30, 0, 20)
    sectionTitle.Font = Enum.Font.GothamBold
    sectionTitle.Text = "Appearance Settings"
    sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    sectionTitle.TextSize = 14
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Toggle button
    local toggleContainer = Instance.new("Frame")
    toggleContainer.Name = "ToggleContainer"
    toggleContainer.Parent = settingsSection
    toggleContainer.BackgroundTransparency = 1
    toggleContainer.Position = UDim2.new(0, 15, 0, 40)
    toggleContainer.Size = UDim2.new(1, -30, 0, 40)
    
    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Name = "ToggleLabel"
    toggleLabel.Parent = toggleContainer
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Position = UDim2.new(0, 0, 0, 0)
    toggleLabel.Size = UDim2.new(0, 200, 1, 0)
    toggleLabel.Font = Enum.Font.GothamSemibold
    toggleLabel.Text = "Enable Premium Effects"
    toggleLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
    toggleLabel.TextSize = 14
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggleButton = Instance.new("Frame")
    toggleButton.Name = "ToggleButton"
    toggleButton.Parent = toggleContainer
    toggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    toggleButton.BorderSizePixel = 0
    toggleButton.Position = UDim2.new(1, -50, 0.5, -12)
    toggleButton.Size = UDim2.new(0, 50, 0, 24)
    toggleButton.ClipsDescendants = true
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleButton
    
    local toggleCircle = Instance.new("Frame")
    toggleCircle.Name = "Circle"
    toggleCircle.Parent = toggleButton
    toggleCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    toggleCircle.Position = UDim2.new(0, 4, 0.5, -8)
    toggleCircle.Size = UDim2.new(0, 16, 0, 16)
    
    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = toggleCircle
    
    local toggleGlow = Instance.new("ImageLabel")
    toggleGlow.Name = "Glow"
    toggleGlow.Parent = toggleCircle
    toggleGlow.BackgroundTransparency = 1
    toggleGlow.Position = UDim2.new(0.5, -15, 0.5, -15)
    toggleGlow.Size = UDim2.new(0, 30, 0, 30)
    toggleGlow.Image = "rbxassetid://4996891970"
    toggleGlow.ImageColor3 = Color3.fromRGB(255, 80, 100)
    toggleGlow.ImageTransparency = 1
    
    local toggleStatus = false
    
    local function updateToggle()
        if toggleStatus then
            TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(255, 80, 100)
            }):Play()
            TweenService:Create(toggleCircle, TweenInfo.new(0.3), {
                Position = UDim2.new(0, 30, 0.5, -8),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
            TweenService:Create(toggleGlow, TweenInfo.new(0.3), {
                ImageTransparency = 0.7
            }):Play()
        else
            TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            }):Play()
            TweenService:Create(toggleCircle, TweenInfo.new(0.3), {
                Position = UDim2.new(0, 4, 0.5, -8),
                BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            }):Play()
            TweenService:Create(toggleGlow, TweenInfo.new(0.3), {
                ImageTransparency = 1
            }):Play()
        end
    end
    
    toggleButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            toggleStatus = not toggleStatus
            updateToggle()
            
            -- Create ripple effect
            local ripple = Instance.new("Frame")
            ripple.Name = "Ripple"
            ripple.Parent = toggleButton
            ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ripple.BackgroundTransparency = 0.8
            ripple.BorderSizePixel = 0
            ripple.Position = UDim2.new(0.5, -25, 0.5, -25)
            ripple.Size = UDim2.new(0, 0, 0, 0)
            
            local rippleCorner = Instance.new("UICorner")
            rippleCorner.CornerRadius = UDim.new(1, 0)
            rippleCorner.Parent = ripple
            
            TweenService:Create(ripple, TweenInfo.new(0.5), {
                Size = UDim2.new(0, 50, 0, 50),
                BackgroundTransparency = 1
            }):Play()
            
            game:GetService("Debris"):AddItem(ripple, 0.5)
        end
    end)
    

    
    -- Add slider component (positioned higher since color picker is removed)
    local sliderContainer = Instance.new("Frame")
    sliderContainer.Name = "SliderContainer"
    sliderContainer.Parent = settingsSection
    sliderContainer.BackgroundTransparency = 1
    sliderContainer.Position = UDim2.new(0, 15, 0, 90) -- Moved up from 180
    sliderContainer.Size = UDim2.new(1, -30, 0, 40)
    
    local sliderLabel = Instance.new("TextLabel")
    sliderLabel.Name = "SliderLabel"
    sliderLabel.Parent = sliderContainer
    sliderLabel.BackgroundTransparency = 1
    sliderLabel.Position = UDim2.new(0, 0, 0, 0)
    sliderLabel.Size = UDim2.new(0, 200, 0, 20)
    sliderLabel.Font = Enum.Font.GothamSemibold
    sliderLabel.Text = "Animation Speed"
    sliderLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
    sliderLabel.TextSize = 14
    sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local sliderValueLabel = Instance.new("TextLabel")
    sliderValueLabel.Name = "ValueLabel"
    sliderValueLabel.Parent = sliderContainer
    sliderValueLabel.BackgroundTransparency = 1
    sliderValueLabel.Position = UDim2.new(1, -40, 0, 0)
    sliderValueLabel.Size = UDim2.new(0, 40, 0, 20)
    sliderValueLabel.Font = Enum.Font.GothamSemibold
    sliderValueLabel.Text = "50%"
    sliderValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    sliderValueLabel.TextSize = 14
    sliderValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    
    local sliderTrack = Instance.new("Frame")
    sliderTrack.Name = "Track"
    sliderTrack.Parent = sliderContainer
    sliderTrack.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    sliderTrack.BorderSizePixel = 0
    sliderTrack.Position = UDim2.new(0, 0, 0, 25)
    sliderTrack.Size = UDim2.new(1, 0, 0, 6)
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = sliderTrack
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Name = "Fill"
    sliderFill.Parent = sliderTrack
    sliderFill.BackgroundColor3 = Color3.fromRGB(255, 80, 100)
    sliderFill.BorderSizePixel = 0
    sliderFill.Size = UDim2.new(0.5, 0, 1, 0)
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = sliderFill
    
    local sliderKnob = Instance.new("Frame")
    sliderKnob.Name = "Knob"
    sliderKnob.Parent = sliderTrack
    sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderKnob.BorderSizePixel = 0
    sliderKnob.Position = UDim2.new(0.5, -8, 0.5, -8)
    sliderKnob.Size = UDim2.new(0, 16, 0, 16)
    sliderKnob.ZIndex = 5
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = sliderKnob
    
    -- Add glow effect to knob
    local knobGlow = Instance.new("ImageLabel")
    knobGlow.Name = "Glow"
    knobGlow.Parent = sliderKnob
    knobGlow.BackgroundTransparency = 1
    knobGlow.Position = UDim2.new(0.5, -15, 0.5, -15)
    knobGlow.Size = UDim2.new(0, 30, 0, 30)
    knobGlow.Image = "rbxassetid://4996891970"
    knobGlow.ImageColor3 = Color3.fromRGB(255, 80, 100)
    knobGlow.ImageTransparency = 0.7
    knobGlow.ZIndex = 4
    
    -- Slider functionality
    local isDragging = false
    local sliderValue = 0.5
    
    local function updateSlider(value)
        value = math.clamp(value, 0, 1)
        sliderValue = value
        sliderFill.Size = UDim2.new(value, 0, 1, 0)
        sliderKnob.Position = UDim2.new(value, -8, 0.5, -8)
        sliderValueLabel.Text = math.floor(value * 100) .. "%"
    end
    
    sliderTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
            local relativeX = input.Position.X - sliderTrack.AbsolutePosition.X
            local value = math.clamp(relativeX / sliderTrack.AbsoluteSize.X, 0, 1)
            updateSlider(value)
            
            -- Create ripple effect
            local ripple = Instance.new("Frame")
            ripple.Name = "Ripple"
            ripple.Parent = sliderTrack
            ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ripple.BackgroundTransparency = 0.8
            ripple.BorderSizePixel = 0
            ripple.Position = UDim2.new(value, -10, 0.5, -10)
            ripple.Size = UDim2.new(0, 0, 0, 0)
            ripple.ZIndex = 3
            
            local rippleCorner = Instance.new("UICorner")
            rippleCorner.CornerRadius = UDim.new(1, 0)
            rippleCorner.Parent = ripple
            
            TweenService:Create(ripple, TweenInfo.new(0.5), {
                Size = UDim2.new(0, 40, 0, 40),
                Position = UDim2.new(value, -20, 0.5, -20),
                BackgroundTransparency = 1
            }):Play()
            
            game:GetService("Debris"):AddItem(ripple, 0.5)
            
            -- Animate knob on click
            TweenService:Create(sliderKnob, TweenInfo.new(0.2), {
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(value, -10, 0.5, -10)
            }):Play()
            
            TweenService:Create(knobGlow, TweenInfo.new(0.2), {
                ImageTransparency = 0.5
            }):Play()
        end
    end)
    
    sliderTrack.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = false
            
            -- Animate knob on release
            TweenService:Create(sliderKnob, TweenInfo.new(0.2), {
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(sliderValue, -8, 0.5, -8)
            }):Play()
            
            TweenService:Create(knobGlow, TweenInfo.new(0.2), {
                ImageTransparency = 0.7
            }):Play()
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local relativeX = input.Position.X - sliderTrack.AbsolutePosition.X
            local value = math.clamp(relativeX / sliderTrack.AbsoluteSize.X, 0, 1)
            updateSlider(value)
        end
    end)
    
    -- Hover effects for slider track
    sliderTrack.MouseEnter:Connect(function()
        if not isDragging then
            TweenService:Create(sliderTrack, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            }):Play()
        end
    end)
    
    sliderTrack.MouseLeave:Connect(function()
        if not isDragging then
            TweenService:Create(sliderTrack, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            }):Play()
        end
    end)
    
    -- Add subtle pulse animation to the knob glow
    spawn(function()
        while sliderKnob.Parent do
            for i = 0, 10 do
                if not knobGlow.Parent then break end
                local transparency = knobGlow.ImageTransparency
                local targetTransparency = transparency - 0.05 + (math.sin(i/10 * math.pi) * 0.05)
                TweenService:Create(knobGlow, TweenInfo.new(0.5), {
                    ImageTransparency = targetTransparency
                }):Play()
                wait(0.5)
            end
        end
    end)
    
    -- Section size is already set to accommodate the toggle and slider
    -- settingsSection.Size = UDim2.new(1, 0, 0, 150)
    
    -- Add dropdown component
    local dropdownContainer = Instance.new("Frame")
    dropdownContainer.Name = "DropdownContainer"
    dropdownContainer.Parent = example1Page
    dropdownContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    dropdownContainer.BorderSizePixel = 0
    dropdownContainer.Position = UDim2.new(0, 0, 0, 160)
    dropdownContainer.Size = UDim2.new(1, 0, 0, 120)
    dropdownContainer.LayoutOrder = 2
    dropdownContainer.ClipsDescendants = true
    
    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 8)
    dropdownCorner.Parent = dropdownContainer
    
    local dropdownTitle = Instance.new("TextLabel")
    dropdownTitle.Name = "DropdownTitle"
    dropdownTitle.Parent = dropdownContainer
    dropdownTitle.BackgroundTransparency = 1
    dropdownTitle.Position = UDim2.new(0, 15, 0, 10)
    dropdownTitle.Size = UDim2.new(1, -30, 0, 20)
    dropdownTitle.Font = Enum.Font.GothamBold
    dropdownTitle.Text = "Theme Selection"
    dropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdownTitle.TextSize = 14
    dropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Dropdown selector
    local dropdownSelector = Instance.new("Frame")
    dropdownSelector.Name = "DropdownSelector"
    dropdownSelector.Parent = dropdownContainer
    dropdownSelector.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    dropdownSelector.BorderSizePixel = 0
    dropdownSelector.Position = UDim2.new(0, 15, 0, 40)
    dropdownSelector.Size = UDim2.new(1, -30, 0, 36)
    
    local selectorCorner = Instance.new("UICorner")
    selectorCorner.CornerRadius = UDim.new(0, 6)
    selectorCorner.Parent = dropdownSelector
    
    local selectorButton = Instance.new("TextButton")
    selectorButton.Name = "SelectorButton"
    selectorButton.Parent = dropdownSelector
    selectorButton.BackgroundTransparency = 1
    selectorButton.Size = UDim2.new(1, 0, 1, 0)
    selectorButton.Font = Enum.Font.GothamSemibold
    selectorButton.Text = ""
    selectorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    selectorButton.TextSize = 14
    
    local selectedText = Instance.new("TextLabel")
    selectedText.Name = "SelectedText"
    selectedText.Parent = dropdownSelector
    selectedText.BackgroundTransparency = 1
    selectedText.Position = UDim2.new(0, 15, 0, 0)
    selectedText.Size = UDim2.new(1, -50, 1, 0)
    selectedText.Font = Enum.Font.GothamSemibold
    selectedText.Text = "Cherry Dark (Default)"
    selectedText.TextColor3 = Color3.fromRGB(230, 230, 230)
    selectedText.TextSize = 14
    selectedText.TextXAlignment = Enum.TextXAlignment.Left
    
    local arrowIcon = Instance.new("ImageLabel")
    arrowIcon.Name = "ArrowIcon"
    arrowIcon.Parent = dropdownSelector
    arrowIcon.BackgroundTransparency = 1
    arrowIcon.Position = UDim2.new(1, -30, 0.5, -8)
    arrowIcon.Size = UDim2.new(0, 16, 0, 16)
    arrowIcon.Image = "rbxassetid://6031091004" -- Down arrow icon
    arrowIcon.ImageColor3 = Color3.fromRGB(255, 80, 100)
    
    -- Dropdown options container
    local optionsContainer = Instance.new("Frame")
    optionsContainer.Name = "OptionsContainer"
    optionsContainer.Parent = dropdownContainer
    optionsContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    optionsContainer.BorderSizePixel = 0
    optionsContainer.Position = UDim2.new(0, 15, 0, 80)
    optionsContainer.Size = UDim2.new(1, -30, 0, 0) -- Start with 0 height
    optionsContainer.Visible = false
    optionsContainer.ZIndex = 5
    
    local optionsCorner = Instance.new("UICorner")
    optionsCorner.CornerRadius = UDim.new(0, 6)
    optionsCorner.Parent = optionsContainer
    
    local optionsList = Instance.new("UIListLayout")
    optionsList.Parent = optionsContainer
    optionsList.SortOrder = Enum.SortOrder.LayoutOrder
    optionsList.Padding = UDim.new(0, 2)
    
    -- Create dropdown options
    local themes = {
        {name = "Cherry Dark (Default)", color = Color3.fromRGB(255, 80, 100)},
        {name = "Ocean Blue", color = Color3.fromRGB(80, 150, 255)},
        {name = "Emerald Green", color = Color3.fromRGB(80, 220, 100)},
        {name = "Royal Purple", color = Color3.fromRGB(150, 80, 255)}
    }
    
    local isDropdownOpen = false
    local selectedTheme = themes[1]
    
    -- Function to create option buttons
    local function createOption(theme, index)
        local option = Instance.new("TextButton")
        option.Name = "Option_" .. theme.name
        option.Parent = optionsContainer
        option.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
        option.BackgroundTransparency = 1
        option.BorderSizePixel = 0
        option.Size = UDim2.new(1, 0, 0, 30)
        option.Font = Enum.Font.GothamSemibold
        option.Text = ""
        option.ZIndex = 6
        option.LayoutOrder = index
        option.AutoButtonColor = false
        
        local optionText = Instance.new("TextLabel")
        optionText.Name = "OptionText"
        optionText.Parent = option
        optionText.BackgroundTransparency = 1
        optionText.Position = UDim2.new(0, 15, 0, 0)
        optionText.Size = UDim2.new(1, -30, 1, 0)
        optionText.Font = Enum.Font.GothamSemibold
        optionText.Text = theme.name
        optionText.TextColor3 = Color3.fromRGB(230, 230, 230)
        optionText.TextSize = 14
        optionText.TextXAlignment = Enum.TextXAlignment.Left
        optionText.ZIndex = 6
        
        local colorIndicator = Instance.new("Frame")
        colorIndicator.Name = "ColorIndicator"
        colorIndicator.Parent = option
        colorIndicator.BackgroundColor3 = theme.color
        colorIndicator.BorderSizePixel = 0
        colorIndicator.Position = UDim2.new(1, -25, 0.5, -6)
        colorIndicator.Size = UDim2.new(0, 12, 0, 12)
        colorIndicator.ZIndex = 6
        
        local indicatorCorner = Instance.new("UICorner")
        indicatorCorner.CornerRadius = UDim.new(1, 0)
        indicatorCorner.Parent = colorIndicator
        
        -- Hover effect
        option.MouseEnter:Connect(function()
            TweenService:Create(option, TweenInfo.new(0.2), {
                BackgroundTransparency = 0
            }):Play()
        end)
        
        option.MouseLeave:Connect(function()
            TweenService:Create(option, TweenInfo.new(0.2), {
                BackgroundTransparency = 1
            }):Play()
        end)
        
        -- Replace the option's click effect
        option.MouseButton1Down:Connect(function(x, y)
            -- Get relative position for the click
            local relativeX = x - option.AbsolutePosition.X
            local relativeY = y - option.AbsolutePosition.Y
            
            -- Create pulse effect
            local pulse = Instance.new("Frame")
            pulse.Name = "PulseEffect"
            pulse.Parent = option
            pulse.BackgroundColor3 = theme.color
            pulse.BackgroundTransparency = 0.7
            pulse.BorderSizePixel = 0
            pulse.Position = UDim2.new(0, relativeX - 5, 0, relativeY - 5)
            pulse.Size = UDim2.new(0, 10, 0, 10)
            pulse.ZIndex = 7
            
            local pulseCorner = Instance.new("UICorner")
            pulseCorner.CornerRadius = UDim.new(1, 0)
            pulseCorner.Parent = pulse
            
            -- Create glow effect
            local glow = Instance.new("ImageLabel")
            glow.Name = "Glow"
            glow.Parent = pulse
            glow.BackgroundTransparency = 1
            glow.Position = UDim2.new(0.5, -20, 0.5, -20)
            glow.Size = UDim2.new(0, 40, 0, 40)
            glow.Image = "rbxassetid://4996891970"
            glow.ImageColor3 = theme.color
            glow.ImageTransparency = 0.5
            glow.ZIndex = 6
            
            -- Animate the pulse
            TweenService:Create(pulse, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 80, 0, 80),
                Position = UDim2.new(0, relativeX - 40, 0, relativeY - 40),
                BackgroundTransparency = 1
            }):Play()
            
            -- Animate the glow
            TweenService:Create(glow, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 100, 0, 100),
                Position = UDim2.new(0.5, -50, 0.5, -50),
                ImageTransparency = 1
            }):Play()
            
            -- Clean up effects after animation
            game:GetService("Debris"):AddItem(pulse, 0.5)
            
            -- Highlight the option
            TweenService:Create(option, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(60, 60, 65),
                BackgroundTransparency = 0
            }):Play()
        end)
        
        option.MouseButton1Up:Connect(function()
            -- Reset the option background
            TweenService:Create(option, TweenInfo.new(0.3), {
                BackgroundTransparency = 1
            }):Play()
            
            -- Select the theme and close dropdown
            selectedTheme = theme
            selectedText.Text = theme.name
            toggleDropdown()
        end)
        
        return option
    end
    
    -- Create all theme options
    for i, theme in ipairs(themes) do
        local option = createOption(theme, i)
        
        -- Replace the option's click effect
        option.MouseButton1Down:Connect(function(x, y)
            -- Get relative position for the click
            local relativeX = x - option.AbsolutePosition.X
            local relativeY = y - option.AbsolutePosition.Y
            
            -- Create pulse effect
            local pulse = Instance.new("Frame")
            pulse.Name = "PulseEffect"
            pulse.Parent = option
            pulse.BackgroundColor3 = theme.color
            pulse.BackgroundTransparency = 0.7
            pulse.BorderSizePixel = 0
            pulse.Position = UDim2.new(0, relativeX - 5, 0, relativeY - 5)
            pulse.Size = UDim2.new(0, 10, 0, 10)
            pulse.ZIndex = 7
            
            local pulseCorner = Instance.new("UICorner")
            pulseCorner.CornerRadius = UDim.new(1, 0)
            pulseCorner.Parent = pulse
            
            -- Create glow effect
            local glow = Instance.new("ImageLabel")
            glow.Name = "Glow"
            glow.Parent = pulse
            glow.BackgroundTransparency = 1
            glow.Position = UDim2.new(0.5, -20, 0.5, -20)
            glow.Size = UDim2.new(0, 40, 0, 40)
            glow.Image = "rbxassetid://4996891970"
            glow.ImageColor3 = theme.color
            glow.ImageTransparency = 0.5
            glow.ZIndex = 6
            
            -- Animate the pulse
            TweenService:Create(pulse, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 80, 0, 80),
                Position = UDim2.new(0, relativeX - 40, 0, relativeY - 40),
                BackgroundTransparency = 1
            }):Play()
            
            -- Animate the glow
            TweenService:Create(glow, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 100, 0, 100),
                Position = UDim2.new(0.5, -50, 0.5, -50),
                ImageTransparency = 1
            }):Play()
            
            -- Clean up effects after animation
            game:GetService("Debris"):AddItem(pulse, 0.5)
            
            -- Highlight the option
            TweenService:Create(option, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(60, 60, 65),
                BackgroundTransparency = 0
            }):Play()
        end)
        
        option.MouseButton1Up:Connect(function()
            -- Reset the option background
            TweenService:Create(option, TweenInfo.new(0.3), {
                BackgroundTransparency = 1
            }):Play()
            
            -- Select the theme and close dropdown
            selectedTheme = theme
            selectedText.Text = theme.name
            toggleDropdown()
        end)
    end
    
    -- Function to toggle dropdown
    local function toggleDropdown()
        isDropdownOpen = not isDropdownOpen
        
        if isDropdownOpen then
            -- Show options
            optionsContainer.Visible = true
            
            -- Animate dropdown opening
            TweenService:Create(optionsContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, -30, 0, #themes * 32),
                Position = UDim2.new(0, 15, 0, 80)
            }):Play()
            
            -- Rotate arrow
            TweenService:Create(arrowIcon, TweenInfo.new(0.3), {
                Rotation = 180
            }):Play()
            
            -- Expand container to fit dropdown
            TweenService:Create(dropdownContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, 0, 0, 90 + (#themes * 32))
            }):Play()
        else
            -- Animate dropdown closing
            TweenService:Create(optionsContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, -30, 0, 0),
                Position = UDim2.new(0, 15, 0, 80)
            }):Play()
            
            -- Rotate arrow back
            TweenService:Create(arrowIcon, TweenInfo.new(0.3), {
                Rotation = 0
            }):Play()
            
            -- Shrink container back
            TweenService:Create(dropdownContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, 0, 0, 120)
            }):Play()
            
            -- Hide options after animation
            spawn(function()
                wait(0.3)
                if not isDropdownOpen then
                    optionsContainer.Visible = false
                end
            end)
        end
    end
    
    -- Connect dropdown toggle
    selectorButton.MouseButton1Click:Connect(toggleDropdown)
    
    -- Add hover effects to dropdown selector
    dropdownSelector.MouseEnter:Connect(function()
        TweenService:Create(dropdownSelector, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(50, 50, 55)
        }):Play()
    end)
    
    dropdownSelector.MouseLeave:Connect(function()
        TweenService:Create(dropdownSelector, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        }):Play()
    end)
    
    -- Replace the old click effect with a new radial wave effect
    selectorButton.MouseButton1Down:Connect(function(x, y)
        -- Get relative position for the click
        local relativeX = x - selectorButton.AbsolutePosition.X
        local relativeY = y - selectorButton.AbsolutePosition.Y
        
        -- Create wave container
        local waveContainer = Instance.new("Frame")
        waveContainer.Name = "WaveEffect"
        waveContainer.Parent = dropdownSelector
        waveContainer.BackgroundTransparency = 1
        waveContainer.Size = UDim2.new(1, 0, 1, 0)
        waveContainer.ClipsDescendants = true
        waveContainer.ZIndex = 10
        
        -- Create multiple concentric circles for wave effect
        for i = 1, 3 do
            local wave = Instance.new("Frame")
            wave.Name = "Wave_" .. i
            wave.Parent = waveContainer
            wave.BackgroundColor3 = Color3.fromRGB(255, 100, 120)
            wave.BackgroundTransparency = 0.7 + (i * 0.1)
            wave.BorderSizePixel = 0
            wave.Position = UDim2.new(0, relativeX - 5, 0, relativeY - 5)
            wave.Size = UDim2.new(0, 10, 0, 10)
            wave.ZIndex = 10
            
            local waveCorner = Instance.new("UICorner")
            waveCorner.CornerRadius = UDim.new(1, 0)
            waveCorner.Parent = wave
            
            -- Stagger the animations slightly
            local delay = (i - 1) * 0.1
            spawn(function()
                wait(delay)
                TweenService:Create(wave, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 100 + (i * 20), 0, 100 + (i * 20)),
                    Position = UDim2.new(0, relativeX - 50 - (i * 10), 0, relativeY - 50 - (i * 10)),
                    BackgroundTransparency = 1
                }):Play()
            end)
        end
        
        -- Add a flash effect
        local flash = Instance.new("Frame")
        flash.Name = "Flash"
        flash.Parent = dropdownSelector
        flash.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        flash.BackgroundTransparency = 0.9
        flash.BorderSizePixel = 0
        flash.Size = UDim2.new(1, 0, 1, 0)
        flash.ZIndex = 9
        
        local flashCorner = Instance.new("UICorner")
        flashCorner.CornerRadius = UDim.new(0, 6)
        flashCorner.Parent = flash
        
        -- Animate the flash
        TweenService:Create(flash, TweenInfo.new(0.3), {
            BackgroundTransparency = 1
        }):Play()
        
        -- Slight scale down effect
        TweenService:Create(dropdownSelector, TweenInfo.new(0.1), {
            Size = UDim2.new(1, -32, 0, 34),
            Position = UDim2.new(0, 16, 0, 41)
        }):Play()
        
        -- Clean up effects after animation
        game:GetService("Debris"):AddItem(waveContainer, 0.8)
        game:GetService("Debris"):AddItem(flash, 0.3)
    end)
    
    selectorButton.MouseButton1Up:Connect(function()
        -- Scale back to original size
        TweenService:Create(dropdownSelector, TweenInfo.new(0.2), {
            Size = UDim2.new(1, -30, 0, 36),
            Position = UDim2.new(0, 15, 0, 40)
        }):Play()
    end)
    selectorButton.MouseButton1Down:Connect(function(x, y)
        -- Get relative position for the click
        local relativeX = x - selectorButton.AbsolutePosition.X
        local relativeY = y - selectorButton.AbsolutePosition.Y
        
        -- Create wave container
        local waveContainer = Instance.new("Frame")
        waveContainer.Name = "WaveEffect"
        waveContainer.Parent = dropdownSelector
        waveContainer.BackgroundTransparency = 1
        waveContainer.Size = UDim2.new(1, 0, 1, 0)
        waveContainer.ClipsDescendants = true
        waveContainer.ZIndex = 10
        
        -- Create multiple concentric circles for wave effect
        for i = 1, 3 do
            local wave = Instance.new("Frame")
            wave.Name = "Wave_" .. i
            wave.Parent = waveContainer
            wave.BackgroundColor3 = Color3.fromRGB(255, 100, 120)
            wave.BackgroundTransparency = 0.7 + (i * 0.1)
            wave.BorderSizePixel = 0
            wave.Position = UDim2.new(0, relativeX - 5, 0, relativeY - 5)
            wave.Size = UDim2.new(0, 10, 0, 10)
            wave.ZIndex = 10
            
            local waveCorner = Instance.new("UICorner")
            waveCorner.CornerRadius = UDim.new(1, 0)
            waveCorner.Parent = wave
            
            -- Stagger the animations slightly
            local delay = (i - 1) * 0.1
            spawn(function()
                wait(delay)
                TweenService:Create(wave, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 100 + (i * 20), 0, 100 + (i * 20)),
                    Position = UDim2.new(0, relativeX - 50 - (i * 10), 0, relativeY - 50 - (i * 10)),
                    BackgroundTransparency = 1
                }):Play()
            end)
        end
        
        -- Add a flash effect
        local flash = Instance.new("Frame")
        flash.Name = "Flash"
        flash.Parent = dropdownSelector
        flash.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        flash.BackgroundTransparency = 0.9
        flash.BorderSizePixel = 0
        flash.Size = UDim2.new(1, 0, 1, 0)
        flash.ZIndex = 9
        
        local flashCorner = Instance.new("UICorner")
        flashCorner.CornerRadius = UDim.new(0, 6)
        flashCorner.Parent = flash
        
        -- Animate the flash
        TweenService:Create(flash, TweenInfo.new(0.3), {
            BackgroundTransparency = 1
        }):Play()
        
        -- Slight scale down effect
        TweenService:Create(dropdownSelector, TweenInfo.new(0.1), {
            Size = UDim2.new(1, -32, 0, 34),
            Position = UDim2.new(0, 16, 0, 41)
        }):Play()
        
        -- Clean up effects after animation
        game:GetService("Debris"):AddItem(waveContainer, 0.8)
        game:GetService("Debris"):AddItem(flash, 0.3)
    end)
    
    selectorButton.MouseButton1Up:Connect(function()
        -- Scale back to original size
        TweenService:Create(dropdownSelector, TweenInfo.new(0.2), {
            Size = UDim2.new(1, -30, 0, 36),
            Position = UDim2.new(0, 15, 0, 40)
        }):Play()
    end)
end

-- Select Home tab by default
homeTab:Select()

return CherryHub

