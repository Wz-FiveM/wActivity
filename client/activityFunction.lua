--@author Wz.
--@version 1.0
--[[
  ~   This file is part of wActivity.
  ~
  ~   File created at [19/12/2021]
  ~   Copyright (c) Wz - All Rights Reserved
  ~   Unauthorized copying, modifying and/or distributing of this file,
--]]

ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function startHarvest(item)
    FreezeEntityPosition(PlayerPedId(), true)
    RequestAnimDict("anim@mp_snowball")
    while (not HasAnimDictLoaded("anim@mp_snowball")) do Citizen.Wait(0) end
    TaskPlayAnim(PlayerPedId(),"anim@mp_snowball","pickup_snowball",1.0,-1.0, 5000, 0, 1, true, true, true)
    ESX.ShowNotification("<C>~p~Activité</C>\n~s~Récolte en cours")
    Wait(1500)
    TriggerServerEvent("wActivity:recolte", item)
    FreezeEntityPosition(PlayerPedId(), false)
end

function startProcessing(itemInProcessing, itemReward)
    FreezeEntityPosition(PlayerPedId(), true)
    ESX.ShowNotification("<C>~p~Activité</C>\n~s~Traitement en cours")
    Wait(3500)
    TriggerServerEvent("wActivity:processing", itemInProcessing, itemReward)
    FreezeEntityPosition(PlayerPedId(), false)
end

function startSell(item, itemPriceReward)
    FreezeEntityPosition(PlayerPedId(), true)
    ESX.ShowNotification("<C>~p~Activité</C>\n~s~vente en cours")
    Wait(3500)
    TriggerServerEvent("wActivity:sell", item, itemPriceReward)
    FreezeEntityPosition(PlayerPedId(), false)
end