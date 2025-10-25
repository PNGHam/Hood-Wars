local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Hood Wars Loader",
   Icon = 0,
   LoadingTitle = "Hood War's Loader.",
   LoadingSubtitle = "by exchinoam",
   ShowText = "Rayfield",
   Theme = "DarkBlue",

   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = true,
   KeySettings = {
      Title = "AUTHENTICATION",
      Subtitle = "Key System",
      Note = "Script still in development. How did you execute it?",
      FileName = "Key",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = {"administrator"}
   }
})

local HomeTab = Window:CreateTab("Home", 0)
local CreditsTab = Window:CreateTab("Credits", 0)

local Paragraph1 = CreditsTab:CreateParagraph({Title = "CREDITS!", Content = "Kylde(@exchinoam) - made the whole script"})

local guiSection = HomeTab:CreateSection("Loader")

local themeDropdown = HomeTab:CreateDropdown({
   Name = "Themes",
   Options = {"Default","AmberGlow", "Amethyst", "Bloom", "DarkBlue", "Green", "Light", "Ocean", "Serenity"},
   CurrentOption = "Default",
   MultipleOptions = false,
   Flag = "Theme",
   Callback = function(Options)
      print("Selected " .. Options[1])
   end,
})

local LoadBtn = HomeTab:CreateButton({
   Name = "Load Selected Theme",
   Callback = function()
    	local currentOption = themeDropdown.CurrentOption[1]
    	print('Loading theme: "' .. currentOption .. '"')
    	wait(0.1)
		getgenv().theme = currentOption
		loadstring(game:HttpGet("https://raw.githubusercontent.com/PNGHam/Hood-Wars/refs/heads/main/main.lua"))()
		Rayfield:Destroy()
   end,
})


local UnloadBtn = HomeTab:CreateButton({
   Name = "Unload Interface.",
   Callback = function()
		Rayfield:Destroy()
   end,
})
