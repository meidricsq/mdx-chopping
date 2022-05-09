local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("mdx-chopshop:server:getItems", function(item, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add", amount)
end)

RegisterNetEvent("mdx-chopshop:server:ExchangeItems", function(itemremove, item, amountremove, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName(itemremove) then
        Player.Functions.RemoveItem(itemremove, amountremove)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemremove], "remove", amountremove)
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add", amount)
    else
        TriggerClientEvent("QBCore:Notify", source, "You do not have enough of that item.", "error")
    end
end)

