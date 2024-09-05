local windowState1 = true
local windowState2 = true
local windowState3 = true
local windowState4 = true

-----------------------------------------------------------------------------
-- EVENT HANDLER
-----------------------------------------------------------------------------

local function Notify(message, type)
    exports['bcs_hud']:SendAlert('Informasi', message, type, 3000)
end

AddEventHandler('esx:enteredVehicle', function(currentVehicle)
    exports.bcs_radialmenu:AddOption({
        id = 'veh_control',
        label = 'Vehicle',
        icon = 'fa-solid fa-car',
        menu = 'vehicle_menu'
    })
    local seatNumber = GetVehicleMaxNumberOfPassengers(GetVehiclePedIsIn(cache.ped, false))
    local seatData = {}
    local seat = {
        menu = 'seat_menu',
        options = seatData
    }
    local doorNumber = GetNumberOfVehicleDoors(GetVehiclePedIsIn(cache.ped, false))
    local doorData = {}
    local door = {
        menu = 'door_menu',
        options = doorData
    }
    local seatTable = {
        [1] = 'Driver',
        [2] = 'Passenger',
        [3] = 'Driver Side Rear',
        [4] = 'Passenger Side Rear',
    }
    local DoorTable = {
        [1] = 'Driver',
        [2] = 'Passenger',
        [3] = 'Driver Side Rear',
        [4] = 'Passenger Side Rear',
        [5] = 'Hood',
        [6] = 'Trunk',
    }
    if seatNumber > 0 then
        for i = 1, seatNumber + 1 do
            seatData[i] = {
                label = seatTable[i] and seatTable[i] or 'Other Seat',
                image = 'vehicle_seat',
                onSelect = function()
                    SeatControl(i - 2)
                end
            }
        end
    else
        for i = 1, #seatTable do
            seatData[i] = {
                label = seatTable[i] and seatTable[i] or 'Other Seat',
                image = 'vehicle_seat',
                onSelect = function()
                    SeatControl(i - 1)
                end
            }
        end
    end
    for i = 1, #DoorTable do
        if doorNumber == 4 then
            -- 	if i ~= 3 and i ~= 4 then
            -- 		doorData[i] = {
            -- 			label = DoorTable[i] and DoorTable[i] or 'Other Door',
            -- 			icon = 'fa-solid fa-circle-dot',
            -- 			onSelect = function()
            -- 				DoorControl(i - 1)
            -- 			end
            -- 		}
            -- 	end
            -- else
            doorData[i] = {
                label = DoorTable[i] and DoorTable[i] or 'Other Door',
                image = 'vehicle_door_' .. i,
                onSelect = function()
                    DoorControl(i - 1)
                end
            }
        end
    end
    exports.bcs_radialmenu:RegisterMenus(seat)
    exports.bcs_radialmenu:RegisterMenus(door)
end)

AddEventHandler('esx:exitedVehicle', function()
    exports['bcs_radialmenu']:RemoveOption('veh_control')
end)

AddEventHandler('esx:playerLoaded', function()
    SetupVehicleControl()
end)

CreateThread(function()
    SetupVehicleControl()
end)

function SetupVehicleControl()
    exports.bcs_radialmenu:RegisterMenus({
        {
            menu = 'vehicle_menu',
            options = {
                {
                    label = 'Seat Menu',
                    image = 'vehicle_seat',
                    menu = 'seat_menu'
                },
                {
                    label = 'Door Menu',
                    image = 'vehicle_door_1',
                    menu = 'door_menu'
                },
                {
                    label = 'Engine',
                    image = 'vehicle_engine',
                    onSelect = function()
                        EngineControl()
                    end
                },
                {
                    label = 'Window',
                    image = 'vehicle_window_1',
                    menu = 'windows_menu'
                },
            }
        },
        {
            menu = 'windows_menu',
            options = {
                {
                    label = 'Driver',
                    image = 'vehicle_window_1',
                    onSelect = function()
                        WindowControl(0, 0)
                    end
                },
                {
                    label = 'Passenger',
                    image = 'vehicle_window_2',
                    onSelect = function()
                        WindowControl(1, 1)
                    end
                },
                {
                    label = 'Driver Side Rear',
                    image = 'vehicle_window_3',
                    onSelect = function()
                        WindowControl(2, 2)
                    end
                },
                {
                    label = 'Passenger Side Rear',
                    image = 'vehicle_window_4',
                    onSelect = function()
                        WindowControl(3, 3)
                    end
                }
            }
        }
    })
end

-----------------------------------------------------------------------------
-- ACTION FUNCTIONS
-----------------------------------------------------------------------------

function EngineControl()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
        SetVehicleEngineOn(vehicle, (not GetIsVehicleEngineRunning(vehicle)), false, true)
    end
end

function DoorControl(door)
    if IsPedSittingInAnyVehicle(cache.ped) then
        local vehicle = GetVehiclePedIsIn(cache.ped, false)
        if GetVehicleDoorAngleRatio(vehicle, door) > 0.0 then
            SetVehicleDoorShut(vehicle, door, false)
        else
            SetVehicleDoorOpen(vehicle, door, false)
        end
    end
end

function SeatControl(seat)
    local speed = GetEntitySpeed(cache.vehicle)
    local kmh = speed * 3.6
    if IsPedSittingInAnyVehicle(cache.ped) then
        local vehicle = GetVehiclePedIsIn(cache.ped, false)
        if IsVehicleSeatFree(vehicle, seat) then
            if kmh <= 100.0 then
                SetPedIntoVehicle(cache.ped, vehicle, seat)
            else
                Notify('Kendaraan terlalu cepat', 'error')
            end
        end
    end
end

function WindowControl(window, door)
    if IsPedSittingInAnyVehicle(cache.ped) then
        local vehicle = GetVehiclePedIsIn(cache.ped, false)
        if window == 0 then
            if windowState1 == true and DoesVehicleHaveDoor(vehicle, door) then
                RollDownWindow(vehicle, window)
                windowState1 = false
            else
                RollUpWindow(vehicle, window)
                windowState1 = true
            end
        elseif window == 1 then
            if windowState2 == true and DoesVehicleHaveDoor(vehicle, door) then
                RollDownWindow(vehicle, window)
                windowState2 = false
            else
                RollUpWindow(vehicle, window)
                windowState2 = true
            end
        elseif window == 2 then
            if windowState3 == true and DoesVehicleHaveDoor(vehicle, door) then
                RollDownWindow(vehicle, window)
                windowState3 = false
            else
                RollUpWindow(vehicle, window)
                windowState3 = true
            end
        elseif window == 3 then
            if windowState4 == true and DoesVehicleHaveDoor(vehicle, door) then
                RollDownWindow(vehicle, window)
                windowState4 = false
            else
                RollUpWindow(vehicle, window)
                windowState4 = true
            end
        end
    end
end

function FrontWindowControl()
    if IsPedSittingInAnyVehicle(cache.ped) then
        local vehicle = GetVehiclePedIsIn(cache.ped, false)
        if windowState1 == true or windowState2 == true then
            RollDownWindow(vehicle, 0)
            RollDownWindow(vehicle, 1)
            windowState1 = false
            windowState2 = false
        else
            RollUpWindow(vehicle, 0)
            RollUpWindow(vehicle, 1)
            windowState1 = true
            windowState2 = true
        end
    end
end

function BackWindowControl()
    if IsPedSittingInAnyVehicle(cache.ped) then
        local vehicle = GetVehiclePedIsIn(cache.ped, false)
        if windowState3 == true or windowState4 == true then
            RollDownWindow(vehicle, 2)
            RollDownWindow(vehicle, 3)
            windowState3 = false
            windowState4 = false
        else
            RollUpWindow(vehicle, 2)
            RollUpWindow(vehicle, 3)
            windowState3 = true
            windowState4 = true
        end
    end
end

function AllWindowControl()
    if IsPedSittingInAnyVehicle(cache.ped) then
        local vehicle = GetVehiclePedIsIn(cache.ped, false)
        if windowState1 == true or windowState2 == true or windowState3 == true or windowState4 == true then
            RollDownWindow(vehicle, 0)
            RollDownWindow(vehicle, 1)
            RollDownWindow(vehicle, 2)
            RollDownWindow(vehicle, 3)
            windowState1 = false
            windowState2 = false
            windowState3 = false
            windowState4 = false
        else
            RollUpWindow(vehicle, 0)
            RollUpWindow(vehicle, 1)
            RollUpWindow(vehicle, 2)
            RollUpWindow(vehicle, 3)
            windowState1 = true
            windowState2 = true
            windowState3 = true
            windowState4 = true
        end
    end
end

function BombBayControl()
    if IsPedSittingInAnyVehicle(cache.ped) then
        local vehicle = GetVehiclePedIsIn(cache.ped, false)
        if AreBombBayDoorsOpen(vehicle) then
            CloseBombBayDoors(vehicle)
        else
            OpenBombBayDoors(vehicle)
        end
    end
end

-----------------------------------------------------------------------------
-- VEHICLE COMMANDS
-----------------------------------------------------------------------------
if Config.UseVehControlCommands then
    -- ENGINE
    TriggerEvent('chat:addSuggestion', '/engine', 'Start/Stop Engine')

    RegisterCommand('engine', function(source, args, rawCommand)
        EngineControl()
    end, false)

    -- DOORS
    TriggerEvent('chat:addSuggestion', '/door', 'Open/Close Vehicle Door', {
        { name = 'ID', help = '1) Driver, 2) Passenger, 3) Driver Side Rear, 4) Passenger Side Rear' },
    })

    RegisterCommand('door', function(source, args, rawCommand)
        local doorID = tonumber(args[1])
        if doorID ~= nil then
            if doorID == 1 then
                DoorControl(0)
            elseif doorID == 2 then
                DoorControl(1)
            elseif doorID == 3 then
                DoorControl(2)
            elseif doorID == 4 then
                DoorControl(3)
            end
        else
            TriggerEvent('chatMessage', 'Usage: ', { 255, 0, 0 }, '/door [door id]')
        end
    end, false)

    -- SEAT
    TriggerEvent('chat:addSuggestion', '/seat', 'Move to a seat', {
        { name = 'ID', help = '1) Driver, 2) Passenger, 3) Driver Side Rear, 4) Passenger Side Rear' },
    })

    RegisterCommand('seat', function(source, args, rawCommand)
        local seatID = tonumber(args[1])
        if seatID ~= nil then
            if seatID == 1 then
                SeatControl(-1)
            elseif seatID == 2 then
                SeatControl(0)
            elseif seatID == 3 then
                SeatControl(1)
            elseif seatID == 4 then
                SeatControl(2)
            end
        else
            TriggerEvent('chatMessage', 'Usage: ', { 255, 0, 0 }, '/seat [seat id]')
        end
    end, false)

    -- WINDOWS
    TriggerEvent('chat:addSuggestion', '/window', 'Roll Up/Down Window', {
        { name = 'ID', help = '1) Driver, 2) Passenger, 3) Driver Side Rear, 4) Passenger Side Rear' },
    })

    RegisterCommand('window', function(source, args, rawCommand)
        local windowID = tonumber(args[1])

        if windowID ~= nil then
            if windowID == 1 then
                WindowControl(0, 0)
            elseif windowID == 2 then
                WindowControl(1, 1)
            elseif windowID == 3 then
                WindowControl(2, 2)
            elseif windowID == 4 then
                WindowControl(3, 3)
            end
        else
            TriggerEvent('chatMessage', 'Usage: ', { 255, 0, 0 }, '/window [door id]')
        end
    end, false)

    -- HOOD
    TriggerEvent('chat:addSuggestion', '/hood', 'Open/Close Hood')

    RegisterCommand('hood', function(source, args, rawCommand)
        DoorControl(4)
    end, false)

    -- TRUNK
    TriggerEvent('chat:addSuggestion', '/trunk', 'Open/Close Trunk')

    RegisterCommand('trunk', function(source, args, rawCommand)
        DoorControl(5)
    end, false)

    -- FRONT WINDOWS
    TriggerEvent('chat:addSuggestion', '/windowfront', 'Roll Up/Down Front Windows')

    RegisterCommand('windowfront', function(source, args, rawCommand)
        FrontWindowControl()
    end, false)

    -- BACK WINDOWS
    TriggerEvent('chat:addSuggestion', '/windowback', 'Roll Up/Down Back Windows')

    RegisterCommand('windowback', function(source, args, rawCommand)
        BackWindowControl()
    end, false)

    -- ALL WINDOWS
    TriggerEvent('chat:addSuggestion', '/windowall', 'Roll Up/Down All Windows')

    RegisterCommand('windowall', function(source, args, rawCommand)
        AllWindowControl()
    end, false)
end
