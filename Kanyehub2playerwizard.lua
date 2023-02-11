if game.PlaceId == 281489669 then
	local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
	local Window = OrionLib:MakeWindow({Name = "Kanye Hub", HidePremium = false, IntroText = "Kanye Hub",SaveConfig = true, ConfigFolder = "KanyeCFG"})

	local player = game.Players.LocalPlayer
	local char = player.Character
	local humanoid = char:WaitForChild("Humanoid")

	local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

MainTab:AddToggle({
	Name = "Auto Farm",
	Default = false,
	Callback = function(Value)
		_G.AutoFarm = Value
	end    
})

MainTab:AddSlider({
	Name = "Speed",
	Min = 16,
	Max = 1000,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		humanoid.WalkSpeed = Value
	end    
})

MainTab:AddSlider({
	Name = "Health",
	Min = 100,
	Max = 100000,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Health",
	Callback = function(Value)
		humanoid.MaxHealth = Value
		while wait() do
			humanoid.Health = Value
		end
	end    
})

end

OrionLib:Init()