CreateThread(function()
    if Config.Framework ~= 'QB' then return end
    QBCore = exports['qb-core']:GetCoreObject()

    PlayerData = QBCore.Functions.GetPlayerData()

    RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
        PlayerData = val
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

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
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
        QBCore.Functions.TriggerCallback(func, ...)
    end

    function GetClosestPlayer()
        return QBCore.Functions.GetClosestPlayer()
    end

    function GetIdentifier()
        return PlayerData and PlayerData.citizenid
    end

    function GetPlayerGrade()
        return PlayerData and PlayerData.job and PlayerData.job.grade.level
    end
end)
