local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("mdx-chopshop:server:getItems", function(item, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add", amount)
end)

