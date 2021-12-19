--@author Wz.
--@version 1.0
--[[
  ~   This file is part of wActivity.
  ~
  ~   File created at [19/12/2021]
  ~   Copyright (c) Wz - All Rights Reserved
  ~   Unauthorized copying, modifying and/or distributing of this file,
--]]

for k,v in pairs(wActivity.zone) do
    blips = AddBlipForCoord(wActivity.zone[k].posHaverst)
    SetBlipSprite(blips, 1)
    SetBlipColour(blips, 0)
    SetBlipScale(blips, 0.5)
    SetBlipAsShortRange(blips, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(wActivity.zone[k].nameBlips)
    EndTextCommandSetBlipName(blips)

    blips = AddBlipForCoord(wActivity.zone[k].posProcessing)
    SetBlipSprite(blips, 1)
    SetBlipColour(blips, 0)
    SetBlipScale(blips, 0.5)
    SetBlipAsShortRange(blips, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(wActivity.zone[k].nameBlips)
    EndTextCommandSetBlipName(blips)

    blips = AddBlipForCoord(wActivity.zone[k].posDeal)
    SetBlipSprite(blips, 1)
    SetBlipColour(blips, 0)
    SetBlipScale(blips, 0.5)
    SetBlipAsShortRange(blips, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(wActivity.zone[k].nameBlips)
    EndTextCommandSetBlipName(blips)
end