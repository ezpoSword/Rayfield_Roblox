local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/ezpoSword/Rayfield_Roblox/refs/heads/main/RayfieldMenuCode-No-tWorking'))()

local Window = Rayfield:CreateWindow({
   Name = "FGFS | süleymanın hilesi",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Süleyman hilesi - FGFS cheat",
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

   KeySystem = True, -- Set this to true to use our key system
   KeySettings = {
      Title = "Süleyman key system",
      Subtitle = "Key System",
      Note = "kağıtta kaydettiğin şifre ile AYNI!", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = False, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"19059"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


local Tab = Window:CreateTab("Ev - home", "Home")




local Button = Tab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
      -- Infinite Jump activation
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      local humanoid = character:WaitForChild("Humanoid")
      local userInputService = game:GetService("UserInputService")

      -- Variable to toggle Infinite Jump
      local infiniteJumpEnabled = false

      -- Handle user input
      userInputService.InputBegan:Connect(function(input, isProcessed)
         if isProcessed then return end -- Skip processed inputs
         if input.KeyCode == Enum.KeyCode.Space and infiniteJumpEnabled then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
         end
      end)

      -- Toggle Infinite Jump
      if not infiniteJumpEnabled then
         infiniteJumpEnabled = true
         print("Infinite Jump is now enabled!")
      else
         infiniteJumpEnabled = false
         print("Infinite Jump is now disabled!")
      end
   end,
})



local SliderValue = 10 


local Slider = Tab:CreateSlider({
   Name = "Speed",
   Range = {0, 500},
   Increment = 10,
   Suffix = "Speed",
   CurrentValue = SliderValue,
   Flag = "Speed",
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

local JumpPowerValue = 10 


local Slider = Tab:CreateSlider({
   Name = "Jump Power",
   Range = {0, 500},
   Increment = 10,
   Suffix = "Jump Power",
   CurrentValue = JumpPowerValue,
   Flag = "Jump power",
   Callback = function(Value)
       JumpPowerValue = Value 
   end,
})


local RunService = game:GetService("RunService")
RunService.Heartbeat:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChild("Humanoid")
    
    if humanoid then
        humanoid.UseJumpPower = true 
        humanoid.JumpPower = JumpPowerValue 
    end
end)





local Tab = Window:CreateTab("ESP", "rewind")



local Toggle = Tab:CreateToggle({
   Name = (game.PlaceId == 730951264 and "Show ESP | THE MAZE mode") or 
          (game.PlaceId == 5777099015 and "Show ESP | Cheese Escape Mode") or
          (game.PlaceId == 893973440 and "Show ESP | Flee the Facility Mode") or
          "Show ESP",
   CurrentValue = false, 
   Flag = "Toggle1", 
   Callback = function(Value)
      if Value then
        
         game:GetService("Players").PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function(character)
               if character and character:FindFirstChild("Head") then
                  local head = character.Head
                  local box = Instance.new("BillboardGui")
                  box.Parent = head
                  box.Adornee = head
                  box.Size = UDim2.new(0, 100, 0, 50)
                  box.StudsOffset = Vector3.new(0, 2, 0)
                  box.AlwaysOnTop = true

                  local label = Instance.new("TextLabel")
                  label.Parent = box
                  label.Size = UDim2.new(1, 0, 1, 0)
                  label.BackgroundTransparency = 1
                  label.Text = player.Name
                  label.TextColor3 = Color3.fromRGB(0, 255, 0) 
                  label.TextStrokeTransparency = 0.8
               end
            end)
         end)

        
         for _, player in pairs(game:GetService("Players"):GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Head") then
               local head = player.Character.Head
               local box = Instance.new("BillboardGui")
               box.Parent = head
               box.Adornee = head
               box.Size = UDim2.new(0, 100, 0, 50)
               box.StudsOffset = Vector3.new(0, 2, 0)
               box.AlwaysOnTop = true

               local label = Instance.new("TextLabel")
               label.Parent = box
               label.Size = UDim2.new(1, 0, 1, 0)
               label.BackgroundTransparency = 1
               label.Text = player.Name
               label.TextColor3 = Color3.fromRGB(0, 255, 0)
               label.TextStrokeTransparency = 0.8
            end
         end

         
         if game.PlaceId == 730951264 then
         
            local monsterNames = {"TheCajoler", "TheOrotund"}
            
            for _, monster in pairs(game.Workspace:GetChildren()) do
               if table.find(monsterNames, monster.Name) and monster:FindFirstChild("Head") then
                  local head = monster.Head
                  local box = Instance.new("BillboardGui")
                  box.Parent = head
                  box.Adornee = head
                  box.Size = UDim2.new(0, 100, 0, 50)
                  box.StudsOffset = Vector3.new(0, 2, 0)
                  box.AlwaysOnTop = true

                  local label = Instance.new("TextLabel")
                  label.Parent = box
                  label.Size = UDim2.new(1, 0, 1, 0)
                  label.BackgroundTransparency = 1
                  label.Text = monster.Name
                  label.TextColor3 = Color3.fromRGB(255, 0, 0) 
                  label.TextStrokeTransparency = 0.8
               end
            end
         elseif game.PlaceId == 5777099015 then
          
            local mouseModel = game.Workspace:FindFirstChild("Mouse")
            if mouseModel and mouseModel:FindFirstChild("Head") then
               local head = mouseModel.Head
               local box = Instance.new("BillboardGui")
               box.Parent = head
               box.Adornee = head
               box.Size = UDim2.new(0, 100, 0, 50)
               box.StudsOffset = Vector3.new(0, 2, 0)
               box.AlwaysOnTop = true

               local label = Instance.new("TextLabel")
               label.Parent = box
               label.Size = UDim2.new(1, 0, 1, 0)
               label.BackgroundTransparency = 1
               label.Text = mouseModel.Name
               label.TextColor3 = Color3.fromRGB(255, 0, 0)
               label.TextStrokeTransparency = 0.8
            end
         elseif game.PlaceId == 893973440 then
          
            local function checkComputers()
             
               for _, model in pairs(game.Workspace:GetChildren()) do
              
                  if model.Name == "Computer" then
                  
                     for _, child in pairs(model:GetChildren()) do
                      
                        if child:IsA("BasePart") then
                        
                           local block = Instance.new("Part")
                           block.Size = Vector3.new(4, 1, 4)
                           block.Position = model.Position + Vector3.new(0, 5, 0)
                           block.Anchored = true
                           block.Parent = model
                           
                           local label = Instance.new("TextLabel")
                           label.Parent = block
                           label.Size = UDim2.new(1, 0, 1, 0)
                           label.BackgroundTransparency = 1
                           label.Text = "Pc here"
                           label.TextColor3 = Color3.fromRGB(255, 255, 255)
                           label.TextStrokeTransparency = 0.5
                        end
                     end
                  end
               end
            end

       
            game:GetService("RunService").Heartbeat:Connect(function()
               checkComputers()
            end)
         end
      else
   
         for _, player in pairs(game:GetService("Players"):GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Head") then
               local head = player.Character.Head
               local espGui = head:FindFirstChildOfClass("BillboardGui")
               if espGui then
                  espGui:Destroy()
               end
            end
         end

         if game.PlaceId == 730951264 then
         
            local monsterNames = {"TheCajoler", "TheOrotund"}
            for _, monster in pairs(game.Workspace:GetChildren()) do
               if table.find(monsterNames, monster.Name) and monster:FindFirstChild("Head") then
                  local head = monster.Head
                  local espGui = head:FindFirstChildOfClass("BillboardGui")
                  if espGui then
                     espGui:Destroy()
                  end
               end
            end
         elseif game.PlaceId == 5777099015 then
           
            local mouseModel = game.Workspace:FindFirstChild("Mouse")
            if mouseModel and mouseModel:FindFirstChild("Head") then
               local head = mouseModel.Head
               local espGui = head:FindFirstChildOfClass("BillboardGui")
               if espGui then
                  espGui:Destroy()
               end
            end
         elseif game.PlaceId == 893973440 then
        
            for _, model in pairs(game.Workspace:GetChildren()) do
               if model.Name == "Computer" then
                  local block = model:FindFirstChildOfClass("Part")
                  if block then
                     block:Destroy()
                  end
               end
            end
         end
      end
   end,
})


local ESPOffButton = Tab:CreateButton({
   Name = "refesh esp",  
   Callback = function()
    
      
      Toggle:Set(false)
      Toggle:Set(true)   
   end,
})




local ESPOffButton = Tab:CreateButton({
   Name = "Turn Off ESP", 
   Callback = function()
     
      Toggle:Set(false) 
   end,
})






