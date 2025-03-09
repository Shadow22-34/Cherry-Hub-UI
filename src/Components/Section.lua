-- Cherry Hub Premium UI Library - Section Component
return function(UI)
    local Section = {}
    local TweenService = game:GetService("TweenService")
    
    function Section:Create(parent, title)
        -- Create section container
        local sectionContainer = Instance.new("Frame")
        sectionContainer.Name = title.."Section"
        sectionContainer.Parent = parent
        sectionContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
        sectionContainer.BorderSizePixel = 0
        sectionContainer.Size = UDim2.new(1, -20, 0, 40) -- Initial size, will expand with content
        
        local containerCorner = Instance.new("UICorner")
        containerCorner.CornerRadius = UDim.new(0, 8)
        containerCorner.Parent = sectionContainer
        
        -- Section title
        local sectionTitle = Instance.new("TextLabel")
        sectionTitle.Name = "Title"
        sectionTitle.Parent = sectionContainer
        sectionTitle.BackgroundTransparency = 1
        sectionTitle.Position = UDim2.new(0, 15, 0, 0)
        sectionTitle.Size = UDim2.new(1, -30, 0, 40)
        sectionTitle.Font = Enum.Font.GothamBold
        sectionTitle.Text = title
        sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        sectionTitle.TextSize = 14
        sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Content container
        local contentContainer = Instance.new("Frame")
        contentContainer.Name = "Content"
        contentContainer.Parent = sectionContainer
        contentContainer.BackgroundTransparency = 1
        contentContainer.Position = UDim2.new(0, 10, 0, 40)
        contentContainer.Size = UDim2.new(1, -20, 0, 0) -- Will be resized as content is added
        
        local contentLayout = Instance.new("UIListLayout")
        contentLayout.Parent = contentContainer
        contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        contentLayout.Padding = UDim.new(0, 8)
        
        -- Add a subtle gradient
        local gradient = Instance.new("UIGradient")
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 45)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 40))
        })
        gradient.Rotation = 90
        gradient.Parent = sectionContainer
        
        -- Add a subtle glow effect
        local glow = Instance.new("ImageLabel")
        glow.Name = "Glow"
        glow.Parent = sectionContainer
        glow.BackgroundTransparency = 1
        glow.Position = UDim2.new(0, -15, 0, -15)
        glow.Size = UDim2.new(1, 30, 1, 30)
        glow.Image = "rbxassetid://6015897843"
        glow.ImageColor3 = Color3.fromRGB(255, 80, 100)
        glow.ImageTransparency = 0.9
        glow.ZIndex = sectionContainer.ZIndex - 1
        
        -- Auto-resize function
        local function updateSectionSize()
            local contentSize = contentLayout.AbsoluteContentSize.Y
            contentContainer.Size = UDim2.new(1, -20, 0, contentSize)
            sectionContainer.Size = UDim2.new(1, -20, 0, contentSize + 50) -- 40 for title + 10 padding
        end
        
        -- Connect the auto-resize function to the layout's content size change
        contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateSectionSize)
        
        -- Return section object with methods
        local sectionObj = {
            Container = sectionContainer,
            Title = sectionTitle,
            Content = contentContainer
        }
        
        -- Add component methods
        function sectionObj:AddButton(text, icon, callback)
            local button = UI.Components.Button:Create(contentContainer, text, icon, callback)
            updateSectionSize()
            return button
        end
        
        function sectionObj:AddToggle(text, callback)
            local toggle = UI.Components.Toggle:Create(contentContainer, text, callback)
            updateSectionSize()
            return toggle
        end
        
        function sectionObj:AddSlider(text, min, max, default, callback)
            local slider = UI.Components.Slider:Create(contentContainer, text, min, max, default, callback)
            updateSectionSize()
            return slider
        end
        
        function sectionObj:AddDropdown(text, options, callback)
            local dropdown = UI.Components.Dropdown:Create(contentContainer, text, options, callback)
            updateSectionSize()
            return dropdown
        end
        
        function sectionObj:AddLabel(text)
            local label = Instance.new("TextLabel")
            label.Name = text.."Label"
            label.Parent = contentContainer
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(1, 0, 0, 30)
            label.Font = Enum.Font.Gotham
            label.Text = text
            label.TextColor3 = Color3.fromRGB(200, 200, 200)
            label.TextSize = 14
            
            updateSectionSize()
            return label
        end
        
        function sectionObj:AddDivider()
            local divider = Instance.new("Frame")
            divider.Name = "Divider"
            divider.Parent = contentContainer
            divider.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
            divider.BorderSizePixel = 0
            divider.Size = UDim2.new(1, 0, 0, 1)
            
            updateSectionSize()
            return divider
        end
        
        return sectionObj
    end
    
    return Section
end