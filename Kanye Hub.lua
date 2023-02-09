if game.PlaceId == 11874473440 then
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Kanye Hub", HidePremium = false, IntroText = "Kanye Hub",SaveConfig = true, ConfigFolder = "KanyeCFG"})

--Values
_G.automaterials = true
_G.autoBuildBody = true

--Functions
function automaterials()
	while _G.automaterials == true do
		local args = {
    			[1] = "Glass"
			}

			game:GetService("ReplicatedStorage").Packages.Knit.Services.MaterialService.RF.Collect:InvokeServer(unpack(args))

			local args = {
    			[1] = workspace.Tycoons.Red.Model.Lines.Conveyor1
			}

			game:GetService("ReplicatedStorage").Packages.Knit.Services.MaterialService.RF.Drop:InvokeServer(unpack(args))

			local args = {
    			[1] = "Metal"
			}

			game:GetService("ReplicatedStorage").Packages.Knit.Services.MaterialService.RF.Collect:InvokeServer(unpack(args))

			local args = {
    			[1] = workspace.Tycoons.Red.Model.Lines.Conveyor1
			}

			game:GetService("ReplicatedStorage").Packages.Knit.Services.MaterialService.RF.Drop:InvokeServer(unpack(args))
	end
end

function autoBuildBody()
	while _G.autoBuildBody do
		local args = {
    		[1] = "Conveyor1"
		}	

		game:GetService("ReplicatedStorage").Packages.Knit.Services.TycoonService.RF.SpawnCarSegment:InvokeServer(unpack(args))

		wait(10)
	end
end

function autoSell()
	while _G.autoSell do
		local args = {
    		[1] = workspace.Tycoons.Green.Model.NPCs.BidderPrompt,
    		[2] = "3"
		}

		game:GetService("ReplicatedStorage").Packages.Knit.Services.TycoonService.RF.AcceptBid:InvokeServer(unpack(args))

	end
end

--Tabs
local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--Toggles
MainTab:AddToggle({
	Name = "Auto Add Materials",
	Default = false,
	Callback = function(Value)
		_G.automaterials = Value
		automaterials()
	end    
})

MainTab:AddToggle({
	Name = "Auto Build Body (Rejoin if it Breaks the Conveyor)",
	Default = false,
	Callback = function(Value)
		_G.autoBuildBody = Value
		autoBuildBody()
	end    
})

MainTab:AddToggle({
	Name = "Auto Sell",
	Default = false,
	Callback = function(Value)
		_G.autoSell = Value
		autoSell()
	end    
})

end

OrionLib:Init()