local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/ezpoSword/Rayfield_Roblox/refs/heads/main/RayfieldMenuCode-No-tWorking'))()


wait(10)
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

local Label = Tab:CreateLabel("Home", 4483362458, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme




local Button = Tab:CreateButton({
   Name = "TP - CTRL & Click",
   Callback = function()
   -- LocalScript
local player = game.Players.LocalPlayer -- Yerel oyuncuyu al
local mouse = player:GetMouse() -- Mouse olaylarını almak için
local userInputService = game:GetService("UserInputService")
local character = player.Character or player.CharacterAdded:Wait() -- Oyuncunun karakteri
local humanoidRootPart = character:WaitForChild("HumanoidRootPart") -- Karakterin ana parçası

local isCtrlPressed = false -- Ctrl basılı mı değil mi kontrol etmek için

-- Ctrl tuşuna basıldığında çalışır
userInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
        isCtrlPressed = true
    end
end)

-- Ctrl tuşu bırakıldığında çalışır
userInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
        isCtrlPressed = false
    end
end)

-- Fare tıklama olayını dinle
mouse.Button1Down:Connect(function()
    if isCtrlPressed then
        if mouse.Hit then -- Fare bir yüzeye tıklıyorsa
            local targetPosition = mouse.Hit.Position -- Tıklanan pozisyonu al
            -- Karakteri hedef konuma ışınla
            humanoidRootPart.CFrame = CFrame.new(targetPosition + Vector3.new(0, 5, 0)) -- Karakteri hafif yukarı taşı
        end
    end
end)

   end,
})


local Button = Tab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local userInputService = game:GetService("UserInputService")

local canJumpInAir = false

humanoid.StateChanged:Connect(function(oldState, newState)
    if newState == Enum.HumanoidStateType.Freefall then
        canJumpInAir = true
    elseif newState == Enum.HumanoidStateType.Landed then
        canJumpInAir = false
    end
end)

userInputService.InputBegan:Connect(function(input, isProcessed)
    if isProcessed then return end
    if input.KeyCode == Enum.KeyCode.Space then
        if canJumpInAir then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

   end,
})



local Slider = Tab:CreateSlider({
   Name = "Speed", 
   Range = {0, 500}, 
   Increment = 10,
   Suffix = "Speed", 
   CurrentValue = 10,
   Flag = "Slider1",
   Callback = function(Value)
       -- Oyuncunun hızını ayarla
       local player = game.Players.LocalPlayer
       local character = player.Character or player.CharacterAdded:Wait()
       local humanoid = character:FindFirstChild("Humanoid")
       
       if humanoid then
           humanoid.WalkSpeed = Value -- Hızı slider değerine eşitle
       end
   end,
})



local Slider = Tab:CreateSlider({
   Name = "Jump Power", 
   Range = {0, 500}, 
   Increment = 10,
   Suffix = "Jump Power", 
   CurrentValue = 10,
   Flag = "Slider1",
   Callback = function(Value)
       local player = game.Players.LocalPlayer
       local character = player.Character or player.CharacterAdded:Wait()
       local humanoid = character:WaitForChild("Humanoid")
       
       if humanoid then
           humanoid.UseJumpPower = true -- JumpPower'ın etkin olduğundan emin ol
           humanoid.JumpPower = Value  -- Zıplama gücünü slider değerine ayarla
       end
   end,
})









local Tab = Window:CreateTab("teleport", "rewind")


local gameID = 730951264  -- Belirli oyun kimliği (ID)
local currentGameID = game.PlaceId  -- Şu anki oyun kimliği (ID)

-- Eğer oyun kimliği doğruysa, tüm seçenekler görünür; değilse sadece "Select teleport location" görünür
local options = {"Select teleport location"}

if currentGameID == gameID then
    -- Seçenekler yalnızca doğru oyun kimliği için gösterilir
    options = {"Piano", "Base", "Unknown Room", "Start", "Wood in Cave"}
end

local Dropdown = Tab:CreateDropdown({
   Name = "Teleport Options",  -- Dropdown adı
   Options = options,  -- Seçenekler
   CurrentOption = {"Select teleport location"},  -- Varsayılan seçenek
   MultipleOptions = false,  -- Tek seçenek seçilebilir
   Flag = "Dropdown1",  -- Konfigürasyon dosyası için flag
   Callback = function(Options)
       -- Seçilen seçenekler (Options)
       local selectedOption = Options[1]  -- Tek bir seçenek seçilecek, bu nedenle Options[1] alıyoruz

       if selectedOption == "Piano" then
           -- Piano seçeneği seçildiğinde oyuncuyu belirtilen koordinatlara ışınla
           local player = game.Players.LocalPlayer
           local character = player.Character

           if character then
               -- Karakterin HumanoidRootPart'ı varsa, ışınlama işlemini gerçekleştir
               local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
               if humanoidRootPart then
                   humanoidRootPart.CFrame = CFrame.new(-40, 15, -730)  -- Piano koordinatlarına ışınla
                   
                   -- Bildirim gönder
                   Rayfield:Notify({
                       Title = "Teleport Success",  -- Başlık
                       Content = "You have been teleported to the Piano.",  -- İçerik
                       Duration = 6.5,  -- Bildirimin gösterilme süresi
                       Image = "check",  -- İkon
                   })
               end
           end
       elseif selectedOption == "Base" then
           -- Base seçeneği seçildiğinde oyuncuyu Base koordinatlarına ışınla
           local player = game.Players.LocalPlayer
           local character = player.Character

           if character then
               -- Karakterin HumanoidRootPart'ı varsa, ışınlama işlemini gerçekleştir
               local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
               if humanoidRootPart then
                   humanoidRootPart.CFrame = CFrame.new(-199, 15, -143)  -- Base koordinatlarına ışınla
                   
                   -- Bildirim gönder
                   Rayfield:Notify({
                       Title = "Teleport Success",  -- Başlık
                       Content = "You have been teleported to the Base.",  -- İçerik
                       Duration = 6.5,  -- Bildirimin gösterilme süresi
                       Image = "check",  -- İkon
                   })
               end
           end
       elseif selectedOption == "Unknown Room" then
           -- Unknown Room seçeneği seçildiğinde oyuncuyu belirtilen koordinatlara ışınla
           local player = game.Players.LocalPlayer
           local character = player.Character

           if character then
               -- Karakterin HumanoidRootPart'ı varsa, ışınlama işlemini gerçekleştir
               local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
               if humanoidRootPart then
                   humanoidRootPart.CFrame = CFrame.new(76, 16, -223)  -- Unknown Room koordinatlarına ışınla
                   
                   -- Bildirim gönder
                   Rayfield:Notify({
                       Title = "Teleport Success",  -- Başlık
                       Content = "You have been teleported to the Unknown Room.",  -- İçerik
                       Duration = 6.5,  -- Bildirimin gösterilme süresi
                       Image = "check",  -- İkon
                   })
               end
           end
       elseif selectedOption == "Start" then
           -- Start seçeneği seçildiğinde oyuncuyu Start koordinatlarına ışınla
           local player = game.Players.LocalPlayer
           local character = player.Character

           if character then
               -- Karakterin HumanoidRootPart'ı varsa, ışınlama işlemini gerçekleştir
               local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
               if humanoidRootPart then
                   humanoidRootPart.CFrame = CFrame.new(-235, -47, 36)  -- Yeni Start koordinatlarına ışınla
                   
                   -- Bildirim gönder
                   Rayfield:Notify({
                       Title = "Teleport Success",  -- Başlık
                       Content = "You have been teleported to the Start location.",  -- İçerik
                       Duration = 6.5,  -- Bildirimin gösterilme süresi
                       Image = "check",  -- İkon
                   })
               end
           end
       elseif selectedOption == "Wood in Cave" then
           -- Mağaradaki Odunlar seçeneği seçildiğinde oyuncuyu belirtilen koordinatlara ışınla
           local player = game.Players.LocalPlayer
           local character = player.Character

           if character then
               -- Karakterin HumanoidRootPart'ı varsa, ışınlama işlemini gerçekleştir
               local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
               if humanoidRootPart then
                   humanoidRootPart.CFrame = CFrame.new(191, -89, -226)  -- Mağaradaki Odunlar koordinatlarına ışınla
                   
                   -- Bildirim gönder
                   Rayfield:Notify({
                       Title = "Teleport Success",  -- Başlık
                       Content = "You have been teleported to the Wood in Cave.",  -- İçerik
                       Duration = 6.5,  -- Bildirimin gösterilme süresi
                       Image = "check",  -- İkon
                   })
               end
           end
       elseif selectedOption == "Select teleport location" then
           -- "Select teleport location" seçeneği seçildiğinde Rayfield bildirimi göster
           Rayfield:Notify({
               Title = "Teleport Info",  -- Başlık
               Content = "Please select the teleport location.",  -- İçerik
               Duration = 6.5,  -- Bildirimin gösterilme süresi
               Image = "rewind",  -- İkon
           })
       end
   end,
})




local Tab = Window:CreateTab("ESP", "rewind")

-- Toggle oluşturma
-- Toggle oluşturma
local Toggle = Tab:CreateToggle({
   Name = game.PlaceId == 730951264 and "Show ESP | THE MAZE mode" or "Show ESP",  -- Oyun ID'sine göre toggle adı değişir
   CurrentValue = false,  -- Başlangıçta toggle kapalı
   Flag = "Toggle1", -- Konfigürasyon için flag
   Callback = function(Value)
      -- Toggle açıldığında veya kapandığında ESP'yi göster ya da gizle
      if Value then
         -- ESP'yi aç
         game:GetService("Players").PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function(character)
               if character and character:FindFirstChild("Head") then
                  -- ESP kutusunu oluştur
                  local head = character.Head
                  local box = Instance.new("BillboardGui")
                  box.Parent = head
                  box.Adornee = head
                  box.Size = UDim2.new(0, 100, 0, 50)  -- Kutu boyutu
                  box.StudsOffset = Vector3.new(0, 2, 0)  -- Kutu yukarıya doğru offset
                  box.AlwaysOnTop = true  -- Kutu her zaman üstte görünsün

                  -- İsim etiketini ekle
                  local label = Instance.new("TextLabel")
                  label.Parent = box
                  label.Size = UDim2.new(1, 0, 1, 0)
                  label.BackgroundTransparency = 1  -- Arka planı şeffaf yap
                  label.Text = player.Name  -- Oyuncunun ismi
                  label.TextColor3 = Color3.fromRGB(0, 255, 0)  -- İsim rengi
                  label.TextStrokeTransparency = 0.8  -- Metnin etrafında bir çizgi
               end
            end)
         end)
         
         -- Mevcut oyuncuların ESP'sini de ekle
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

         -- Eğer oyun THE MAZE modunda ise, sadece 'TheCajoler' ve 'TheOrotund' canavarlarına ESP ekle
         if game.PlaceId == 730951264 then
            -- Canavar isimleri
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
                  label.Text = monster.Name  -- Canavarın ismi
                  label.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Canavar ismi rengi (kırmızı)
                  label.TextStrokeTransparency = 0.8
               end
            end
         end
      else
         -- Toggle kapalıysa, ESP'yi kaldır
         for _, player in pairs(game:GetService("Players"):GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Head") then
               local head = player.Character.Head
               local espGui = head:FindFirstChildOfClass("BillboardGui")
               if espGui then
                  espGui:Destroy()  -- ESP'yi kaldır
               end
            end
         end
         
         -- TheCajoler ve TheOrotund canavarı ESP'sini kaldır
         if game.PlaceId == 730951264 then
            for _, monster in pairs(game.Workspace:GetChildren()) do
               if table.find({"TheCajoler", "TheOrotund"}, monster.Name) and monster:FindFirstChild("Head") then
                  local head = monster.Head
                  local espGui = head:FindFirstChildOfClass("BillboardGui")
                  if espGui then
                     espGui:Destroy()  -- Canavar ESP'yi kaldır
                  end
               end
            end
         end
      end
   end,
})




local ESPOffButton = Tab:CreateButton({
   Name = "refesh esp",  -- Buton adı
   Callback = function()
      -- Toggle'ı kapatarak ESP'yi kapat
      
      Toggle:Set(false)
      Toggle:Set(true)   -- Toggle'ı kapatır, ESP'yi kapatır
   end,
})




local ESPOffButton = Tab:CreateButton({
   Name = "Turn Off ESP",  -- Buton adı
   Callback = function()
      -- Toggle'ı kapatarak ESP'yi kapat
      Toggle:Set(false)  -- Toggle'ı kapatır, ESP'yi kapatır
   end,
})







local Tab = Window:CreateTab("setting", "rewind")


local Slider = Tab:CreateSlider({
   Name = "FOV Adjuster",  -- Slider için başlık
   Range = {70, 120},      -- FOV değeri 70 ile 120 arasında olmalı
   Increment = 1,          -- FOV değeri 1'er birim artacak
   Suffix = "FOV",         -- FOV olarak gösterecek
   CurrentValue = 70,      -- Başlangıç değeri 70
   Flag = "SliderFOV",     -- Konfigürasyon dosyasında ayarları kaydetmek için flag
   Callback = function(Value)
      -- Slider değeri her değiştiğinde çalışacak kod
      local player = game.Players.LocalPlayer
      local camera = game.Workspace.CurrentCamera

      -- Slider değeriyle FOV'yi güncelle
      camera.FieldOfView = Value
   end,
})




local lighting = game:GetService("Lighting")

-- Orijinal ayarları kaydediyoruz
local originalBrightness = lighting.Brightness
local originalAmbient = lighting.Ambient
local originalOutdoorAmbient = lighting.OutdoorAmbient
local originalGlobalShadows = lighting.GlobalShadows
local originalFogColor = lighting.FogColor
local originalFogStart = lighting.FogStart
local originalFogEnd = lighting.FogEnd

-- Fullbright etkisini sağla
local function applyFullbright()
    lighting.GlobalShadows = false  -- Gölgeyi kaldır
    lighting.Ambient = Color3.fromRGB(255, 255, 255)  -- Her şeyi aydınlatacak ortam ışığı
    lighting.Brightness = 3  -- Işık parlaklığını arttır

    -- Diğer ayarlar (opsiyonel)
    lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)  -- Dış ortamı aydınlat
    lighting.FogColor = Color3.fromRGB(255, 255, 255)  -- Sis rengini değiştirebiliriz
    lighting.FogStart = 0  -- Sisin başlaması
    lighting.FogEnd = 1000  -- Sisin bitmesi
end

-- Orijinal ayarlara geri dönme
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
   Name = "Fullbright Toggle",   -- Toggle için başlık
   CurrentValue = false,         -- Başlangıçta toggle kapalı
   Flag = "Fullbright",          -- Konfigürasyon dosyasında ayarları kaydetmek için flag
   Callback = function(Value)
      if Value then
         -- Toggle açıldığında fullbright ve gölge kaldırma
         applyFullbright()
      else
         -- Toggle kapandığında orijinal ışık ayarlarına geri dön
         resetLighting()
      end
   end,
})


local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

-- Tab ve buton oluşturma kısmı
local Button = Tab:CreateButton({
    Name = "Show Coordinates",  -- Buton adı
    Callback = function()
        -- Butona her tıklandığında çalışacak işlem
        print("Button was pressed!")

        -- Ekranda koordinatları göstermek için ScreenGui oluştur
        local player = Players.LocalPlayer
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local position = character.HumanoidRootPart.Position
            local x, y, z = position.X, position.Y, position.Z
            local message = "Current Coordinates: X = " .. x .. ", Y = " .. y .. ", Z = " .. z

            -- ScreenGui oluştur
            local screenGui = Instance.new("ScreenGui")
            screenGui.Parent = player.PlayerGui

            -- TextLabel oluştur
            local coordinateLabel = Instance.new("TextLabel")
            coordinateLabel.Size = UDim2.new(0, 300, 0, 50)
            coordinateLabel.Position = UDim2.new(0.5, -150, 0.5, -25)  -- Ekranın ortasına yerleştir
            coordinateLabel.Text = message
            coordinateLabel.TextSize = 20
            coordinateLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Beyaz renk
            coordinateLabel.BackgroundTransparency = 1  -- Arka planı şeffaf yap
            coordinateLabel.Parent = screenGui

            -- 5 saniye sonra koordinatları gizle
            wait(5)
            screenGui:Destroy()  -- ScreenGui'yi sil, böylece label kaybolur
        else
            print("Karakter bulunamadı.")
        end
    end,
})


