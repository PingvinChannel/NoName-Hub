repeat task.wait() until game:IsLoaded()

local completed = 0
local completedtime = 0

game.Players.PlayerRemoving:Connect(function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)

local CanComplete = getgenv().CanComplete or 6

local plr = game.Players.LocalPlayer

function getLevel()
    local text = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Balance"):WaitForChild("Level"):WaitForChild("TextLabel").Text
    return text
end

function getMoney()
    local text = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Balance"):WaitForChild("Rubl"):WaitForChild("TextLabel").Text
    return text
end

function webhook(n)
    if getgenv().webhook == nil then return end
    local text = `Аккаунт: ||{plr.Name}||\n`
    text = text..n.."\n"

    local url = getgenv().webhook
    local data = {
        ["embeds"] = {
            {
                ["title"] = "АвтоФарм",
                ["description"] = text,
                ["color"] = 3017997,
                ["footer"] = {
                    ["text"] = `NoName Hub • {os.date("%c")}`
                }
            },
        },
    }

    local newdata = game:GetService("HttpService"):JSONEncode(data)
    
    local headers = {
       ["content-type"] = "application/json"
    }

    request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
end

function notify(text, duration)
    print(text)
    duration = 60 or duration
    game.StarterGui:SetCore("SendNotification", {
        Title = "АвтоФарм";
        Text = text;
        Duration = duration;
    })
    webhook(text)
end

function SetCamera()
    local camera = workspace.CurrentCamera
    local cf = camera.CFrame
    camera.CFrame = CFrame.new(cf.Position, cf.Position - Vector3.new(0, 1, 0))
end

function teleport(cframe)
    repeat wait() until plr.Character
    SetCamera()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
    task.wait(1)
end

function checkrole()
    SetCamera()
    if string.find(plr.Team.Name, "Гражданин") then
        teleport(CFrame.new(-122.767815, 16.5909672, 26.2703838, -0.834702849, -2.524013e-08, 0.550700605, -1.87822433e-08, 1, 1.73643144e-08, -0.550700605, 4.15065049e-09, -0.834702849))
        fireproximityprompt(workspace["\208\160\208\176\208\177\208\190\209\130\208\176"]["\208\147\209\128\209\131\208\183\209\135\208\184\208\186"].Start["\208\157\208\176\209\135\208\176\209\130\209\140"])
    end
    task.wait(1)
end


function start()
    if os.difftime(os.time(), completedtime) < 600 then return end

    checkrole()

    if string.find(plr.Team.Name, "Гражданин") and completed < CanComplete then
        repeat
            checkrole()
        until not string.find(plr.Team.Name, "Гражданин")
    end

    teleport(CFrame.new(-135.839111, 16.4175682, 16.0699024, 0.201874197, 7.23779934e-08, 0.979411483, 2.22018866e-08, 1, -7.84756793e-08, -0.979411483, 3.75869966e-08, 0.201874197))
    fireproximityprompt(workspace["\208\160\208\176\208\177\208\190\209\130\208\176"]["\208\147\209\128\209\131\208\183\209\135\208\184\208\186"].Take.ProximityPrompt)
    
    task.wait(1)

    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("\208\154\208\190\209\128\208\190\208\177\208\186\208\176") then
        plr.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack["\208\154\208\190\209\128\208\190\208\177\208\186\208\176"])
    else
        repeat
            teleport(CFrame.new(-135.839111, 16.4175682, 16.0699024, 0.201874197, 7.23779934e-08, 0.979411483, 2.22018866e-08, 1, -7.84756793e-08, -0.979411483, 3.75869966e-08, 0.201874197))
            fireproximityprompt(workspace["\208\160\208\176\208\177\208\190\209\130\208\176"]["\208\147\209\128\209\131\208\183\209\135\208\184\208\186"].Take.ProximityPrompt)
            task.wait()
        until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("\208\154\208\190\209\128\208\190\208\177\208\186\208\176")
    end

    task.wait()

    teleport(CFrame.new(-159.096497, 15.7625446, 132.476074, -0.99973321, 2.05640962e-08, -0.0230974108, 2.14242419e-08, 1, -3.69924429e-08, 0.0230974108, -3.74774203e-08, -0.99973321))
    fireproximityprompt(workspace["\208\160\208\176\208\177\208\190\209\130\208\176"]["\208\147\209\128\209\131\208\183\209\135\208\184\208\186"].Stop.ProximityPrompt)

    task.wait(.5)

    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("\208\154\208\190\209\128\208\190\208\177\208\186\208\176") then
        completed += 1
    end

    if completed >= CanComplete then
        teleport(CFrame.new(-122.767815, 16.5909672, 26.2703838, -0.834702849, -2.524013e-08, 0.550700605, -1.87822433e-08, 1, 1.73643144e-08, -0.550700605, 4.15065049e-09, -0.834702849))
        fireproximityprompt(workspace["\208\160\208\176\208\177\208\190\209\130\208\176"]["\208\147\209\128\209\131\208\183\209\135\208\184\208\186"].Start["\208\157\208\176\209\135\208\176\209\130\209\140"])
        
        if string.find(plr.Team.Name, "Грузчик") and completed < CanComplete then
            repeat
                teleport(CFrame.new(-122.767815, 16.5909672, 26.2703838, -0.834702849, -2.524013e-08, 0.550700605, -1.87822433e-08, 1, 1.73643144e-08, -0.550700605, 4.15065049e-09, -0.834702849))
                fireproximityprompt(workspace["\208\160\208\176\208\177\208\190\209\130\208\176"]["\208\147\209\128\209\131\208\183\209\135\208\184\208\186"].Start["\208\157\208\176\209\135\208\176\209\130\209\140"])
                task.wait(1)
            until not string.find(plr.Team.Name, "Грузчик")
        end

        completedtime = os.time()

        task.wait(3)
    
        notify(`АвтоФарм: Лимит Работы - Ждать 10 минут ({os.date("%X", completedtime + 600)})\n{getMoney()}\n{getLevel()}`, 600)
    end

end

coroutine.wrap(function()
    while task.wait() do
        if completed >= CanComplete then
            teleport(CFrame.new(-122.767815, 16.5909672, 26.2703838, -0.834702849, -2.524013e-08, 0.550700605, -1.87822433e-08, 1, 1.73643144e-08, -0.550700605, 4.15065049e-09, -0.834702849))
            task.wait(.5)
            teleport(CFrame.new(-135.839111, 16.4175682, 16.0699024, 0.201874197, 7.23779934e-08, 0.979411483, 2.22018866e-08, 1, -7.84756793e-08, -0.979411483, 3.75869966e-08, 0.201874197))
            task.wait(.5)
            teleport(CFrame.new(-159.096497, 15.7625446, 132.476074, -0.99973321, 2.05640962e-08, -0.0230974108, 2.14242419e-08, 1, -3.69924429e-08, 0.0230974108, -3.74774203e-08, -0.99973321))
        end

        if os.difftime(os.time(), completedtime) > 600 then
            if completed >= CanComplete then
                completed = 0
            end
            if completed == 0 then
                notify("АвтоФарм: Работает")
            end
            start()
        end
    end
end)()
