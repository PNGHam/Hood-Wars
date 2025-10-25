local theme = getgenv().theme
local version = "1.0"
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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
local VersionLabel = HomeTab:CreateLabel("Version: " .. version, nil, Color3.fromRGB(255, 255, 255), false)
local versionDivider = HomeTab:CreateDivider()
local unloadBtn = HomeTab:CreateButton({
   Name = "Unload Script",
   Callback = function()
		Rayfield:Destroy()
   end,
})

local ModsSection = CombatTab:CreateSection("Gun Mods")

local GunCooldown = CombatTab:CreateInput({
   Name = "FireRate",
   CurrentValue = "",
   PlaceholderText = "default ( 0 )",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
		print("applying mod : " .. Text)
   end,
})

local ChangeGunStats = CombatTab:CreateButton({
   Name = "Apply Mods",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})

