Config = Config or {}

Config.Framework = "ESX"

function Notify(title, message, type, duration)
    exports['bcs_hud']:SendAlert(title, message, type, duration)
end

function HelpText(show, message)
    if show then
        exports.bcs_hud:displayHelp(message)
    else
        exports.bcs_hud:closeHelp()
    end
end

RegisterNetEvent('bcs_radialmenu:notify', Notify)

function IsDead()
    if Config.Framework == 'QB' then
        return PlayerData.metadata['isdead']
    elseif Config.Framework == 'ESX' then
        return LocalPlayer.state.isDead
    end
end

Config.Open = {
    key = 'f1',
    commandonly = false, -- if this is true then it opens with command
    command = 'radialmenu',
}
