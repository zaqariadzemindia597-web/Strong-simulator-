local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "LUCIFER | GOD SPEED SIMULATOR",
   LoadingTitle = "Breaking Physics...",
   ConfigurationSaving = {Enabled = false}
})

_G.UltraFarm = false
_G.SpeedMultiplier = 20 -- საწყისი სისწრაფე

local MainTab = Window:CreateTab("Ultra Farm", 4483362458)

-- 1. SPEED SELECTOR (აირჩიე სისწრაფე)
MainTab:CreateDropdown({
   Name = "Workout Intensity",
   Options = {"20x Speed", "50x Speed", "100x Speed (RISKY)"},
   CurrentOption = "20x Speed",
   Callback = function(Option)
      if Option == "20x Speed" then _G.SpeedMultiplier = 20
      elseif Option == "50x Speed" then _G.SpeedMultiplier = 50
      elseif Option == "100x Speed (RISKY)" then _G.SpeedMultiplier = 100
      end
   end,
})

-- 2. ULTRA FAST WORKOUT
MainTab:CreateToggle({
   Name = "START ULTRA FARM",
   CurrentValue = false,
   Callback = function(Value)
      _G.UltraFarm = Value
      if Value then
          spawn(function()
              while _G.UltraFarm do
                  local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                  if tool then
                      -- ეს არის "მაგია": ერთ ციკლზე აგზავნის ბევრ მოთხოვნას
                      for i = 1, _G.SpeedMultiplier do
                          tool:Activate()
                          -- ვეძებთ იარაღის ივენთს პირდაპირი დარტყმისთვის
                          local event = tool:FindFirstChildOfClass("RemoteEvent") or tool:FindFirstChild("Remote")
                          if event then
                              event:FireServer()
                          end
                      end
                  end
                  task.wait(0.05) -- მცირე შესვენება, რომ თამაშმა არ გაგაგდოს (Kick)
              end
          end)
      end
   end,
})

-- 3. AUTO REBIRTH (FAST)
MainTab:CreateToggle({
   Name = "Fast Auto-Rebirth",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoRebirth = Value
      if Value then
          spawn(function()
              while _G.AutoRebirth do
                  local rb = game:GetService("ReplicatedStorage"):FindFirstChild("Rebirth", true)
                  if rb then rb:FireServer() end
                  task.wait(0.1)
              end
          end)
      end
   end,
})

local MiscTab = Window:CreateTab("Misc", 4483362458)
MiscTab:CreateButton({
   Name = "Infinite Energy/Stamina",
   Callback = function()
       local stats = game.Players.LocalPlayer.Character:FindFirstChild("Stats")
       if stats and stats:FindFirstChild("Energy") then
           stats.Energy.Value = 999999
       end
   end,
})
