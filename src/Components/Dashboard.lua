-- Cherry Hub Premium UI Library - Dashboard Component
return function(UI)
    local Dashboard = {}
    local TweenService = game:GetService("TweenService")
    
    function Dashboard:Create(parent)
        -- Create dashboard container
        local dashboardContainer = Instance.new("Frame")
        dashboardContainer.Name = "DashboardContainer"
        dashboardContainer.Parent = parent
        dashboardContainer.BackgroundTransparency = 1
        dashboardContainer.Size = UDim2.new(1, 0, 1, 0)
        
        -- Stats container for the top row of stat cards
        local statsContainer = Instance.new("Frame")
        statsContainer.Name = "StatsContainer"
        statsContainer.Parent = dashboardContainer
        statsContainer.BackgroundTransparency = 1
        statsContainer.Size = UDim2.new(1, 0, 0, 110)
        
        local statsLayout = Instance.new("UIListLayout")
        statsLayout.Parent = statsContainer
        statsLayout.FillDirection = Enum.FillDirection.Horizontal
        statsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        statsLayout.SortOrder = Enum.SortOrder.LayoutOrder
        statsLayout.Padding = UDim.new(0, 15)
        
        -- Content container for sections below stats
        local contentContainer = Instance.new("ScrollingFrame")
        contentContainer.Name = "ContentContainer"
        contentContainer.Parent = dashboardContainer
        contentContainer.BackgroundTransparency = 1
        contentContainer.Position = UDim2.new(0, 0, 0, 120)
        contentContainer.Size = UDim2.new(1, 0, 1, -120)
        contentContainer.ScrollBarThickness = 2
        contentContainer.ScrollBarImageColor3 = Color3.fromRGB(255, 80, 100)
        
        local contentLayout = Instance.new("UIListLayout")
        contentLayout.Parent = contentContainer
        contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        contentLayout.Padding = UDim.new(0, 15)
        
        local contentPadding = Instance.new("UIPadding")
        contentPadding.Parent = contentContainer
        contentPadding.PaddingTop = UDim.new(0, 10)
        contentPadding.PaddingBottom = UDim.new(0, 10)
        
        -- Auto-update content size
        contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            contentContainer.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 20)
        end)
        
        -- Return dashboard object with methods
        local dashboardObj = {
            Container = dashboardContainer,
            StatsContainer = statsContainer,
            ContentContainer = contentContainer,
            Stats = {}
        }
        
        -- Add stat card method
        function dashboardObj:AddStatCard(title, value, icon)
            local statCard = UI.Components.StatCard:Create(statsContainer, title, value, icon)
            self.Stats[title] = statCard
            return statCard
        end
        
        -- Add section method
        function dashboardObj:AddSection(title)
            local section = UI.Components.Section:Create(contentContainer, title)
            return section
        end
        
        -- Update stat method
        function dashboardObj:UpdateStat(title, value)
            if self.Stats[title] then
                self.Stats[title]:UpdateValue(value)
            end
        end
        
        return dashboardObj
    end
    
    return Dashboard
end