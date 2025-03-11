local tab1 = CherryHub: CreateTab("Example", "rbxassetid://6026568198")
local example1Page = ContentContainer:FindFirstChild("ExamplePage")
if example1Page then
    -- Section container
    local settingsSection = Instance.new("Frame")
    settingsSection.Name = "SettingsSection"
    settingsSection.Parent = example1Page
    settingsSection.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    settingsSection.BorderSizePixel = 0
    settingsSection.Size = UDim2.new(1, 0, 0, 150) 
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
    sectionTitle.Text = "TITLE"
    sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    sectionTitle.TextSize = 14
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
