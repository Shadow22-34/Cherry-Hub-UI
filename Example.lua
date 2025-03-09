-- Cherry Hub Premium UI Library Example
local CherryHub = require(script.Parent.CherryHub)

-- Create a new window
local UI = CherryHub:CreateWindow("Cherry Hub Premium")

-- Create tabs
local homeTab = UI:AddTab("Home", "rbxassetid://6026568198") -- Home icon
local settingsTab = UI:AddTab("Settings", "rbxassetid://6031763426") -- Settings icon
local scriptsTab = UI:AddTab("Scripts", "rbxassetid://6031225819") -- Star icon

-- Create a dashboard in the home tab
local dashboard = UI:AddDashboard("Dashboard", "rbxassetid://6026568198")

-- Add stat cards to the dashboard
dashboard:AddStatCard("Scripts", "42", "rbxassetid://6026568198")
dashboard:AddStatCard("Games", "128", "rbxassetid://6031225819")
dashboard:AddStatCard("Updates", "7", "rbxassetid://6031763426")

-- Add a section to the dashboard
local infoSection = dashboard:AddSection("Information")

-- Add components to the section
infoSection:AddLabel("Welcome to Cherry Hub Premium")
infoSection:AddButton("Join Discord", "rbxassetid://6035047391", function()
    -- Open Discord link
    UI:Notify("Discord", "Opening Discord invite link...", 3)
end)

infoSection:AddDivider()

infoSection:AddButton("Check for Updates", "rbxassetid://6031763426", function()
    -- Check for updates logic
    UI:Notify("Updates", "Checking for updates...", 3)
    wait(2)
    UI:Notify("Updates", "You are using the latest version!", 3)
end)

-- Create settings in the settings tab
local appearanceSection = settingsTab.ContentPage:FindFirstChild("Section") or 
    UI.Components.Section:Create(settingsTab.ContentPage, "Appearance")

-- Add toggle to the settings section
local effectsToggle = appearanceSection:AddToggle("Enable Premium Effects", function(value)
    -- Toggle callback
    UI:Notify("Settings", "Premium effects " .. (value and "enabled" or "disabled"), 3)
end)

-- Add slider to the settings section
local speedSlider = appearanceSection:AddSlider("Animation Speed", 0, 100, 50, function(value)
    -- Slider callback
    UI:Notify("Settings", "Animation speed set to " .. value .. "%", 3)
end)

-- Add dropdown to the settings section
local themeDropdown = appearanceSection:AddDropdown("Theme", {
    {name = "Cherry Dark", value = "dark"},
    {name = "Cherry Light", value = "light"},
    {name = "Cherry Neon", value = "neon"},
    {name = "Cherry Minimal", value = "minimal"}
}, function(option)
    -- Dropdown callback
    UI:Notify("Settings", "Theme changed to " .. option.name, 3)
end)

-- Create scripts tab content
local popularSection = UI.Components.Section:Create(scriptsTab.ContentPage, "Popular Scripts")

popularSection:AddButton("Script 1", "rbxassetid://6026568198", function()
    UI:Notify("Scripts", "Executing Script 1...", 3)
end)

popularSection:AddButton("Script 2", "rbxassetid://6026568198", function()
    UI:Notify("Scripts", "Executing Script 2...", 3)
end)

popularSection:AddButton("Script 3", "rbxassetid://6026568198", function()
    UI:Notify("Scripts", "Executing Script 3...", 3)
end)

-- Show a welcome notification
UI:Notify("Welcome", "Thank you for using Cherry Hub Premium!", 5)