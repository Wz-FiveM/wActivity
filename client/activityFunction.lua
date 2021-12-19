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


function checkScripts()
    for k,v in pairs (wActivity.zone) do
        if wActivity.zone[k].posHaverst == nil then
            ESX.ShowNotification("~r~"..k.." n'a pas de position de récolte")
            ESX.ShowNotification("~r~Démarrage Impossible")
            print("^0[^3INFORMATION^0] ^1Une position de récolte à été oublier dans le config.lua")
            return
        end
        if wActivity.zone[k].itemRewardHarvest == nil then
            ESX.ShowNotification("~r~"..k.." n'a pas d'item de récompense")
            ESX.ShowNotification("~r~Démarrage Impossible")
            print("^0[^3INFORMATION^0] ^1Un item de récompense à été oublier dans le config.lua")
            return
        end

        if wActivity.zone[k].itemRewardProcessing == nil then
            ESX.ShowNotification("~r~"..k.." n'a pas d'item de récompense pour le traitement")
            ESX.ShowNotification("~r~Démarrage Impossible")
            print("^0[^3INFORMATION^0] ^1Un item de récompense après traitement à été oublier dans le config.lua")
            return
        end

        if wActivity.zone[k].itemRewardPrice == nil then
            ESX.ShowNotification("~r~"..k.." n'a pas de prix de récompense")
            ESX.ShowNotification("~r~Démarrage Impossible")
            print("^0[^3INFORMATION^0] ^1Un prix de récompense après traitement à été oublier dans le config.lua")
            return
        end

        if wActivity.zone[k].posProcessing == nil then
            ESX.ShowNotification("~r~"..k.." n'a pas de position de traitement")
            ESX.ShowNotification("~r~Démarrage Impossible")
            print("^0[^3INFORMATION^0] ^1Une position de traitement à été oublier dans le config.lua")
            return
        end

        if wActivity.zone[k].posDeal == nil then
            ESX.ShowNotification("~r~"..k.." n'a pas de position de vente")
            ESX.ShowNotification("~r~Démarrage Impossible")
            print("^0[^3INFORMATION^0] ^1Une position de vente à été oublier dans le config.lua")
            return
        end

        if wActivity.zone[k].nameBlips == nil then
            ESX.ShowNotification("~r~"..k.." n'a pas de nom de blips")
            ESX.ShowNotification("~r~Démarrage Impossible")
            print("^0[^3INFORMATION^0] ^1Un nom de blips à été oublier dans le config.lua")
            return
        end
    end
end


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