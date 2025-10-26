local function LoadScript()
local theme = getgenv().theme
local version = "1.0"
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local gunMods = {
	["Cooldown"] = 0.1,
	["Damage"] = 9,
	["ExtraDamage"] = 0,
	["MaxUses"] = 30,
	["OriginBrightness"] = 10,
	["RealAmmo"] = 30,
	["Uses"] = 30,
	["ReloadLength"] = 2.5,
	["AimZoom"] = 50,
	["MaxRange"] = 200,
	["AimSensitivity"] = 1,
	["SpeedModifier"] = 0,
	["DrawLength"] = 10,
	["Recoil"] = 1.1,
	["AimSpeed"] = 100
}


local Window = Rayfield:CreateWindow({
   Name = "Hood Wars SCRIPT",
   Icon = 0,
   LoadingTitle = "script by exchinoam",
   LoadingSubtitle = "give creds plz",
   ShowText = "Rayfield", 
   Theme = theme, 

   ToggleUIKeybind = "K", 

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, 

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, 
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink", 
      RememberJoins = true 
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local HomeTab = Window:CreateTab("Home", "warehouse")
local CombatTab = Window:CreateTab("Combat", "swords") -- Title, Image
local VisualsTab = Window:CreateTab("Visuals", "eye") -- Title, Image
local MovementTab = Window:CreateTab("Movement", "gauge") -- Title, Image

local VersionSection = HomeTab:CreateSection("Information")
local themeLabel = HomeTab:CreateLabel("Current Theme: " .. theme, nil, Color3.fromRGB(255, 255, 255), false)
local VersionLabel = HomeTab:CreateLabel("Version: " .. version, nil, Color3.fromRGB(255, 255, 255), false)
local versionDivider = HomeTab:CreateDivider()
local unloadBtn = HomeTab:CreateButton({
   Name = "Unload Script",
   Callback = function()
		Rayfield:Destroy()
   end,
})

local ModsSection = CombatTab:CreateSection("Gun Mods")

local FireSpeedSlider = CombatTab:CreateSlider({
   Name = "Fire Rate",
   Range = {0, 20},
   Increment = 0.1,
   Suffix = "",
   CurrentValue = 1,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		gunMods.Cooldown = Value
   end,
})

local ReloadSlider = CombatTab:CreateSlider({
   Name = "Reload Speed",
   Range = {0, 20},
   Increment = 0.1,
   Suffix = "",
   CurrentValue = 2.5,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		gunMods.ReloadLength = Value
   end,
})

local AimZoom = CombatTab:CreateSlider({
   Name = "Spread",
   Range = {0, 100},
   Increment = 1,
   Suffix = "",
   CurrentValue = 40,
   Flag = "Slider4", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		gunMods.AimZoom = Value
   end,
})

local RecoilSlider = CombatTab:CreateSlider({
   Name = "Gun Recoil",
   Range = {0, 20},
   Increment = 0.1,
   Suffix = "",
   CurrentValue = 1.1,
   Flag = "Slider3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
	gunMods.Recoil = Value
   end,
})


local ChangeGunStats = CombatTab:CreateButton({
   Name = "Apply Mods",
   Callback = function()
      for k, v in pairs(gunMods) do
         print(k .. " is " .. tostring(v))
      end
   end,
})
end

if getgenv().theme then
	LoadScript()
else
	print("INVALID!")
end
