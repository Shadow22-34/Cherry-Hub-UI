-- Cherry Hub Premium UI Library - Tab Component
return function(UI)
    local Tab = {}
    local TweenService = game:GetService("TweenService")
    
    function Tab:Create(name, icon)
        local tabButton = Instance.new("TextButton")
        tabButton.Name = name.."Tab"
        tabButton.Parent = UI.TabContainer
        tabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        tabButton.BorderSizePixel = 0
        tabButton.Size = UDim2.new(1, 0, 0, 36)
        tabButton.AutoButtonColor = false
        tabButton.Font = Enum.Font.GothamSemibold
        tabButton.Text = ""
        tabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        tabButton.TextSize = 14
        
        local tabCorner = Instance.new("UICorner")
        tabCorner.CornerRadius = UDim.new(0, 6)
        tabCorner.Parent = tabButton
        
        local tabIcon = Instance.new("ImageLabel")
        tabIcon.Name = "Icon"
        tabIcon.Parent = tabButton
        tabIcon.BackgroundTransparency = 1
        tabIcon.Position = UDim2.new(0, 10, 0.5, -10)
        tabIcon.Size = UDim2.new(0, 20, 0, 20)
        tabIcon.Image = icon
        tabIcon.ImageColor3 = Color3.fromRGB(200, 200, 200)
        
        local tabText = Instance.new("TextLabel")
        tabText.Name = "Title"
        tabText.Parent = tabButton
        tabText.BackgroundTransparency = 1
        tabText.Position = UDim2.new(0, 40, 0, 0)
        tabText.Size = UDim2.new(1, -40, 1, 0)
        tabText.Font = Enum.Font.GothamSemibold
        tabText.Text = name
        tabText.TextColor3 = Color3.fromRGB(200, 200, 200)
        tabText.TextSize = 14
        tabText.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Create content page
        local contentPage = Instance.new("ScrollingFrame")
        contentPage.Name = name.."Page"
        contentPage.Parent = UI.ContentContainer
        contentPage.BackgroundTransparency = 1
        contentPage.BorderSizePixel = 0
        contentPage.Size = UDim2.new(1, 0, 1, 0)
        contentPage.ScrollBarThickness = 2
        contentPage.ScrollBarImageColor3 = Color3.fromRGB(255, 80, 100)
        contentPage.Visible = false
        
        local contentLayout = Instance.new("UIListLayout")
        contentLayout.Parent = contentPage
        contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        contentLayout.Padding = UDim.new(0, 10)
        
        local contentPadding = Instance.new("UIPadding")
        contentPadding.Parent = contentPage
        contentPadding.PaddingTop = UDim.new(0, 10)
        contentPadding.PaddingLeft = UDim.new(0, 10)
        contentPadding.PaddingRight = UDim.new(0, 10)
        contentPadding.PaddingBottom = UDim.new(0, 10)
        
        -- Tab functionality
        local tab = {
            Button = tabButton,
            Icon = tabIcon,
            Text = tabText,
            ContentPage = contentPage,
            Name = name
        }
        
        -- Create ripple effect function
        local function createRipple(x, y)
            local ripple = Instance.new("Frame")
            ripple.Name = "Ripple"
            ripple.Parent = tabButton
            ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ripple.BackgroundTransparency = 0.85
            ripple.BorderSizePixel = 0
            ripple.Position = UDim2.new(0, x - 5, 0, y - 5)
            ripple.Size = UDim2.new(0, 10, 0, 10)
            ripple.ZIndex = tabButton.ZIndex + 1
            
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
        
        -- Tab selection handling
        tabButton.MouseButton1Click:Connect(function()
            -- Create ripple effect at click position
            local x, y = game:GetService("UserInputService"):GetMouseLocation().X, game:GetService("UserInputService"):GetMouseLocation().Y
            local buttonPosition = tabButton.AbsolutePosition
            createRipple(x - buttonPosition.X, y - buttonPosition.Y)
            
            -- Select this tab
            if UI.ActiveTab ~= tab then
                if UI.ActiveTab then
                    -- Deselect current tab
                    TweenService:Create(UI.ActiveTab.Button, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(40, 40, 45)
                    }):Play()
                    TweenService:Create(UI.ActiveTab.Icon, TweenInfo.new(0.2), {
                        ImageColor3 = Color3.fromRGB(200, 200, 200)
                    }):Play()
                    TweenService:Create(UI.ActiveTab.Text, TweenInfo.new(0.2), {
                        TextColor3 = Color3.fromRGB(200, 200, 200)
                    }):Play()
                    UI.ActiveTab.ContentPage.Visible = false
                end
                
                -- Select new tab
                TweenService:Create(tabButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(255, 80, 100)
                }):Play()
                TweenService:Create(tabIcon, TweenInfo.new(0.2), {
                    ImageColor3 = Color3.fromRGB(255, 255, 255)
                }):Play()
                TweenService:Create(tabText, TweenInfo.new(0.2), {
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }):Play()
                contentPage.Visible = true
                
                UI.ActiveTab = tab
            end
        end)
        
        -- Add hover effect
        tabButton.MouseEnter:Connect(function()
            if UI.ActiveTab ~= tab then
                TweenService:Create(tabButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(50, 50, 55)
                }):Play()
            end
        end)
        
        tabButton.MouseLeave:Connect(function()
            if UI.ActiveTab ~= tab then
                TweenService:Create(tabButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(40, 40, 45)
                }):Play()
            end
        end)
        
        -- Store the tab
        UI.Tabs[name] = tab
        
        return tab
    end
    
    return Tab
end