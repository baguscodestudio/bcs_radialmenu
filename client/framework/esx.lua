CreateThread(function()
    if Config.Framework ~= 'ESX' then return end
    ESX = exports['es_extended']:getSharedObject()
    while ESX.GetPlayerData().job == nil do
        Wait(100)
    end


    PlayerData = ESX.GetPlayerData()

    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(job)
        PlayerData.job = job
        exports.bcs_radialmenu:removeOption('job_menu')
        for key, values in pairs(Config.JobMenu) do
            if job.name == key then
                exports.bcs_radialmenu:addOption({
                    id = 'job_menu',
                    label = 'Job Menu',
                    icon = 'fa-solid fa-suitcase',
                    menu = key .. '_menu'
                })
                break
            end
        end
    end)

    RegisterNetEvent('esx:onPlayerSpawn', function(player)
        exports.bcs_radialmenu:RegisterMenus(Config.Menu)
        if PlayerData and PlayerData.job then
            for job, values in pairs(Config.JobMenu) do
                if job == PlayerData.job.name then
                    exports.bcs_radialmenu:addOption({
                        id = 'job_menu',
                        label = 'Job Menu',
                        icon = 'fa-solid fa-suitcase',
                        menu = job .. '_menu'
                    })
                end
                exports.bcs_radialmenu:RegisterMenus(values)
            end
        end
    end)

    function TriggerServerCallback(func, ...)
        ESX.TriggerServerCallback(func, ...)
    end

    function GetClosestPlayer()
        return ESX.Game.GetClosestPlayer()
    end

    function GetIdentifier()
        return PlayerData and PlayerData.identifier
    end

    function GetPlayerGrade()
        return PlayerData and PlayerData.job and PlayerData.job.grade
    end
end)
