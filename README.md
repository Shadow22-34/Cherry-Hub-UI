# 🍒 Cherry Hub UI Library

<div align="center">
  <img src="assets/cherry-logo.png" alt="Cherry Hub Logo" width="200">
  <br>
  <h3>A sleek, modern UI library for Roblox exploits</h3>
  <br>
</div>

## 📋 Features

- **Elegant Design**: Smooth animations and modern aesthetics
- **Easy to Use**: Simple API for creating beautiful interfaces
- **Customizable**: Adapt the UI to match your script's style
- **Lightweight**: Optimized for performance
- **Cross-Exploit Compatible**: Works with most popular Roblox executors

## 🚀 Getting Started

### Installation

```lua
local CherryHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/jiohasdas/Cherry-UI/main/CherryHub.lua"))()
```

## Directory Structure

```
src/
├── Core/
│   ├── UICore.lua       - Core UI initialization and setup
│   └── TabSystem.lua    - Tab management system
├── Components/
│   ├── Button.lua       - Button component
│   ├── Dropdown.lua     - Dropdown component
│   ├── Section.lua      - Section container component
│   ├── Slider.lua       - Slider component
│   ├── Tab.lua          - Tab component
│   ├── Toggle.lua       - Toggle component
│   └── StatCard.lua     - Statistics card component
└── CherryHub.lua        - Main library entry point

```

## Customization Guide

### Theme Colors
Locate these values in `src/Core/UICore.lua`:
- Primary Color: Color3.fromRGB(255, 80, 100)
- Background Color: Color3.fromRGB(15, 15, 20)
- Secondary Background: Color3.fromRGB(20, 20, 25)
- Text Color: Color3.fromRGB(255, 255, 255)

### Text Content
Customize text in `src/Core/UICore.lua`:
- Title: "Cherry Hub"
- Navigation Text: "NAVIGATION"
- Default Tab Names

### Components
Each component in the `src/Components/` directory can be customized:
- Button styles and effects
- Toggle animations
- Slider behavior
- Dropdown appearance

### Animations
Adjust animation properties in respective component files:
- Duration
- Easing style
- Transition effects

### Adding New Features
1. Create new component in `src/Components/`
2. Register in `src/Core/UICore.lua`
3. Add to the main interface in `src/CherryHub.lua`

## Usage Example

```lua
local CherryHub = require(game.ReplicatedStorage.CherryHub)

local UI = CherryHub.new()
local mainTab = UI:CreateTab("Main", "rbxassetid://icon")

mainTab:AddToggle("Feature", function(enabled)
    print("Toggle:", enabled)
end)
```