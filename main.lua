local function LoadScript()
	local theme = getgenv().theme
	local version = "1.0"
	local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

	--// Services
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local player = Players.LocalPlayer

	--// Configs
	local cframeSpeed = 0.5
	local speedflag = false

	--// Gun Mod Settings
	local gunMods = {
		["Cooldown"] = 0.1,
		["Damage"] = 9,
		["MaxUses"] = 30,
		["Uses"] = 30,
		["ReloadLength"] = 2.5,
		["AimSensitivity"] = 1,
		["SpeedModifier"] = 0,
		["DrawLength"] = 10,
		["Recoil"] = 1.1
	}

	--// Movement logic
	local function setupMovement(character)
		local humanoid = character:WaitForChild("Humanoid")
		local hrp = character:WaitForChild("HumanoidRootPart")
		humanoid.JumpPower = 40

		RunService.RenderStepped:Connect(function()
			if speedflag and character and humanoid and hrp and humanoid.MoveDirection.Magnitude > 0 then
				hrp.CFrame = hrp.CFrame + (humanoid.MoveDirection * cframeSpeed)
			end
		end)
	end

	player.CharacterAdded:Connect(setupMovement)
	if player.Character then setupMovement(player.Character) end

	--// Rayfield UI
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
		KeySystem = false
	})

	local HomeTab = Window:CreateTab("Home", "warehouse")
	local CombatTab = Window:CreateTab("Combat", "swords")
	local VisualsTab = Window:CreateTab("Visuals", "eye")
	local MovementTab = Window:CreateTab("Movement", "gauge")

	local VersionSection = HomeTab:CreateSection("Information")
	local themeLabel = HomeTab:CreateLabel("Current Theme: " .. theme)
	local VersionLabel = HomeTab:CreateLabel("Version: " .. version)
	local versionDivider = HomeTab:CreateDivider()

	local unloadBtn = HomeTab:CreateButton({
		Name = "Unload Script",
		Callback = function()
			Rayfield:Destroy()
		end,
	})

	--// Combat Tab
	local ModsSection = CombatTab:CreateSection("Gun Mods")

	local FireSpeedSlider = CombatTab:CreateSlider({
		Name = "Fire Rate",
		Range = {0, 20},
		Increment = 0.1,
		CurrentValue = 1,
		Flag = "fireRate",
		Callback = function(Value)
			gunMods.Cooldown = Value
		end,
	})

	local ReloadSlider = CombatTab:CreateSlider({
		Name = "Reload Speed",
		Range = {0, 20},
		Increment = 0.1,
		CurrentValue = 2.5,
		Flag = "reloadSpeed",
		Callback = function(Value)
			gunMods.ReloadLength = Value
		end,
	})

	local AimZoomSlider = CombatTab:CreateSlider({
		Name = "Spread",
		Range = {0, 100},
		Increment = 1,
		CurrentValue = 40,
		Flag = "spread",
		Callback = function(Value)
			gunMods.AimZoom = Value
		end,
	})

	local RecoilSlider = CombatTab:CreateSlider({
		Name = "Gun Recoil",
		Range = {0, 20},
		Increment = 0.1,
		CurrentValue = 1.1,
		Flag = "recoil",
		Callback = function(Value)
			gunMods.Recoil = Value
		end,
	})

	local ChangeGunStats = CombatTab:CreateButton({
		Name = "Apply Mods",
		Callback = function()
			for item, value in pairs(gunMods) do
				print("Applied " .. item .. " = " .. tostring(value))
			end
		end,
	})

	--// Movement Tab
	local MovementSection = MovementTab:CreateSection("CFrame Speed")

	local SpeedSlider = MovementTab:CreateSlider({
		Name = "CFrame Speed",
		Range = {0, 5},
		Increment = 0.1,
		CurrentValue = cframeSpeed,
		Flag = "cframeSpeedSlider",
		Callback = function(Value)
			cframeSpeed = Value
		end,
	})

	local SpeedToggle = MovementTab:CreateToggle({
		Name = "Enable CFrame Speed",
		CurrentValue = false,
		Flag = "cframeToggle",
		Callback = function(Value)
			speedflag = Value
		end,
	})
end

--// Loader
if getgenv().theme == "Default" or getgenv().theme == "AmberGlow" or getgenv().theme == "Amethyst" or getgenv().theme == "Bloom" or getgenv().theme == "DarkBlue" or getgenv().theme == "Green" or getgenv().theme == "Light" or getgenv().theme == "Ocean" or getgenv().theme == "Serenity"then
	LoadScript()
else
	warn("ATTEMPTING TO EXECUTE SCRIPT WITH INVALID THEME!")
end
