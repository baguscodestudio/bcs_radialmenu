local menu, PlayerData = {}, {}

CreateThread(function()
    if Config.Framework == 'ESX' then
        local ESX = exports['es_extended']:getSharedObject()
        while ESX.GetPlayerData().job == nil do
            Wait(100)
        end
        PlayerData = ESX.GetPlayerData()

        RegisterNetEvent('esx:playerLoaded', function(xPlayer)
			PlayerData = xPlayer
		end)

		RegisterNetEvent('esx:setJob', function(job)
			PlayerData.job = job
            removeMenu(Config.JobOption.label)
            Wait(100)
            AddJobMenu()
		end)
    elseif Config.Framework == 'QB' then
        local QBCore = exports['qb-core']:GetCoreObject()
		PlayerData = QBCore.Functions.GetPlayerData()

        RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
		end)

        RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
            removeMenu(Config.JobOption.label)
            Wait(100)
            AddJobMenu()
		end)
    end

    for i=1, #Config.RadialMenu do
        menu[#menu + 1] = Config.RadialMenu[i]
    end

    AddJobMenu()
end)

RegisterNUICallback('initialize', function(data, cb)
    cb({
        size = Config.UI.Size,
        colors = Config.UI.Colors
    })
end)

RegisterNUICallback('hideFrame', function(data,cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('clickedItem', function(data, cb)
    if data.shouldClose then
        SetNuiFocus(false, false)
    end
    if not data.args then
        data.args = {}
    end
    if data.client then
        TriggerEvent(data.event, table.unpack(data.args))
    elseif not data.client then
        TriggerServerEvent(data.event, table.unpack(data.args))
    end
    cb('ok')
end)

function addMenu(data)
    if data.label and data.icon and (data.submenu or (data.client ~= nil and data.shouldClose ~= nil and data.event)) then
        menu[#menu + 1] = data
    end
end

exports('addMenu', addMenu)

function removeMenu(label)
    if label then
        removeItemFromArray(menu, 'label', label)
    end
end

exports('removeMenu', removeMenu)

function AddJobMenu()
    if (Config.Framework == 'ESX' or Config.Framework == 'QB') then
        if PlayerData.job and Config.JobMenu[PlayerData.job.name] then
            local joboption = {
                label = Config.JobOption.label,
                icon = Config.JobOption.icon,
                submenu = {}
            }

            for i=1, #Config.JobMenu[PlayerData.job.name] do
                joboption.submenu[#joboption.submenu + 1] = Config.JobMenu[PlayerData.job.name][i]
            end
            menu[#menu + 1] = joboption
        end
    end
end

RegisterCommand(Config.Open.command, function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action="openMenu",
        data=menu
    })
end)

if not Config.Open.commandonly then
    RegisterKeyMapping(Config.Open.command, 'Open Radial Menu', 'keyboard', Config.Open.key)
end

-- Utils
function removeItemFromArray(array, property, value)
    for i=1, #array do
        if array[i][property] == value then
            array[i] = nil
            break
        end
    end
end