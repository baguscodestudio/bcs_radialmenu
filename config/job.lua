Config = Config or {}

Config.JobMenu = {
    police = {
        {
            menu = 'police_menu',
            options = {
                {
                    label = 'Citizen Menu',
                    menu = 'police_citizen_menu',
                    icon = 'fa-solid fa-people-group'
                },
                {
                    label = 'Vehicle Menu',
                    menu = 'police_vehicle_menu',
                    icon = 'fa-solid fa-car'
                },
                {
                    label = 'Radio Menu',
                    menu = 'police_radio_menu',
                    icon = 'fa-solid fa-walkie-talkie'
                },
                {
                    label = 'Object Menu',
                    menu = 'police_object_menu',
                    icon = 'fa-solid fa-circle-dot'
                }
            }
        },
        {
            menu = 'police_citizen_menu',
            options = {
                {
                    label = 'Fine Citizen',
                    event = 'bcs_jobs:police:client:action',
                    icon = 'fa-solid fa-file-invoice-dollar',
                    args = { 'fine' },
                },
                {
                    label = 'Cuff',
                    event = 'bcs_jobs:police:client:action',
                    image = 'handcuff',
                    args = { 'cuff' },
                },
                {
                    label = 'Uncuff',
                    event = 'bcs_jobs:police:client:action',
                    image = 'handcuff',
                    args = { 'uncuff' },
                },
                {
                    label = 'Search Citizen',
                    event = 'bcs_jobs:police:client:action',
                    icon = 'fa-solid fa-people-robbery',
                    args = { 'search' },
                },
                {
                    label = 'Drag Citizen',
                    event = 'bcs_jobs:police:client:action',
                    icon = 'fa-solid fa-people-pulling',
                    args = { 'drag' },
                },
                {
                    label = 'Put In Vehicle',
                    event = 'bcs_jobs:police:client:action',
                    icon = 'fa-solid fa-car',
                    args = { 'putinveh' },
                },
                {
                    label = 'Put Out Vehicle',
                    event = 'bcs_jobs:police:client:action',
                    icon = 'fa-solid fa-car-rear',
                    args = { 'outveh' },
                },
            }
        },
        {
            menu = 'police_vehicle_menu',
            options = {
                {
                    label = 'Impound vehicle',
                    event = 'garages:client:ImpoundVehicle',
                    icon = 'fa-solid fa-car-burst',
                },
                {
                    label = 'Send vehicle to Depot',
                    event = 'garages:client:DeleteVehicle',
                    icon = 'fa-solid fa-car-on',
                },
                {
                    label = 'Hijack vehicle',
                    event = 'vehiclekeys:client:HijackVehicle',
                    icon = 'fas fa-lock-open',
                },
            }
        },
        {
            menu = 'police_radio_menu',
            options = {
                {
                    label = 'Central PD',
                    event = 'bcs_jobs:police:client:ChangeRadio',
                    icon = 'fa-solid fa-walkie-talkie',
                    args = { 1 },
                },
                {
                    label = 'Central SD',
                    event = 'bcs_jobs:police:client:ChangeRadio',
                    icon = 'fa-solid fa-walkie-talkie',
                    args = { 2 },
                },
                {
                    label = 'TEC-1',
                    event = 'bcs_jobs:police:client:ChangeRadio',
                    icon = 'fa-solid fa-walkie-talkie',
                    args = { 3 },
                },
                {
                    label = 'TEC-2',
                    event = 'bcs_jobs:police:client:ChangeRadio',
                    icon = 'fa-solid fa-walkie-talkie',
                    args = { 4 },
                },
                {
                    label = 'TEC-3',
                    event = 'bcs_jobs:police:client:ChangeRadio',
                    icon = 'fa-solid fa-walkie-talkie',
                    args = { 5 },
                },
                {
                    label = 'Turn On / Off',
                    event = 'bcs_jobs:police:client:LeaveRadio',
                    icon = 'fa-solid fa-power-off',
                },
            }
        },
        {
            menu = 'police_object_menu',
            options = {
                {
                    label = 'Cone',
                    icon = 'fa-solid fa-triangle-exclamation',
                    event = 'bcs_jobs:police:client:SpawnObject',
                    args = { 'prop_mp_cone_02' },
                },
                {
                    label = 'Gate',
                    icon = 'fa-solid fa-torii-gate',
                    event = 'bcs_jobs:police:client:SpawnObject',
                    args = { 'prop_barrier_work06a' },
                },
                {
                    label = 'Speed Limit Sign',
                    icon = 'fa-solid fa-sign-hanging',
                    event = 'bcs_jobs:police:client:SpawnObject',
                    args = { 'prop_snow_sign_road_06g' },
                },
                {
                    label = 'Tent',
                    icon = 'fa-solid fa-tent',
                    event = 'bcs_jobs:police:client:SpawnObject',
                    args = { 'prop_gazebo_03' },
                },
                {
                    label = 'Lighting',
                    icon = 'fa-solid fa-traffic-light',
                    event = 'bcs_jobs:police:client:SpawnObject',
                    args = { 'prop_worklight_03b' },
                },
            }
        },
    },
    mechanic = {
        {
            menu = 'mechanic_menu',
            options = {
                {
                    label = 'Towing',
                    icon = 'fa-solid fa-truck-fast',
                    event = 'mechanic:client:TowVehicle',
                }
            }
        }
    },
    ambulance = {
        {
            menu = 'ambulance_menu',
            options = {
                {
                    label = 'Spawn Stretcher',
                    icon = 'fa-solid fa-bed',
                    onSelect = function()
                        TriggerServerEvent('bcs_jobs:ambulance:server:SpawnStretcher')
                    end,
                },
                {
                    label = 'Get Stretcher inside/out',
                    event = 'bcs_jobs:ambulance:client:ToggleToCar',
                    icon = 'fa-solid fa-truck-medical',
                },
                {
                    label = 'Revive Citizen',
                    icon = 'fa-solid fa-star-of-life',
                    event = 'bcs_jobs:ambulance:client:RevivePlayer',
                },
                {
                    label = 'Bandage Citizen',
                    icon = 'fa-solid fa-kit-medical',
                    event = 'bcs_jobs:ambulance:client:BandagePlayer',
                },
                {
                    label = 'Check Status',
                    icon = 'fa-solid fa-bed-pulse',
                    event = 'bcs_jobs:ambulance:client:CheckStatusPlayer',
                },
                {
                    label = 'Pull Victim',
                    icon = 'fa-solid fa-people-pulling',
                    event = 'bcs_jobs:ambulance:client:PullVictim',
                },
            }
        }
    }
}
