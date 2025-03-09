-- Cherry Hub Premium UI Library - Tab Container Component
return function(UI)
    local TabContainer = {}
    local TweenService = game:GetService("TweenService")
    
    function TabContainer:Create()
        -- Tab container
        local TabContainer = Instance.new("Frame")
        TabContainer.Name = "TabContainer"
        TabContainer.Parent = UI.MainFrame
        TabContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        TabContainer.BorderSizePixel = 0
        TabContainer.Position = UDim2.new(0, 10, 0, 50)
        TabContainer.Size = UDim2.new(0, 150, 1, -60)
        
        local TabContainerCorner = Instance.new("UICorner")
        TabContainerCorner.CornerRadius = UDim.new(0, 8)
        TabContainerCorner.Parent = TabContainer
        
        -- Navigation label
        local NavLabel = Instance.new("TextLabel")
        NavLabel.Name = "NavLabel"
        NavLabel.Parent = TabContainer
        NavLabel.BackgroundTransparency = 1
        NavLabel.Position = UDim2.new(0, 15, 0, 10)
        NavLabel.Size = UDim2.new(1, -30, 0, 20)
        NavLabel.Font = Enum.Font.GothamBold
        NavLabel.Text = "NAVIGATION"
        NavLabel.TextColor3 = Color3.fromRGB(255, 80, 100)
        NavLabel.TextSize = 12
        NavLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Tab list layout
        local TabListLayout = Instance.new("UIListLayout")
        TabListLayout.Parent = TabContainer
        TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabListLayout.Padding = UDim.new(0, 5)
        
        -- Tab padding
        local TabPadding = Instance.new("UIPadding")
        TabPadding.Parent = TabContainer
        TabPadding.PaddingTop = UDim.new(0, 40)
        TabPadding.PaddingLeft = UDim.new(0, 10)
        TabPadding.PaddingRight = UDim.new(0, 10)
        
        UI.TabContainer = TabContainer
        UI.TabListLayout = TabListLayout
        UI.ActiveTab = nil
        UI.Tabs = {}
    end
    
    return TabContainer
end