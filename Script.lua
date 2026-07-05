local adminNames = {
‎    ["FOPLORTE11"] = true
‎}
‎
‎
‎if isAdmin then
‎    -- Создаем отдельную вкладку во Fluent, которую увидят ТОЛЬКО админы
‎    local AdminTab = Window:NewTab({
‎        Title = "Админ Панель 🛡️",
‎        Icon = "shield" -- Или любая другая иконка из Lucide (у Fluent они встроенные)
‎    })
‎    
‎    AdminTab:AddParagraph({
‎        Title = "Панель Создателя",
‎        Content = "Добро пожаловать, " .. LocalPlayer.Name .. "!\nЗдесь ты можешь управлять нарушителями."
‎    })
‎    
‎    -- Сюда потом можно добавить Input для ввода ID или кнопки
‎    AdminTab:AddInput("BanInput", {
‎        Title = "ID читера для бана",
‎        Description = "Введите UserId игрока для добавления в бан-лист",
‎        Default = "",
‎        Placeholder = "Например: 12345678",
‎        Numeric = true, -- Разрешить только цифры
‎        Finished = true,
‎        Callback = function(Value)
‎            print("Вы ввели ID для бана: " .. Value)
‎            -- Напоминание: заносить в banlist.json на гитхабе всё равно придется вручную через сайт/приложение GitHub
‎        end
‎    })
‎end
‎
‎
‎
‎local SkyDropdown = Tabs.Visuals:AddDropdown("SkyboxDropdown", {
‎    Title = "Выбор Неба 🌌",
‎    Values = {"Оригинальное", "Космос 🌌", "Фиолетовая Галактика ☄️"},
‎    CurrentValue = "Оригинальное",
‎    Callback = function(Value)
‎        changeSkybox(Value) -- Вот так во Fluent передается выбранное значение!
‎    end
‎})
‎
‎SkyDropdown:SetValue("Оригинальное")
‎
‎
‎if isAdmin then
‎    -- Создаем отдельную вкладку во Fluent, которую увидят ТОЛЬКО админы
‎    local AdminTab = Window:NewTab({
‎        Title = "Админ Панель 🛡️",
‎        Icon = "shield" -- Или любая другая иконка из Lucide (у Fluent они встроенные)
‎    })
‎    
‎    AdminTab:AddParagraph({
‎        Title = "Панель Создателя",
‎        Content = "Добро пожаловать, " .. LocalPlayer.Name .. "!\nЗдесь ты можешь управлять нарушителями."
‎    })
‎    
‎    -- Сюда потом можно добавить Input для ввода ID или кнопки
‎    AdminTab:AddInput("BanInput", {
‎        Title = "ID читера для бана",
‎        Description = "Введите UserId игрока для добавления в бан-лист",
‎        Default = "",
‎        Placeholder = "Например: 12345678",
‎        Numeric = true, -- Разрешить только цифры
‎        Finished = true,
‎        Callback = function(Value)
‎            print("Вы ввели ID для бана: " .. Value)
‎            -- Напоминание: заносить в banlist.json на гитхабе всё равно придется вручную через сайт/приложение GitHub
‎        end
‎    })
‎end
‎

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "LGmn 0.1 ",
    SubTitle = "by TANCHYAZmm2Koroleva",
    TabWidth = 160,
    Size = UDim2.fromOffset(550, 340),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    But = Window:AddTab({ Title = "Bindable Buttons", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "This is a notification",
        SubContent = "SubContent", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })



    Tabs.Main:AddParagraph({
        Title = "by FOPLORTE11/TANCHYAZmm2Koroleva",
        Content = "Good Luck."
    })

    local bool = Instance.new("BoolValue")
    bool.Parent = workspace

    local rand = math.random(1,100)
    print(rand)

    bool.Name = "n" .. rand
    bool.Value = false

    local blo = Instance.new("StringValue")
    blo.Parent = workspace

    local rando = math.random(1,100)
    print(rando)

    blo.Name = "s" .. rand
    blo.Value = 1.7


local Input = Tabs.Main:AddInput("Input", {
        Title = "bhop delay",
        Default = "1.7",
        Placeholder = "Bhop Delay",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)

        end
    })

    Input:OnChanged(function()
        blo.Value = Input.Value
        print(blo.Value)
    end)

Tabs.Main:AddButton({
        Title = "3person",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "",
                Content = "",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
local Player = game:GetService("Players").LocalPlayer

-- 1. Разблокируем камеру от третьего лица
Player.CameraMinZoomDistance = 5
Player.CameraMaxZoomDistance = 30
Player.CameraMode = Enum.CameraMode.Classic
if workspace.CurrentCamera then
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
end

-- 2. Функция для очистки головы и аксессуаров
local function cleanCharacter(character)
    if not character then return end
    
    -- Ждем загрузки головы
    local head = character:WaitForChild("Head", 5)
    if head then
        head.Transparency = 1 -- Делаем голову невидимой
        -- Удаляем лицо (декаль) с головы, если оно есть
        local face = head:FindFirstChildOfClass("Decal")
        if face then face:Destroy() end
    end

    -- Удаляем все аксессуары (волосы, шляпы, одежду на теле)
    for _, item in ipairs(character:GetChildren()) do
        if item:IsA("Accessory") then
            item:Destroy()
        end
    end
end

-- Применяем скрипт сейчас и при каждом новом спавне персонажа
if Player.Character then
    cleanCharacter(Player.Character)
end
Player.CharacterAdded:Connect(cleanCharacter)

print("Камера отдалена, голова и аксессуары успешно убраны!")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.But:AddButton({
        Title = "3 person camera",
        Description = " ",
        Callback = function()
            Window:Dialog({
                Title = " ",
                Content = " ",
                Buttons = {
                    {
                        Title = "on",
                        Callback = function()
                                local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 1. СОЗДАНИЕ ИНТЕРФЕЙСА В НАЦИОНАЛЬНОМ СТИЛЕ ROBLOX
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MovableButtonUI"
ScreenGui.ResetOnSpawn = false
-- Пытаемся поместить в CoreGui (чтобы не пропадала при смерти), если эксплойт не поддерживает — в PlayerGui
ScreenGui.Parent = game:GetService("CoreGui") or playerGui

local DragButton = Instance.new("ImageButton")
DragButton.Size = UDim2.new(0, 70, 0, 70)
DragButton.Position = UDim2.new(0.5, -35, 0.5, -35) -- По центру по умолчанию
DragButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DragButton.BackgroundTransparency = 0.5
DragButton.Image = "rbxassetid://10850257322" -- Родная круглая форма Roblox
DragButton.Parent = ScreenGui

local ButtonText = Instance.new("TextLabel")
ButtonText.Size = UDim2.new(1, 0, 1, 0)
ButtonText.BackgroundTransparency = 1
ButtonText.Text = "3 camera"
ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonText.Font = Enum.Font.GothamBold
ButtonText.TextSize = 12
ButtonText.Parent = DragButton

DragButton.MouseButton1Click:Connect(function() 
      if not hasMoved then 
          local Player = game:GetService("Players").LocalPlayer

-- 1. Разблокируем камеру от третьего лица
Player.CameraMinZoomDistance = 5
Player.CameraMaxZoomDistance = 30
Player.CameraMode = Enum.CameraMode.Classic
if workspace.CurrentCamera then
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
end

-- 2. Функция для очистки головы и аксессуаров
local function cleanCharacter(character)
    if not character then return end
    
    -- Ждем загрузки головы
    local head = character:WaitForChild("Head", 5)
    if head then
        head.Transparency = 1 -- Делаем голову невидимой
        -- Удаляем лицо (декаль) с головы, если оно есть
        local face = head:FindFirstChildOfClass("Decal")
        if face then face:Destroy() end
    end

    -- Удаляем все аксессуары (волосы, шляпы, одежду на теле)
    for _, item in ipairs(character:GetChildren()) do
        if item:IsA("Accessory") then
            item:Destroy()
        end
    end
end

-- Применяем скрипт сейчас и при каждом новом спавне персонажа
if Player.Character then
    cleanCharacter(Player.Character)
end
Player.CharacterAdded:Connect(cleanCharacter)

print("Камера отдалена, голова и аксессуары успешно убраны!")
      end
 end)

-- 2. ЛОГИКА ПЛАВНОГО ПЕРЕТАСКИВАНИЯ ПАЛЬЦЕМ / МЫШЬЮ
local dragging = false
local dragStart = Vector3.new()
local startPos = UDim2.new()

DragButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = DragButton.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        DragButton.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X, 
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "esp",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "",
                Content = "",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

local ESP_Objects = {}

local function CreateESP(Player)
    if Player == LocalPlayer then return end

    -- Создаем аккуратную рамку
    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.fromRGB(255, 50, 50) -- Красивый красный цвет
    Box.Thickness = 1.5
    Box.Filled = false

    -- Настраиваем красивый моноширинный шрифт для ников
    local NameLabel = Drawing.new("Text")
    NameLabel.Visible = false
    NameLabel.Color = Color3.fromRGB(255, 255, 255)
    NameLabel.Size = 14
    NameLabel.Center = true
    NameLabel.Outline = true
    NameLabel.Font = Drawing.Fonts.Monospace

    -- Настраиваем шрифт для индикатора здоровья
    local InfoLabel = Drawing.new("Text")
    InfoLabel.Visible = false
    InfoLabel.Color = Color3.fromRGB(0, 255, 120)
    InfoLabel.Size = 13
    InfoLabel.Center = true
    InfoLabel.Outline = true
    InfoLabel.Font = Drawing.Fonts.Monospace

    ESP_Objects[Player] = {Box = Box, NameLabel = NameLabel, InfoLabel = InfoLabel}

    local Connection
    Connection = RunService.RenderStepped:Connect(function()
        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChildOfClass("Humanoid") then
            local Hum = Player.Character:FindFirstChildOfClass("Humanoid")
            local Root = Player.Character.HumanoidRootPart
            
            if Hum.Health > 0 then
                -- Вычисляем координаты макушки и стоп персонажа для точных рамок
                local TopPos, TopOnScreen = Camera:WorldToViewportPoint(Root.Position + Vector3.new(0, 2.8, 0))
                local BottomPos, BottomOnScreen = Camera:WorldToViewportPoint(Root.Position + Vector3.new(0, -3.2, 0))
                
                if TopOnScreen and BottomOnScreen then
                    -- Рассчитываем идеальную высоту и ширину бокса без лишнего места
                    local BoxHeight = math.abs(TopPos.Y - BottomPos.Y)
                    local BoxWidth = BoxHeight * 0.55
                    
                    -- Устанавливаем точную позицию рамки
                    Box.Size = Vector2.new(BoxWidth, BoxHeight)
                    Box.Position = Vector2.new(TopPos.X - BoxWidth / 2, TopPos.Y)
                    Box.Visible = true

                    -- Ник игрока аккуратно сверху рамки
                    NameLabel.Text = Player.Name
                    NameLabel.Position = Vector2.new(TopPos.X, TopPos.Y - 16)
                    NameLabel.Visible = true

                    -- Инфо-строка снизу с красивым символом сердечка и дистанцией
                    local Distance = (Camera.CFrame.Position - Root.Position).Magnitude
                    InfoLabel.Text = string.format("♥ %d | %dm", math.floor(Hum.Health), math.floor(Distance))
                    InfoLabel.Position = Vector2.new(TopPos.X, BottomPos.Y + 4)
                    InfoLabel.Visible = true
                    
                    -- Если у врага мало здоровья, цвет сердечка и текста станет тревожно-красным
                    if Hum.Health < 35 then
                        InfoLabel.Color = Color3.fromRGB(255, 60, 60)
                    else
                        InfoLabel.Color = Color3.fromRGB(0, 255, 120)
                    end
                    return
                end
            end
        end
        
        -- Автоматически скрываем элементы, если цель за экраном или мертва
        Box.Visible = false
        NameLabel.Visible = false
        InfoLabel.Visible = false

        if not Players:FindFirstChild(Player.Name) then
            Box:Remove()
            NameLabel:Remove()
            InfoLabel:Remove()
            ESP_Objects[Player] = nil
            Connection:Disconnect()
        end
    end)
end

-- Инициализация для всех текущих и заходящих игроков
for _, v in ipairs(Players:GetPlayers()) do
    CreateESP(v)
end
Players.PlayerAdded:Connect(CreateESP)

print("Красивый Box ESP с сердечками успешно обновлен!")


                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })



    Tabs.Main:AddButton({
        Title = "Bhop",
        Description = " ",
        Callback = function()
            Window:Dialog({
                Title = " ",
                Content = " ",
                Buttons = {
                    {
                        Title = "on/off",
                        Callback = function()
                                local character =    workspace:WaitForChild(game.Players.LocalPlayer.Name)
                                local humanoid = character:WaitForChild("Humanoid")
                                local bool = workspace:WaitForChild("n" .. rand)
                                wait(0.5)

                                bool.Value = not bool.Value
                                while wait(blo.Value) do
                                        if bool.Value == true then
                                              task.wait(0.2)
                                              humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                                        end
                                end
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

 Tabs.Main:AddButton({
        Title = "Aimbot",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "",
                Content = "",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
  
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ContextActionService = game:GetService("ContextActionService")

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera

-- НАСТРОЙКИ УЛЬТРА-ЛЕГИТА
local maxDistance = 600        -- Радиус работы Аимбота
local targetPart = "Head"      -- Часть тела для наведения
local smoothStrength = 12      -- ИСПРАВЛЕНО: Чем больше цифра, тем медленнее и человечнее доводка (12 — очень плавно)
local fireDelay = 0.05         -- ЗАДЕРЖКА: 50 мс между выстрелами

-- СОСТОЯНИЯ
local isFiring = false
local espData = {}

-- 1. ОЧИСТКА ESP ПРИ ВЫХОДЕ ИГРОКОВ
local function clearESP()
    for _, highlight in pairs(espData) do
        if highlight then highlight:Destroy() end
    end
    table.clear(espData)
end

Players.PlayerRemoving:Connect(function(op)
    if espData[op] then 
        espData[op]:Destroy() 
        espData[op] = nil 
    end
end)

-- 2. ОБНОВЛЕНИЕ ЦВЕТОВ HIGHLIGHT
local function updateESP()
    for _, op in pairs(Players:GetPlayers()) do
        if op ~= player and op.Character then
            local char = op.Character
            local head = char:FindFirstChild(targetPart)
            local hum = char:FindFirstChildOfClass("Humanoid")
            
            if head and hum and hum.Health > 0 then
                local highlight = espData[op]
                if not highlight or not highlight.Parent then
                    highlight = Instance.new("Highlight")
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0
                    highlight.Parent = char
                    espData[op] = highlight
                end
                
                -- Рэйкаст-проверка препятствий
                local params = RaycastParams.new()
                params.FilterType = Enum.RaycastFilterType.Exclude
                params.FilterDescendantsInstances = {player.Character, char}
                local dist = (head.Position - camera.CFrame.Position).Magnitude
                local ray = Workspace:Raycast(camera.CFrame.Position, (head.Position - camera.CFrame.Position).Unit * dist, params)
                
                if ray then
                    -- Игрок за преградой: Красный силуэт
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.FillColor = Color3.fromRGB(255, 50, 50)
                    highlight.OutlineColor = Color3.fromRGB(255, 50, 50)
                else
                    -- Игрок открыт: Синий силуэт
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.FillColor = Color3.fromRGB(0, 150, 255)
                    highlight.OutlineColor = Color3.fromRGB(0, 150, 255)
                end
                highlight.Enabled = true
            else
                if espData[op] then espData[op].Enabled = false end
            end
        else
            if espData[op] then espData[op].Enabled = false end
        end
    end
end

-- 3. ПОИСК БЛИЖАЙШЕЙ ЦЕЛИ
local function getClosestEnemy()
    local nearest = nil
    local shortestDistance = math.huge
    
    for _, op in pairs(Players:GetPlayers()) do
        if op ~= player and op.Character and op.Character:FindFirstChild(targetPart) then
            local char = op.Character
            local head = char:FindFirstChild(targetPart)
            local hum = char:FindFirstChildOfClass("Humanoid")
            
            if hum and hum.Health > 0 then
                local dist = (head.Position - camera.CFrame.Position).Magnitude
                if dist <= maxDistance then
                    local params = RaycastParams.new()
                    params.FilterType = Enum.RaycastFilterType.Exclude
                    params.FilterDescendantsInstances = {player.Character, char}
                    local ray = Workspace:Raycast(camera.CFrame.Position, (head.Position - camera.CFrame.Position).Unit * dist, params)
                    
                    -- Наводимся только на тех, кто не за стеной (синие силуэты)
                    if not ray then
                        if dist < shortestDistance then 
                            nearest = head
                            shortestDistance = dist 
                        end
                    end
                end
            end
        end
    end
    return nearest
end

-- 4. ИМИТАЦИЯ НАЖАТИЙ ЧЕЛОВЕКА ЧЕРЕЗ CONTEXTACTIONSERVICE
task.spawn(function()
    while true do
        task.wait(fireDelay)
        if isFiring then
            pcall(function()
                ContextActionService:CallFunction("RbxMouseOneDown", Enum.UserInputState.Begin, game:GetService("UserInputService"):GetMouseButtonsPressed())
                task.wait(0.01)
                ContextActionService:CallFunction("RbxMouseOneDown", Enum.UserInputState.End, game:GetService("UserInputService"):GetMouseButtonsPressed())
            end)
        end
    end
end)

-- 5. ЕДИНЫЙ ЦИКЛ ЗАМЕДЛЕННОЙ ДОВОДКИ КАМЕРЫ И ОБНОВЛЕНИЯ ESP
RunService.RenderStepped:Connect(function()
    updateESP()
    
    local enemyHead = getClosestEnemy()
    if enemyHead then
        local screenPos, onScreen = camera:WorldToViewportPoint(enemyHead.Position)
        if onScreen then
            local screenSize = camera.ViewportSize
            local center = Vector2.new(screenSize.X / 2, screenSize.Y / 2)
            local mouseMove = Vector2.new(screenPos.X - center.X, screenPos.Y - center.Y)
            
            -- ЗАМЕДЛЕННЫЙ СДВИГ ОСЕЙ (Деление на 12 дает очень плавный ход)
            if mouseMove.Magnitude > 2 then
                local moveX = mouseMove.X / smoothStrength
                local moveY = mouseMove.Y / smoothStrength
                pcall(function()
                    camera.CFrame = camera.CFrame * CFrame.Angles(0, -math.rad(moveX), 0) * CFrame.Angles(-math.rad(moveY), 0, 0)
                end)
            end

            -- ИСПРАВЛЕНО: Стрельба начнется только при точном наведении (радиус уменьшен до 20)
            if mouseMove.Magnitude < 20 then 
                isFiring = true
            else
                isFiring = false
            end
        else
            isFiring = false
        end
    else
        isFiring = false
    end
end)








                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })




local Input = Tabs.Main:AddInput("Input", {
        Title = "Input",
        Default = "16",
        Placeholder = "Placeholder",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
  

           wait(1)
           local plr = Workspace:WaitForChild(game.Players.LocalPlayer.Name)
           plr:WaitForChild("Humanoid").WalkSpeed = Value
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)
   
    
    







    local Colorpicker = Tabs.Main:AddColorpicker("Colorpicker", {
        Title = "Hands Color",
        Default = Color3.fromRGB(242,243,243)
    })

    Colorpicker:OnChanged(function()
        local la, ra = workspace:WaitForChild("ViewModel"):WaitForChild("Left Arm"), workspace:WaitForChild("ViewModel"):WaitForChild("Right Arm")
         la.Color = Colorpicker.Value
         ra.Color = Colorpicker.Value
    end)
    
    Colorpicker:SetValueRGB(Color3.fromRGB(242, 243, 243))

Tabs.But:AddButton({
    Title = "Bhop button",
    Description = " ",
    Callback = function()
        Window:Dialog({
            Title = " ",
            Content = " ",
            Buttons = {
                {
                    Title = "Создать кнопку",
                    Callback = function()
                        local UserInputService = game:GetService("UserInputService")
                        local RunService = game:GetService("RunService")
                        local Players = game:GetService("Players")

                        local player = Players.LocalPlayer
                        local playerGui = player:WaitForChild("PlayerGui")

                        -- ТРИГГЕРЫ ДЛЯ ЛОГИКИ
                        local bhopEnabled = false
                        local dragging = false
                        local hasMoved = false -- Исправлено: Добавлена переменная проверки сдвига
                        local dragStart = Vector3.new()
                        local startPos = UDim2.new()

                        -- 1. СОЗДАНИЕ ИНТЕРФЕЙСА
                        local ScreenGui = Instance.new("ScreenGui")
                        ScreenGui.Name = "MovableButtonUI"
                        ScreenGui.ResetOnSpawn = false
                        ScreenGui.Parent = game:GetService("CoreGui") or playerGui

                        local DragButton = Instance.new("ImageButton")
                        DragButton.Size = UDim2.new(0, 70, 0, 70)
                        DragButton.Position = UDim2.new(0.5, -35, 0.5, -35)
                        DragButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        DragButton.BackgroundTransparency = 0.5
                        DragButton.Image = "rbxassetid://10850257322"
                        DragButton.Parent = ScreenGui

                        local ButtonText = Instance.new("TextLabel")
                        ButtonText.Size = UDim2.new(1, 0, 1, 0)
                        ButtonText.BackgroundTransparency = 1
                        ButtonText.Text = "Bhop OFF"
                        ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        ButtonText.Font = Enum.Font.GothamBold
                        ButtonText.TextSize = 12
                        ButtonText.Parent = DragButton

                        -- 2. ЛОГИКА НАЖАТИЯ (ВКЛЮЧЕНИЕ / ВЫКЛЮЧЕНИЕ BHOP)
                        DragButton.MouseButton1Click:Connect(function() 
                            if not hasMoved then 
                                bhopEnabled = not bhopEnabled
                                if bhopEnabled then
                                    ButtonText.Text = "Bhop ON"
                                    DragButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255) -- Синеет при включении
                                else
                                    ButtonText.Text = "Bhop OFF"
                                    DragButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                end
                            end
                        end)

                        -- 3. ПЛАВНЫЙ И НАДЕЖНЫЙ ЦИКЛ БХОПА (АВТО-ПРЫЖОК)
                        RunService.Heartbeat:Connect(function()
                            if bhopEnabled and player.Character then
                                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                                -- Проверяем, касается ли персонаж земли (чтобы прыгать сразу в момент приземления)
                                if humanoid and humanoid.FloorMaterial ~= Enum.Material.Air and humanoid.Health > 0 then
                                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                                end
                            end
                        end)

                        -- 4. ЛОГИКА ПЛАВНОГО ПЕРЕТАСКИВАНИЯ ПАЛЬЦЕМ / МЫШЬЮ
                        DragButton.InputBegan:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                dragging = true
                                hasMoved = false -- Сброс перед началом движения
                                dragStart = input.Position
                                startPos = DragButton.Position
                            end
                        end)

                        UserInputService.InputChanged:Connect(function(input)
                            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                                local delta = input.Position - dragStart
                                
                                -- Если палец сдвинулся больше чем на 5 пикселей, считаем это перетаскиванием, а не кликом
                                if delta.Magnitude > 5 then
                                    hasMoved = true
                                end

                                DragButton.Position = UDim2.new(
                                    startPos.X.Scale, startPos.X.Offset + delta.X, 
                                    startPos.Y.Scale, startPos.Y.Offset + delta.Y
                               )
                            end
                        end)

                        UserInputService.InputChanged:Connect(function(input)
                            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                                local delta = input.Position - dragStart
                                DragButton.Position = UDim2.new(
                                    startPos.X.Scale, startPos.X.Offset + delta.X, 
                                    startPos.Y.Scale, startPos.Y.Offset + delta.Y
                                )
                            end
                        end)

                        UserInputService.InputEnded:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                dragging = false
                            end
                        end)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

 Tabs.But:AddButton({
        Title = "ui",
        Description = " ",
        Callback = function()
            Window:Dialog({
                Title = " ",
                Content = " ",
                Buttons = {
                    {
                        Title = " ",
                        Callback = function()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- НАСТРОЙКИ СВЕРХТОЧНОГО ПРИЦЕЛА
local crosshairSize = 12        -- Общий размер прицела в пикселях (сделан меньше)
local lineLength = 4           -- Длина четырёх палочек крестика (короткие)
local lineThickness = 1        -- Толщина палочек крестика (ультратонкие)
local centerDotSize = 0        -- Размер точки в центре (0 = убрана, чтобы не мешать)
local rotationSpeed = 35       -- Скорость вращения (сделана медленнее и плавнее)

-- 1. СОЗДАНИЕ ИНТЕРФЕЙСА С ИГНОРИРОВАНИЕМ СДВИГА ЭКРАНА
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PerfectRotatingCrosshairUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true -- ИСПРАВЛЕНО: Прицел встанет строго по центру, игнорируя TopBar
ScreenGui.Parent = game:GetService("CoreGui") or playerGui

-- Главный контейнер прицела
local CrosshairCenter = Instance.new("Frame")
CrosshairCenter.Size = UDim2.new(0, crosshairSize, 0, crosshairSize)
CrosshairCenter.Position = UDim2.new(0.5, -crosshairSize/2, 0.5, -crosshairSize/2)
CrosshairCenter.BackgroundTransparency = 1
CrosshairCenter.Parent = ScreenGui

-- Вращающаяся рамка для палочек
local RotatingFrame = Instance.new("Frame")
RotatingFrame.Size = UDim2.new(1, 0, 1, 0)
RotatingFrame.BackgroundTransparency = 1
RotatingFrame.Parent = CrosshairCenter

-- Функция для создания белых линий
local function createLine(position, size)
    local line = Instance.new("Frame")
    line.Size = size
    line.Position = position
    line.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- ИСПРАВЛЕНО: Белый цвет
    line.BorderSizePixel = 0
    line.Parent = RotatingFrame
end

-- Верхняя палочка
createLine(UDim2.new(0.5, -lineThickness/2, 0, 0), UDim2.new(0, lineThickness, 0, lineLength))
-- Нижняя палочка
createLine(UDim2.new(0.5, -lineThickness/2, 1, -lineLength), UDim2.new(0, lineThickness, 0, lineLength))
-- Левая палочка
createLine(UDim2.new(0, 0, 0.5, -lineThickness/2), UDim2.new(0, lineLength, 0, lineThickness))
-- Правая палочка
createLine(UDim2.new(1, -lineLength, 0.5, -lineThickness/2), UDim2.new(0, lineLength, 0, lineThickness))

-- 2. ЦИКЛ ВРАЩЕНИЯ БЕЗ ЗАВИСИМОСТИ ОТ FPS
local currentRotation = 0

RunService.RenderStepped:Connect(function(deltaTime)
    currentRotation = currentRotation + (rotationSpeed * deltaTime)
    
    if currentRotation >= 360 then
        currentRotation = currentRotation - 360
    end
    
    RotatingFrame.Rotation = currentRotation
end)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    }) 
  
end




-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)


-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
