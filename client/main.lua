local QBCore = exports['qb-core']:GetCoreObject()
local hasList = false
local finished = false
local carmodel = Config.Vehicles[math.random(1, #Config.Vehicles)]
local location = Config.Locations.CarSpawn[math.random(1, #Config.Locations.CarSpawn)]
local blip = nil


RegisterNetEvent("mdx-chopshop:client:getList", function()
    if not hasList then
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = "Mr. Chopshop",
            subject = "Car Location",
            message = "We have got an information about a car that you can find in the following location: <br/> "..location.name.."<br/> Car Model: "..carmodel,
        })
        hasList = true
        finished = false
        QBCore.Functions.SpawnVehicle(carmodel, function(veh) end, location.coords, true)
    else
        QBCore.Functions.Notify('You already have a list', 'error', 7500)
    end
end)

RegisterNetEvent("mdx-chopshop:client:startChop", function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    if not finished and hasList then
        QBCore.Functions.Progressbar('chopveh', 'Chopping the left door', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            TriggerServerEvent("mdx-chopshop:server:getItems", Config.Items["door"], 1)
            SetVehicleDoorOpen(vehicle, 0, false, true)
            Wait(2000)
            SetVehicleDoorBroken(vehicle, 0, true)
            QBCore.Functions.Progressbar('chopveh', 'Chopping the right door', 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                TriggerServerEvent("mdx-chopshop:server:getItems", Config.Items["door"], 1)
                SetVehicleDoorOpen(vehicle, 1, false, true)
                Wait(2000)
                SetVehicleDoorBroken(vehicle, 1, true)
                QBCore.Functions.Progressbar('chopveh', 'Chopping the back left door', 5000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()
                    TriggerServerEvent("mdx-chopshop:server:getItems", Config.Items["door"], 1)
                    SetVehicleDoorOpen(vehicle, 2, false, true)
                    Wait(2000)
                    SetVehicleDoorBroken(vehicle, 2, true)
                    QBCore.Functions.Progressbar('chopveh', 'Chopping the back right door', 5000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        TriggerServerEvent("mdx-chopshop:server:getItems", Config.Items["door"], 1)
                        SetVehicleDoorOpen(vehicle, 3, false, true)
                        Wait(2000)
                        SetVehicleDoorBroken(vehicle, 3, true)
                        QBCore.Functions.Progressbar('chopveh', 'Chopping the Trunk', 5000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function()
                            local chance = math.random(1,100)
                            if chance >= 60 then
                                TriggerServerEvent("mdx-chopshop:server:getItems", "lockpick", 1)
                            end
                            TriggerServerEvent("mdx-chopshop:server:getItems", Config.Items["trunk"], 1)
                            SetVehicleDoorOpen(vehicle, 5, false, true)
                            Wait(2000)
                            SetVehicleDoorBroken(vehicle, 5, true)
                            QBCore.Functions.Progressbar('chopveh', 'Chopping the Hood', 5000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {}, {}, {}, function()
                                TriggerServerEvent("mdx-chopshop:server:getItems", Config.Items["hood"], 1)
                                SetVehicleDoorOpen(vehicle, 4, false, true)
                                Wait(2000)
                                SetVehicleDoorBroken(vehicle, 4, true)
                                QBCore.Functions.Progressbar('chopveh', 'Chopping the Front Left Wheel', 5000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {}, {}, {}, function()
                                    TriggerServerEvent("mdx-chopshop:server:getItems", Config.Items["wheels"], 1)
                                    SetVehicleTyreBurst(vehicle, 0, true, 1000.0)
                                    QBCore.Functions.Progressbar('chopveh', 'Chopping the Front Right Wheel', 5000, false, true, {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {}, {}, {}, function()
                                        TriggerServerEvent("mdx-chopshop:server:getItems", Config.Items["wheels"], 1)
                                        SetVehicleTyreBurst(vehicle, 1, true, 1000.0)
                                        QBCore.Functions.Progressbar('chopveh', 'Chopping the Rear Right Wheel', 5000, false, true, {
                                            disableMovement = true,
                                            disableCarMovement = true,
                                            disableMouse = false,
                                            disableCombat = true,
                                        }, {}, {}, {}, function()
                                            TriggerServerEvent("mdx-chopshop:server:getItems", Config.Items["wheels"], 1)
                                            SetVehicleTyreBurst(vehicle, 5, true, 1000.0)
                                            QBCore.Functions.Progressbar('chopveh', 'Chopping the Rear Left Wheel', 5000, false, true, {
                                                disableMovement = true,
                                                disableCarMovement = true,
                                                disableMouse = false,
                                                disableCombat = true,
                                            }, {}, {}, {}, function()
                                                TriggerServerEvent("mdx-chopshop:server:getItems", Config.Items["wheels"], 1)
                                                finished = true
                                                hasList = false
                                                DeleteVehicle(vehicle)
                                                QBCore.Functions.Notify('Take these to someone that knows what to do with them', 'primary', 7500)
                                            end, function()
                                                QBCore.Functions.Notify('Cancelled', 'error', 7500)
                                            end)
                                        end, function()
                                            QBCore.Functions.Notify('Cancelled', 'error', 7500)
                                        end)
                                    end, function()
                                        QBCore.Functions.Notify('Cancelled', 'error', 7500)
                                    end)
                                end, function()
                                    QBCore.Functions.Notify('Cancelled', 'error', 7500)
                                end)
                            end, function()
                                QBCore.Functions.Notify('Cancelled', 'error', 7500)
                            end)
                        end, function()
                            QBCore.Functions.Notify('Cancelled', 'error', 7500)
                        end)
                    end, function()
                        QBCore.Functions.Notify('Cancelled', 'error', 7500)
                    end)
                end, function()
                    QBCore.Functions.Notify('Cancelled', 'error', 7500)
                end)
            end, function()
                QBCore.Functions.Notify('Cancelled', 'error', 7500)
            end)
        end, function()
            QBCore.Functions.Notify('Cancelled', 'error', 7500)
        end)
    end
end)

Citizen.CreateThread(function()
    local inRange = false
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        if #(pos - vector3(Config.Locations["ScrapVehicle"].x, Config.Locations["ScrapVehicle"].y, Config.Locations["ScrapVehicle"].z)) < 10 then
            inRange = true
            if IsPedInAnyVehicle(PlayerPedId()) then
                DrawMarker(2, Config.Locations["ScrapVehicle"].x, Config.Locations["ScrapVehicle"].y, Config.Locations["ScrapVehicle"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                if #(pos - vector3(Config.Locations["ScrapVehicle"].x, Config.Locations["ScrapVehicle"].y, Config.Locations["ScrapVehicle"].z)) < 2 then
                    DrawText3D(Config.Locations["ScrapVehicle"].x, Config.Locations["ScrapVehicle"].y, Config.Locations["ScrapVehicle"].z, "~g~E~w~ - Scrap Vehicle") 
                        if IsControlJustPressed(0, 38) then
                            if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then
                                if IsVehicleValid(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), true))) then
                                    TriggerEvent("mdx-chopshop:client:startChop")
                                else
                                    QBCore.Functions.Notify('This is not the car', 'error', 7500)
                                end
                            else
                                QBCore.Functions.Notify('You must be the driver of the vehicle', 'error', 7500)
                            end
                        end
                end
            end
            if not inRange then
                Wait(1000)
            end
        end
    end
end)

function IsVehicleValid(vehicleModel)
	local retval = false
	if carmodel ~= nil then
		if carmodel ~= nil and GetHashKey(carmodel) == vehicleModel then
			retval = true
		end
	end
	return retval
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 400
    DrawRect(0.0, 0.0 + 0.0110, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end




