local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/ezpoSword/Rayfield_Roblox/refs/heads/main/RayfieldMenuCode-No-tWorking'))()

local Window = Rayfield:CreateWindow({
   Name = "FGFS | Ayşenin hilesi ",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "ayşenin hilesi - FGFS cheat",
   LoadingSubtitle = "FGFS - cheat tarafından geliştirildi",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = False, -- Set this to true to use our key system
   KeySettings = {
      Title = "Ayşe  key system",
      Subtitle = "Key System",
      Note = "kağıtta kaydettiğin şifre ile AYNI!", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = False, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"19059"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})



local Tab = Window:CreateTab("Home", "Home")



local JumpPowerValue = 10 -- Kaydırıcı başlangıç değeri

-- Slider oluşturma
local Slider = Tab:CreateSlider({
   Name = "Jump Power",
   Range = {0, 500},
   Increment = 10,
   Suffix = "Jump Power",
   CurrentValue = JumpPowerValue,
   Flag = "Slider2",
   Callback = function(Value)
       JumpPowerValue = Value -- Slider değerini güncelle
   end,
})

-- JumpPower sürekli güncelleme
local RunService = game:GetService("RunService")
RunService.Heartbeat:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChild("Humanoid")
    
    if humanoid then
        humanoid.UseJumpPower = true -- JumpPower kullanımını etkinleştir
        humanoid.JumpPower = JumpPowerValue -- Yeni zıplama gücünü uygula
    end
end)



local Slider = Tab:CreateSlider({
   Name = "Speed",
   Range = {0, 500},
   Increment = 10,
   Suffix = "Speed",
   CurrentValue = SliderValue,
   Flag = "Slider1",
   Callback = function(Value)
       SliderValue = Value 
   end,
})


task.spawn(function()
   while true do
       local player = game.Players.LocalPlayer
       local character = player.Character or player.CharacterAdded:Wait()
       local humanoid = character:FindFirstChild("Humanoid")
       
       if humanoid then
           humanoid.WalkSpeed = SliderValue 
       end
       task.wait(0.1) 
   end
end)







