local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/ezpoSword/Rayfield_Roblox/refs/heads/main/RayfieldMenuCode-No-tWorking'))()

local targetGameId = 893973440  

local kickPlayerEvent = game.ReplicatedStorage:FindFirstChild("KickPlayer")
if not kickPlayerEvent then
    kickPlayerEvent = Instance.new("RemoteEvent")
    kickPlayerEvent.Name = "KickPlayer"
    kickPlayerEvent.Parent = game.ReplicatedStorage
end

kickPlayerEvent.OnServerEvent:Connect(function()
    
    if game.PlaceId == targetGameId then
        script:Destroy()  
        return  
    end

   
end)






Rayfield:Notify({
   Title = "Loading...",
   Content = "Loading [10 Second]",
   Duration = 6.5,
   Image = "rewind",
})

Wait("10")

Rayfield:Notify({
   Title = "thanks",
   Content = "I hope you like it, we worked hard :) have a nice day",
   Duration = 6.5,
   Image = "rewind",
})



local gameId = game.PlaceId


local windowName = "FGFS | Game"

if gameId == 730951264 then
    windowName = "FGFS | The Maze"
elseif gameId == 5777099015 then
    windowName = "FGFS | Cheese Escape"
elseif gameId == 893973440 then
    windowName = "FGFS | Flee the Facility Mode"
end



local Window = Rayfield:CreateWindow({
   Name = windowName,
   Icon = 90958188574067,
   LoadingTitle = "FGFS | loading",
   LoadingSubtitle = "by FGFS - [owner:Ezpo]",
   Theme = "Default",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = true,
      Invite = "discord.gg/3bPwmSyAAX",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "FGFS | Key system",
      Subtitle = "Key System",
      Note = "i like dark.",
      FileName = "FGFSKey",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = {"ilikedark"}
   }
})

Rayfield:Notify({
   Title = "welcome",
   Content = "Cheat Loaded and welcome",
   Duration = 6.5,
   Image = "rewind",
})

local Tab = Window:CreateTab("Home", "Home")






local Button = Tab:CreateButton({
   Name = "TP - CTRL & Click",
   Callback = function()
   -- LocalScript
local player = game.Players.LocalPlayer 
local mouse = player:GetMouse() 
local userInputService = game:GetService("UserInputService")
local character = player.Character or player.CharacterAdded:Wait() 
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local isCtrlPressed = false


userInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
        isCtrlPressed = true
    end
end)


userInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
        isCtrlPressed = false
    end
end)


mouse.Button1Down:Connect(function()
    if isCtrlPressed then
        if mouse.Hit then 
            local targetPosition = mouse.Hit.Position 
           
            humanoidRootPart.CFrame = CFrame.new(targetPosition + Vector3.new(0, 5, 0)) 
        end
    end
end)

   end,
})






local SliderValue = 10 


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

local JumpPowerValue = 10 


local Slider = Tab:CreateSlider({
   Name = "Jump Power",
   Range = {0, 500},
   Increment = 10,
   Suffix = "Jump Power",
   CurrentValue = JumpPowerValue,
   Flag = "Slider2",
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









local Tab = Window:CreateTab("teleport", "rewind")


local gameID = 730951264  
local currentGameID = game.PlaceId  


local options = {"Select teleport location"}

if currentGameID == gameID then

    options = {"Piano", "Base", "Unknown Room", "Start", "Wood in Cave"}
end

local Dropdown = Tab:CreateDropdown({
   Name = "Teleport Options", 
   Options = options,  
   CurrentOption = {"Select teleport location"}, 
   MultipleOptions = false, 
   Flag = "Dropdown1", 
   Callback = function(Options)
     
       local selectedOption = Options[1] 

       if selectedOption == "Piano" then
          
           local player = game.Players.LocalPlayer
           local character = player.Character

           if character then
              
               local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
               if humanoidRootPart then
                   humanoidRootPart.CFrame = CFrame.new(-40, 15, -730) 
                   
                 
                   Rayfield:Notify({
                       Title = "Teleport Success",  
                       Content = "You have been teleported to the Piano.", 
                       Duration = 6.5,  
                       Image = "check", 
                   })
               end
           end
       elseif selectedOption == "Base" then
          
           local player = game.Players.LocalPlayer
           local character = player.Character

           if character then
             
               local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
               if humanoidRootPart then
                   humanoidRootPart.CFrame = CFrame.new(-199, 15, -143) 
                   
                  
                   Rayfield:Notify({
                       Title = "Teleport Success", 
                       Content = "You have been teleported to the Base.", 
                       Duration = 6.5, 
                       Image = "check", 
                   })
               end
           end
       elseif selectedOption == "Unknown Room" then
          
           local player = game.Players.LocalPlayer
           local character = player.Character

           if character then
             
               local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
               if humanoidRootPart then
                   humanoidRootPart.CFrame = CFrame.new(76, 16, -223) 
                   
                 
                   Rayfield:Notify({
                       Title = "Teleport Success",  
                       Content = "You have been teleported to the Unknown Room.",  
                       Duration = 6.5, 
                       Image = "check",
                   })
               end
           end
       elseif selectedOption == "Start" then
         
           local player = game.Players.LocalPlayer
           local character = player.Character

           if character then
            
               local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
               if humanoidRootPart then
                   humanoidRootPart.CFrame = CFrame.new(-235, -47, 36) 
                   
                  
                   Rayfield:Notify({
                       Title = "Teleport Success", 
                       Content = "You have been teleported to the Start location.",
                       Duration = 6.5, 
                       Image = "check", 
                   })
               end
           end
       elseif selectedOption == "Wood in Cave" then
         
           local player = game.Players.LocalPlayer
           local character = player.Character

           if character then
              
               local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
               if humanoidRootPart then
                   humanoidRootPart.CFrame = CFrame.new(191, -89, -226)  
                   
                 
                   Rayfield:Notify({
                       Title = "Teleport Success",  
                       Content = "You have been teleported to the Wood in Cave.",
                       Duration = 6.5, 
                       Image = "check", 
                   })
               end
           end
       elseif selectedOption == "Select teleport location" then
         
           Rayfield:Notify({
               Title = "Teleport Info",  
               Content = "Please select the teleport location.",  
               Duration = 6.5, 
               Image = "rewind", 
           })
       end
   end,
})




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







local Tab = Window:CreateTab("setting", "rewind")


local Slider = Tab:CreateSlider({
   Name = "FOV Adjuster",  
   Range = {70, 120},     
   Increment = 1,         
   Suffix = "FOV",        
   CurrentValue = 70,    
   Flag = "SliderFOV",    
   Callback = function(Value)
    
      local player = game.Players.LocalPlayer
      local camera = game.Workspace.CurrentCamera

    
      camera.FieldOfView = Value
   end,
})




local lighting = game:GetService("Lighting")


local originalBrightness = lighting.Brightness
local originalAmbient = lighting.Ambient
local originalOutdoorAmbient = lighting.OutdoorAmbient
local originalGlobalShadows = lighting.GlobalShadows
local originalFogColor = lighting.FogColor
local originalFogStart = lighting.FogStart
local originalFogEnd = lighting.FogEnd

local function applyFullbright()
    lighting.GlobalShadows = false 
    lighting.Ambient = Color3.fromRGB(255, 255, 255)  
    lighting.Brightness = 3 

   
    lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)  
    lighting.FogColor = Color3.fromRGB(255, 255, 255) 
    lighting.FogStart = 0  
    lighting.FogEnd = 1000  
end


local function resetLighting()
    lighting.Brightness = originalBrightness
    lighting.Ambient = originalAmbient
    lighting.OutdoorAmbient = originalOutdoorAmbient
    lighting.GlobalShadows = originalGlobalShadows
    lighting.FogColor = originalFogColor
    lighting.FogStart = originalFogStart
    lighting.FogEnd = originalFogEnd
end

local Toggle = Tab:CreateToggle({
   Name = "Fullbright Toggle",  
   CurrentValue = false,        
   Flag = "Fullbright",         
   Callback = function(Value)
      if Value then
   
         applyFullbright()
      else
     
         resetLighting()
      end
   end,
})


local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")


local Button = Tab:CreateButton({
    Name = "Show Coordinates",  
    Callback = function()
        
        print("Button was pressed!")

       
        local player = Players.LocalPlayer
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local position = character.HumanoidRootPart.Position
            local x, y, z = position.X, position.Y, position.Z
            local message = "Current Coordinates: X = " .. x .. ", Y = " .. y .. ", Z = " .. z

           
            local screenGui = Instance.new("ScreenGui")
            screenGui.Parent = player.PlayerGui

           
            local coordinateLabel = Instance.new("TextLabel")
            coordinateLabel.Size = UDim2.new(0, 300, 0, 50)
            coordinateLabel.Position = UDim2.new(0.5, -150, 0.5, -25) 
            coordinateLabel.Text = message
            coordinateLabel.TextSize = 20
            coordinateLabel.TextColor3 = Color3.fromRGB(255, 255, 255) 
            coordinateLabel.BackgroundTransparency = 1 
            coordinateLabel.Parent = screenGui

           
            wait(5)
            screenGui:Destroy()  
        else
            print("Karakter bulunamadı.")
        end
    end,
})



