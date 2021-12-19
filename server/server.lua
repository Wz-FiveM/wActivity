--@author Wz.
--@version 1.0
--[[
  ~   This file is part of wActivity.
  ~
  ~   File created at [19/12/2021]
  ~   Copyright (c) Wz - All Rights Reserved
  ~   Unauthorized copying, modifying and/or distributing of this file,
--]]

if GetCurrentResourceName() ~= "wActivity" then
    os.exit()
    print("[wActivity] Error: Resource name is not correct.")
    print("[wActivity] Error: Please rename the resource to 'wActivity'.")
    return
end

ESX = nil TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('wActivity:recolte')
AddEventHandler('wActivity:recolte', function(item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem(item, 1)
end)

RegisterServerEvent('wActivity:processing')
AddEventHandler('wActivity:processing', function(itemProcessing, itemReward)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xItem = xPlayer.getInventoryItem(itemProcessing).count
    if xItem > 5 then
        xPlayer.removeInventoryItem(itemProcessing, 1)
        xPlayer.addInventoryItem(itemReward, 1)
    else
        TriggerClientEvent("esx:showNotification", _source, '~r~Vous n\'avez pas assez de '..itemProcessing..' pour faire cela.')
    end
end)


RegisterServerEvent('wActivity:sell')
AddEventHandler('wActivity:sell', function(item, reward)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xItem = xPlayer.getInventoryItem(item).count
    if xItem > 0 then
        xPlayer.removeInventoryItem(item, 1)
        xPlayer.addAccountMoney('money', reward)
    else
        TriggerClientEvent("esx:showNotification", _source, '~r~Vous n\'avez pas assez de '..item..' pour faire cela.')
    end
end)


print("^0[^3"..GetCurrentResourceName() .. "^0] ^5loading sucessful^0")
print("^0[^3wActivity^0] ^6activityBlips.lua ^0/ ^6activityFunction.lua ^0/ ^6activityZone.lua ^0/ ^6server.lua ^5loaded^0")
