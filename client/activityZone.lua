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
local interval = 250

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

CreateThread(function()
    while true do
        for k,v in pairs (wActivity.zone) do
        
            -- DO NOT TOUCH THIS
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
        
        
            -- HARVEST
            local distanceHarvest = #(GetEntityCoords(PlayerPedId()) - wActivity.zone[k].posHaverst)
            if distanceHarvest < 10 then
                interval = 0
                DrawMarker(21, wActivity.zone[k].posHaverst, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 100, false, true, 2, true, false, false, false)
                if distanceHarvest < 1 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour récolter\n~r~"..wActivity.zone[k].itemRewardHarvest)
                    if IsControlJustPressed(0, 51) then
                        startHarvest(wActivity.zone[k].itemRewardHarvest)
                    end
                end
            end

            -- PROCESSING
            local distanceProcessing = #(GetEntityCoords(PlayerPedId()) - wActivity.zone[k].posProcessing)
            if distanceProcessing < 10 then
                interval = 0
                DrawMarker(21, wActivity.zone[k].posProcessing, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 100, false, true, 2, true, false, false, false)
                if distanceProcessing < 1 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour lancer le traitement\n~r~"..wActivity.zone[k].itemRewardHarvest)
                    if IsControlJustPressed(0, 51) then
                        startProcessing(wActivity.zone[k].itemRewardHarvest, wActivity.zone[k].itemRewardProcessing)
                    end
                end
            end

            -- SELL
            local distanceSell = #(GetEntityCoords(PlayerPedId()) - wActivity.zone[k].posDeal)
            if distanceSell < 10 then
                interval = 0
                DrawMarker(21, wActivity.zone[k].posDeal, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 100, false, true, 2, true, false, false, false)
                if distanceSell < 1 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour lancer la vente\n~r~"..wActivity.zone[k].itemRewardHarvest)
                    if IsControlJustPressed(0, 51) then
                        startSell(wActivity.zone[k].itemRewardHarvest, wActivity.zone[k].itemRewardPrice)
                    end
                end
            end
        end
        Citizen.Wait(interval)
    end
end)
