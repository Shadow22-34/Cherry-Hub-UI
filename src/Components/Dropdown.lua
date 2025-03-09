-- Cherry Hub Premium UI Library - Dropdown Component
return function(UI)
    local Dropdown = {}
    local TweenService = game:GetService("TweenService")
    
    function Dropdown:Create(parent, text, options, callback)
        -- Create dropdown container
        local dropdownContainer = Instance.new("Frame")
        dropdownContainer.Name = text.."DropdownContainer"
        dropdownContainer.Parent = parent
        dropdownContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        dropdownContainer.BorderSizePixel = 0
        dropdownContainer.Size = UDim2.new(1, 0, 0, 40)
        dropdownContainer.ClipsDescendants = true
        
        local containerCorner = Instance.new("UICorner")
        containerCorner.CornerRadius = UDim.new(0, 6)
        containerCorner.Parent = dropdownContainer
        
        -- Dropdown header
        local dropdownHeader = Instance.new("TextButton")
        dropdownHeader.Name = "Header"
        dropdownHeader.Parent = dropdownContainer
        dropdownHeader.BackgroundTransparency = 1
        dropdownHeader.Size = UDim2.new(1, 0, 0, 40)
        dropdownHeader.Font = Enum.Font.GothamSemibold
        dropdownHeader.Text = ""
        dropdownHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
        dropdownHeader.TextSize = 14
        
        -- Dropdown label
        local dropdownLabel = Instance.new("TextLabel")
        dropdownLabel.Name = "Label"
        dropdownLabel.Parent = dropdownHeader
        dropdownLabel.BackgroundTransparency = 1
        dropdownLabel.Position = UDim2.new(0, 15, 0, 0)
        dropdownLabel.Size = UDim2.new(1, -55, 1, 0)
        dropdownLabel.Font = Enum.Font.GothamSemibold
        dropdownLabel.Text = text
        dropdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        dropdownLabel.TextSize = 14
        dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Selected value display
        local selectedDisplay = Instance.new("TextLabel")
        selectedDisplay.Name = "Selected"
        selectedDisplay.Parent = dropdownHeader
        selectedDisplay.BackgroundTransparency = 1
        selectedDisplay.Position = UDim2.new(0, 15, 0.5, 0)
        selectedDisplay.Size = UDim2.new(1, -55, 0, 20)
        selectedDisplay.Font = Enum.Font.Gotham
        selectedDisplay.Text = "Select..."
        selectedDisplay.TextColor3 = Color3.fromRGB(180, 180, 180)
        selectedDisplay.TextSize = 12
        selectedDisplay.TextXAlignment = Enum.TextXAlignment.Left
        selectedDisplay.Visible = false
        
        -- Dropdown arrow
        local dropdownArrow = Instance.new("ImageLabel")
        dropdownArrow.Name = "Arrow"
        dropdownArrow.Parent = dropdownHeader
        dropdownArrow.BackgroundTransparency = 1
        dropdownArrow.Position = UDim2.new(1, -30, 0.5, -8)
        dropdownArrow.Size = UDim2.new(0, 16, 0, 16)
        dropdownArrow.Image = "rbxassetid://6031091004"
        dropdownArrow.ImageColor3 = Color3.fromRGB(255, 80, 100)
        dropdownArrow.Rotation = 0
        
        -- Options container
        local optionsContainer = Instance.new("ScrollingFrame")
        optionsContainer.Name = "Options"
        optionsContainer.Parent = dropdownContainer
        optionsContainer.BackgroundTransparency = 1
        optionsContainer.BorderSizePixel = 0
        optionsContainer.Position = UDim2.new(0, 0, 0, 40)
        optionsContainer.Size = UDim2.new(1, 0, 0, 0) -- Will be resized when opened
        optionsContainer.ScrollBarThickness = 2
        optionsContainer.ScrollBarImageColor3 = Color3.fromRGB(255, 80, 100)
        optionsContainer.CanvasSize = UDim2.new(0, 0, 0, 0) -- Will be updated based on options
        
        local optionsLayout = Instance.new("UIListLayout")
        optionsLayout.Parent = optionsContainer
        optionsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        optionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
        optionsLayout.Padding = UDim.new(0, 5)
        
        local optionsPadding = Instance.new("UIPadding")
        optionsPadding.Parent = optionsContainer
        optionsPadding.PaddingTop = UDim.new(0, 5)
        optionsPadding.PaddingLeft = UDim.new(0, 5)
        optionsPadding.PaddingRight = UDim.new(0, 5)
        optionsPadding.PaddingBottom = UDim.new(0, 5)
        
        -- Create ripple effect function
        local function createRipple(parent, x, y)
            local ripple = Instance.new("Frame")
            ripple.Name = "Ripple"
            ripple.Parent = parent
            ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ripple.BackgroundTransparency = 0.85
            ripple.BorderSizePixel = 0
            ripple.Position = UDim2.new(0, x - 5, 0, y - 5)
            ripple.Size = UDim2.new(0, 10, 0, 10)
            ripple.ZIndex = parent.ZIndex + 1
            
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
        
        -- Dropdown functionality
        local isOpen = false
        local selectedOption = nil
        
        -- Create option buttons
        for i, option in ipairs(options) do
            local optionButton = Instance.new("TextButton")
            optionButton.Name = "Option_" .. i
            optionButton.Parent = optionsContainer
            optionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            optionButton.BorderSizePixel = 0
            optionButton.Size = UDim2.new(1, 0, 0, 30)
            optionButton.Font = Enum.Font.Gotham
            optionButton.Text = option.name or tostring(option)
            optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            optionButton.TextSize = 14
            optionButton.AutoButtonColor = false
            
            local optionCorner = Instance.new("UICorner")
            optionCorner.CornerRadius = UDim.new(0, 4)
            optionCorner.Parent = optionButton
            
            -- Option hover effect
            optionButton.MouseEnter:Connect(function()
                TweenService:Create(optionButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(255, 80, 100)
                }):Play()
            end)
            
            optionButton.MouseLeave:Connect(function()
                TweenService:Create(optionButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(50, 50, 55)
                }):Play()
            end)
            
            -- Option selection
            optionButton.MouseButton1Click:Connect(function()
                -- Create ripple effect
                local x, y = game:GetService("UserInputService"):GetMouseLocation().X, game:GetService("UserInputService"):GetMouseLocation().Y
                local buttonPosition = optionButton.AbsolutePosition
                createRipple(optionButton, x - buttonPosition.X, y - buttonPosition.Y)
                
                -- Update selected option
                selectedOption = option
                selectedDisplay.Text = option.name or tostring(option)
                selectedDisplay.Visible = true
                
                -- Close dropdown
                isOpen = false
                TweenService:Create(dropdownContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.new(1, 0, 0, 40)
                }):Play()
                
                TweenService:Create(optionsContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.new(1, 0, 0, 0)
                }):Play()
                
                TweenService:Create(dropdownArrow, TweenInfo.new(0.3), {
                    Rotation = 0
                }):Play()
                
                -- Execute callback
                if callback then
                    callback(option)
                end
            end)
        end
        
        -- Update canvas size based on options
        optionsContainer.CanvasSize = UDim2.new(0, 0, 0, optionsLayout.AbsoluteContentSize.Y + 10)
        
        -- Toggle dropdown
        dropdownHeader.MouseButton1Click:Connect(function()
            -- Create ripple effect
            local x, y = game:GetService("UserInputService"):GetMouseLocation().X, game:GetService("UserInputService"):GetMouseLocation().Y
            local headerPosition = dropdownHeader.AbsolutePosition
            createRipple(dropdownHeader, x - headerPosition.X, y - headerPosition.Y)
            
            isOpen = not isOpen
            
            if isOpen then
                -- Calculate options height (limited to 150 pixels max)
                local optionsHeight = math.min(optionsLayout.AbsoluteContentSize.Y + 10, 150)
                
                -- Open dropdown
                TweenService:Create(dropdownContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.new(1, 0, 0, 40 + optionsHeight)
                }):Play()
                
                TweenService:Create(optionsContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.new(1, 0, 0, optionsHeight)
                }):Play()
                
                TweenService:Create(dropdownArrow, TweenInfo.new(0.3), {
                    Rotation = 180
                }):Play()
            else
                -- Close dropdown
                TweenService:Create(dropdownContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.new(1, 0, 0, 40)
                }):Play()
                
                TweenService:Create(optionsContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.new(1, 0, 0, 0)
                }):Play()
                
                TweenService:Create(dropdownArrow, TweenInfo.new(0.3), {
                    Rotation = 0
                }):Play()
            end
        end)
        
        -- Add hover effect
        dropdownHeader.MouseEnter:Connect(function()
            TweenService:Create(dropdownContainer, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            }):Play()
        end)
        
        dropdownHeader.MouseLeave:Connect(function()
            TweenService:Create(dropdownContainer, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            }):Play()
        end)
        
        -- Return dropdown object with methods
        local dropdownObj = {
            Container = dropdownContainer,
            Header = dropdownHeader,
            Options = optionsContainer
        }
        
        -- Set selection method
        function dropdownObj:SetSelection(option)
            selectedOption = option
            selectedDisplay.Text = option.name or tostring(option)
            selectedDisplay.Visible = true
            
            if callback then
                callback(option)
            end
        end
        
        -- Get selection method
        function dropdownObj:GetSelection()
            return selectedOption
        end
        
        return dropdownObj
    end
    
    return Dropdown
end