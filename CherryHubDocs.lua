--[[
    Cherry Hub Premium UI Library Documentation
    
    This file contains examples and explanations for all components
    of the Cherry Hub Premium UI Library.
]]

local Documentation = {}

-- Example of how to initialize the library
Documentation.Initialization = [[
    -- Require the module
    local CherryHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/jiohasdas/Cherry-UI-Lib/refs/heads/main/UI%20Source"))()
    
    -- Create the main UI
    local UI = CherryHub:CreateWindow("My Cherry Hub")
]]

-- Example of how to create tabs
Documentation.CreateTab = [[
    -- Create tabs with icons
    local homeTab = UI:CreateTab("Home", "rbxassetid://6026568198") -- Home icon
    local settingsTab = UI:CreateTab("Settings", "rbxassetid://6031763426") -- Settings icon
    local statsTab = UI:CreateTab("Stats", "rbxassetid://6031225819") -- Star icon
    
    -- Select a tab programmatically
    homeTab:Select() -- Makes this tab active
]]

-- Example of how to create a toggle button
Documentation.CreateToggle = [[
    -- Create a toggle button
    local myToggle = settingsTab:CreateToggle("Enable Premium Effects", function(enabled)
        -- This function runs when the toggle is clicked
        print("Toggle is now: " .. (enabled and "Enabled" or "Disabled"))
        
        -- Your code to handle the toggle state
        if enabled then
            -- Do something when enabled
        else
            -- Do something when disabled
        end
    end)
    
    -- You can set the default state
    myToggle:SetState(true) -- Sets the toggle to enabled by default
    
    -- You can get the current state
    local isEnabled = myToggle:GetState()
]]

-- Example of how to create a slider
Documentation.CreateSlider = [[
    -- Create a slider with min, max, default values and callback
    local mySlider = settingsTab:CreateSlider("Animation Speed", 0, 100, 50, function(value)
        -- This function runs when the slider value changes
        print("Slider value changed to: " .. value)
        
        -- Your code to handle the slider value
        game.Workspace.AnimationSpeed = value / 100
    end)
    
    -- You can set the value programmatically
    mySlider:SetValue(75)
    
    -- You can get the current value
    local currentValue = mySlider:GetValue()
]]

-- Example of how to create a dropdown
Documentation.CreateDropdown = [[
    -- Create a dropdown with options and callback
    local themes = {
        {name = "Cherry Dark", color = Color3.fromRGB(255, 80, 100)},
        {name = "Ocean Blue", color = Color3.fromRGB(80, 150, 255)},
        {name = "Emerald Green", color = Color3.fromRGB(80, 220, 100)},
        {name = "Royal Purple", color = Color3.fromRGB(150, 80, 255)}
    }
    
    local myDropdown = settingsTab:CreateDropdown("Theme Selection", themes, function(selected)
        -- This function runs when an option is selected
        print("Selected theme: " .. selected.name)
        
        -- Your code to handle the selection
        UI:SetTheme(selected.color)
    end)
    
    -- You can set the selected option programmatically
    myDropdown:SetSelection(themes[2]) -- Selects "Ocean Blue"
    
    -- You can get the current selection
    local currentTheme = myDropdown:GetSelection()
]]

-- Example of how to create a button
Documentation.CreateButton = [[
    -- Create a button with callback
    local myButton = homeTab:CreateButton("Launch Game", "rbxassetid://6026568198", function()
        -- This function runs when the button is clicked
        print("Button clicked!")
        
        -- Your code to handle the button click
        game:GetService("TeleportService"):Teleport(12345678)
    end)
    
    -- You can disable/enable the button
    myButton:SetEnabled(false) -- Disables the button
    myButton:SetEnabled(true) -- Enables the button
]]

-- Example of how to create a stat card
Documentation.CreateStatCard = [[
    -- Create a stat card with title, value, and icon
    local myStatCard = statsTab:CreateStatCard("Scripts", "42", "rbxassetid://6026568198")
    
    -- You can update the value
    myStatCard:UpdateValue("43")
    
    -- You can animate the counter
    myStatCard:AnimateValue(50) -- Animates from current value to 50
]]

-- Example of how to create a section
Documentation.CreateSection = [[
    -- Create a section with title
    local mySection = settingsTab:CreateSection("Appearance Settings")
    
    -- Add components to the section
    local toggleInSection = mySection:CreateToggle("Enable Effects", function(enabled)
        -- Toggle callback
    end)
    
    local sliderInSection = mySection:CreateSlider("Opacity", 0, 100, 50, function(value)
        -- Slider callback
    end)
]]

-- Example of how to create a notification
Documentation.CreateNotification = [[
    -- Create a notification with title, message, and duration
    UI:CreateNotification("Success", "Settings have been saved!", 3) -- Shows for 3 seconds
    
    -- Create a notification with custom icon and callback
    UI:CreateNotification("Warning", "Are you sure you want to proceed?", 5, "rbxassetid://6031225819", function()
        -- This function runs when the notification is clicked
        print("Notification clicked!")
    end)
]]

-- Example of how to customize the UI
Documentation.Customization = [[
    -- Set a custom theme color
    UI:SetTheme(Color3.fromRGB(255, 100, 120)) -- Cherry red
    
    -- Set a custom font
    UI:SetFont(Enum.Font.GothamBold)
    
    -- Set custom corner radius
    UI:SetCornerRadius(UDim.new(0, 8))
    
    -- Enable/disable animations
    UI:SetAnimationsEnabled(true)
]]

-- Example of how to handle UI events
Documentation.Events = [[
    -- Connect to UI events
    UI.OnClose:Connect(function()
        print("UI was closed!")
    end)
    
    UI.OnMinimize:Connect(function(minimized)
        print("UI was " .. (minimized and "minimized" or "restored"))
    end)
    
    UI.OnTabChanged:Connect(function(tabName)
        print("Switched to tab: " .. tabName)
    end)
]]

-- Example of how to create a complete UI
Documentation.CompleteExample = [[
    -- Require the module
    local CherryHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/CherryHub/main/CherryHub.lua"))()
    
    -- Create the main UI
    local UI = CherryHub:CreateWindow("My Game Hub")
    
    -- Create tabs
    local homeTab = UI:CreateTab("Home", "rbxassetid://6026568198")
    local settingsTab = UI:CreateTab("Settings", "rbxassetid://6031763426")
    local statsTab = UI:CreateTab("Stats", "rbxassetid://6031225819")
    
    -- Home tab content
    local welcomeSection = homeTab:CreateSection("Welcome")
    
    homeTab:CreateButton("Play Game", "rbxassetid://6026568198", function()
        -- Teleport to game
    end)
    
    homeTab:CreateButton("Discord", "rbxassetid://6035047391", function()
        -- Open Discord link
        setclipboard("https://discord.gg/yourdiscord")
        UI:CreateNotification("Discord", "Link copied to clipboard!", 3)
    end)
    
    -- Settings tab content
    local appearanceSection = settingsTab:CreateSection("Appearance")
    
    local effectsToggle = appearanceSection:CreateToggle("Enable Effects", function(enabled)
        -- Handle toggle
    end)
    
    local speedSlider = appearanceSection:CreateSlider("Animation Speed", 0, 100, 50, function(value)
        -- Handle slider
    end)
    
    local themes = {
        {name = "Cherry Dark", color = Color3.fromRGB(255, 80, 100)},
        {name = "Ocean Blue", color = Color3.fromRGB(80, 150, 255)},
        {name = "Emerald Green", color = Color3.fromRGB(80, 220, 100)},
        {name = "Royal Purple", color = Color3.fromRGB(150, 80, 255)}
    }
    
    local themeDropdown = settingsTab:CreateDropdown("Theme", themes, function(selected)
        UI:SetTheme(selected.color)
    end)
    
    -- Stats tab content
    statsTab:CreateStatCard("Scripts", "42", "rbxassetid://6026568198")
    statsTab:CreateStatCard("Games", "128", "rbxassetid://6031225819")
    statsTab:CreateStatCard("Updates", "7", "rbxassetid://6031763426")
    
    -- Select home tab by default
    homeTab:Select()
]]

-- Return the documentation
return Documentation