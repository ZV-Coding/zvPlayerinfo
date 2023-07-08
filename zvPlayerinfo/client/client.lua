local radarEsteso = false
local showblip = false
local showname = false

RegisterNetEvent('togglePlayerInfo')
AddEventHandler('togglePlayerInfo', function()
    showblip = not showblip
    if showblip then
        showblip = true
        showname = true
        TriggerEvent('zv_policejob:updateBlip')
    else
        showblip = false
        showname = false
        TriggerEvent('zv_policejob:updateBlip')    
    end
    if showblip then
        if Config.DefaultNotify then
            Citizen.CreateThread(function()
                Citizen.Wait(0)
                SetNotificationTextEntry("STRING")
                AddTextComponentString(Config.NotifyOn)
                DrawNotification(false, false)
                Citizen.Wait(Config.notifyTimeout)
                ThefeedRemoveItem()
            end)
        end
        if Config.OkokNotify then
            exports['okokNotify']:Alert(Config.OkokTitle, Config.OkokMessageOn, Config.OkokNotifyTimeout, Config.OkokTypeOn)
        end
        if Config.PnotifyNotify then
            TriggerEvent("pNotify:SendNotification", {text = Config.PnotifyMessageOn,
                layout = Config.PnotifyLayout,
                timeout = Config.PnotifyTimeout,
                type = Config.PnotifyTypeOn
			})
        end
        Citizen.CreateThread(function()
            local playerId = GetPlayerServerId(PlayerId())
            TriggerServerEvent('getPlayerIP', playerId)
        end)
    else
        if Config.DefaultNotify then
            Citizen.CreateThread(function()
                Citizen.Wait(0)
                SetNotificationTextEntry("STRING")
                AddTextComponentString(Config.NotifyOff)
                DrawNotification(false, false)
                Citizen.Wait(Config.notifyTimeout)
                ThefeedRemoveItem()
            end)
        end
        if Config.OkokNotify then
            exports['okokNotify']:Alert(Config.OkokTitle, Config.OkokMessageOff, Config.OkokNotifyTimeout, Config.OkokTypeOff)
        end
        if Config.PnotifyNotify then
            TriggerEvent("pNotify:SendNotification", {text = Config.PnotifyMessageOff,
                layout = Config.PnotifyLayout,
                timeout = Config.PnotifyTimeout,
                type = Config.PnotifyTypeOff
			})
        end
        Citizen.CreateThread(function()
            local playerId = GetPlayerServerId(PlayerId())
            TriggerServerEvent('getPlayerIP2', playerId)
        end)
    end
end)

RegisterNetEvent('playerIP')
AddEventHandler('playerIP', function(playerIP)
    local playerName = GetPlayerName(PlayerId())
    TriggerServerEvent('zvPlayerinfo:sendWebhook', Config.Webhook, 'test', playerName, playerIP)
end)

RegisterNetEvent('playerIP2')
AddEventHandler('playerIP2', function(playerIP)
    local playerName = GetPlayerName(PlayerId())
    TriggerServerEvent('zvPlayerinfo:sendWebhook2', Config.Webhook, 'test', playerName, playerIP)
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/' ..Config.Command, 'Toggle playerblips/playernames') --{{ name="emote", help="dance, camera, sit oder andere"}}
end)


Citizen.CreateThread(function()
    while true do
        Wait(1)
        for i = 0, 255 do
            if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= GetPlayerPed(-1) then
                ped = GetPlayerPed(i)
                blip = GetBlipFromEntity(ped)
                idTest = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(i), false, false, "", false)

                if showname then
                    Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTest, 0, true)
                    if NetworkIsPlayerTalking(i) then
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTest, 9, true)
                    else
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTest, 9, false)
                    end
                else
                    Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTest, 9, false)
                    Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTest, 0, false)
                end

                if showblip then
                    if not DoesBlipExist(blip) then

                        blip = AddBlipForEntity(ped)
                        SetBlipSprite(blip, 1)
                        SetBlipColour(blip, Config.BlipColor)
                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                    else
                        veh = GetVehiclePedIsIn(ped, false)
                        blipSprite = GetBlipSprite(blip)

                        if not GetEntityHealth(ped) then
                            if blipSprite ~= 274 then
                                SetBlipSprite(blip, 274)
                                SetBlipColour(blip, Config.BlipColor)
                                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                            end

                            elseif veh then
                                vehicleClass = GetVehicleClass(veh)
                                vehicleModel = GetEntityModel(veh)

                            if vehicleClass == 15 then
                                if blipSprite ~= 422 then
                                    SetBlipSprite(blip, 422)
                                    SetBlipColour(blip, Config.BlipColor)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)

                                end

                                elseif vehicleClass == 16 then

                                if vehicleModel == GetHashKey("besra") or vehicleModel == GetHashKey("hydra") or
                                    vehicleModel == GetHashKey("lazer") then

                                    if blipSprite ~= 424 then
                                        SetBlipSprite(blip, 424)
                                        SetBlipColour(blip, Config.BlipColor)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end

                                elseif blipSprite ~= 423 then
                                    SetBlipSprite(blip, 423)
                                    SetBlipColour(blip, Config.BlipColor)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                end

                                elseif vehicleClass == 14 then

                                if blipSprite ~= 427 then
                                    SetBlipSprite(blip, 427)
                                    SetBlipColour(blip, Config.BlipColor)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                end

                            elseif vehicleModel == GetHashKey("insurgent") or vehicleModel == GetHashKey("insurgent2") or
                                vehicleModel == GetHashKey("limo2") then

                                if blipSprite ~= 426 then
                                    SetBlipSprite(blip, 426)
                                    SetBlipColour(blip, Config.BlipColor)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                end

                            elseif vehicleModel == GetHashKey("rhino") then

                                if blipSprite ~= 421 then
                                    SetBlipSprite(blip, 421)
                                    SetBlipColour(blip, Config.BlipColor)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                end

                            elseif blipSprite ~= 1 then
                                SetBlipSprite(blip, 1)
                                SetBlipColour(blip, Config.BlipColor)
                                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                            end

                            passengers = GetVehicleNumberOfPassengers(veh)

                            if passengers then
                                if not IsVehicleSeatFree(veh, -1) then
                                    passengers = passengers + 1
                                end
                                ShowNumberOnBlip(blip, passengers)
                            else
                                HideNumberOnBlip(blip)
                            end
                        else
                            HideNumberOnBlip(blip)

                            if blipSprite ~= 1 then
                                SetBlipSprite(blip, 1)
                                SetBlipColour(blip, Config.BlipColor)
                                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                            end
                        end

                        SetBlipRotation(blip, math.ceil(GetEntityHeading(veh)))
                        SetBlipNameToPlayerName(blip, i)
                        SetBlipScale(blip, 0.85)

                        if IsPauseMenuActive() then
                            SetBlipAlpha(blip, 255)
                        else
                            x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                            x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(i), true))
                            distance = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) /
                                                         -1)) + 900

                            if distance < 0 then
                                distance = 0
                            elseif distance > 255 then
                                distance = 255
                            end
                            SetBlipAlpha(blip, distance)
                        end
                    end
                else
                    RemoveBlip(blip)
                end
            end
        end
    end
end)
