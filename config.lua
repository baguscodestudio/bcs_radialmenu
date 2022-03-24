Config = {}

Config.Framework = 'ESX' -- ESX/QB/Standalone

--[[
    Things to note
    Label must be unique!
    Event, shouldclose, and client must exist if there is not submenu property
    args is optional
]]
local container = 120

Config.UI = {
    -- Everything is in px
    Size = {
        BUTTON_SIZE = 56,
        ITEM_SIZE = 48,
        CONTAINER_SIZE = container,
        RADIUS = container / 2,
        ICON_SIZE = 20
    },
    -- Colors must be a string
    Colors = {
        PRIMARY = '#00b4d8',
        PRIMARY_2 = '#0096c7',
        BORDER = '#dadada',
        TEXT = '#656565',
    }
}

Config.Open = {
    key = 'f1',
    commandonly = false, -- if this is true then it opens with command
    command = 'radialmenu'
}

Config.RadialMenu = {
    {
        label="Open Phone",
        event="Phone:radialOpen",
        shouldClose=true,
        icon="MdPhoneIphone",
        client=true
    },
    {
        label="User Menu",
        icon="MdPerson",
        submenu= {
            {
                label="Example 1",
                event="Example:event",
                shouldClose=true,
                icon="MdAccountBox",
                client=true
            },
            {
                label="Example 2",
                event="Example:event",
                shouldClose=true,
                icon="MdAccountBox",
                client=true
            },
            {
                label="Example 3",
                event="Example:event",
                shouldClose=true,
                icon="MdAccountBox",
                client=true
            },
        }
    },
    {
        label="Open Clothes Menu",
        icon="MdSettingsAccessibility",
        submenu= {
            {
                label="Restore clothes",
                icon="MdAccountBox",
                client=true,
                shouldClose=true,
                event="radial:restoreclothes"
            },
            {
                label="Clothes menu",
                icon="MdAccountBox",
                submenu = {
                    {
                        label="Remove Top",
                        event="radial:removeclothes",
                        shouldClose=true,
                        icon="MdAccountBox",
                        args={'top'},
                        client=true
                    },
                    {
                        label="Remove Pants",
                        event="radial:removeclothes",
                        shouldClose=true,
                        icon="MdAccountBox",
                        args={'pants'},
                        client=true
                    },
                    {
                        label="Remove Shoes",
                        event="radial:removeclothes",
                        shouldClose=true,
                        icon="MdAccountBox",
                        args={'shoes'},
                        client=true
                    },
                    {
                        label="Remove Bag",
                        event="radial:removeclothes",
                        shouldClose=true,
                        icon="MdAccountBox",
                        args={'bag'},
                        client=true
                    },
                    {
                        label="Remove Vest",
                        event="radial:removeclothes",
                        shouldClose=true,
                        icon="MdAccountBox",
                        args={'vest'},
                        client=true
                    },
                    {
                        label="Remove Mask",
                        event="radial:removeclothes",
                        shouldClose=true,
                        icon="MdAccountBox",
                        args={'mask'},
                        client=true
                    },
                }
            },
            {
                label="Accessories menu",
                icon="MdAccountBox",
                submenu = {
                    {
                        label="Remove Earings",
                        event="radial:removeaccessories",
                        shouldClose=true,
                        icon="MdAccountBox",
                        args={'ears'},
                        client=true
                    },
                    {
                        label="Remove Hat",
                        event="radial:removeaccessories",
                        shouldClose=true,
                        icon="MdAccountBox",
                        args={'hat'},
                        client=true
                    },
                    {
                        label="Remove Watch",
                        event="radial:removeaccessories",
                        shouldClose=true,
                        icon="MdAccountBox",
                        args={'watch'},
                        client=true
                    },
                    {
                        label="Remove Bracelet",
                        event="radial:removeaccessories",
                        shouldClose=true,
                        icon="MdAccountBox",
                        args={'bracelet'},
                        client=true
                    },
                    {
                        label="Remove Glasses",
                        event="radial:removeaccessories",
                        shouldClose=true,
                        icon="MdAccountBox",
                        args={'glasses'},
                        client=true
                    },
                }
            },
        }
    },
}

Config.DeadMenu = {
    {
        label="Call Ambulance",
        event="esx_ambulancejob:call",
        shouldClose=true,
        icon="MdMedicalServices",
        client=true
    },
    {
        label="Refresh body",
        event="esx_ambulancejob:refreshBody",
        shouldClose=true,
        icon="MdMedicalServices",
        client=true
    },
}

Config.JobOption = {
    label = 'Job Menu',
    icon = 'MdWork',
}

Config.JobMenu = {
    ambulance = {
        {
            label="Stretcher Menu",
            icon="MdHotel",
            submenu= {
                {
                    label="Spawn Stretcher",
                    event="stretcher:spawn",
                    shouldClose=true,
                    icon="MdHotel",
                    client=true
                },
                {
                    label="Push Stretcher",
                    event="stretcher:push",
                    shouldClose=true,
                    icon="MdDirectionsWalk",
                    client=true
                },
                {
                    label="Delete Stretcher",
                    event="stretcher:delete",
                    shouldClose=true,
                    icon="MdClose",
                    client=true
                },
                {
                    label="Get Stretcher inside/out",
                    event="stretcher:toggleToCar",
                    shouldClose=true,
                    icon="MdLocalShipping",
                    client=true
                },
                {
                    label="Put/Pick patient to stretcher",
                    event="stretcher:togglePatient",
                    shouldClose=true,
                    icon="MdMedicalServices",
                    client=true
                },
            }
        },
        {
            label = "Revive Citizen",
            icon='MdMedicalServices',
            shouldClose = true,
            event="esx_ambulancejob:reviveNearby",
            client= true
        },
        {
            label = "Bandage Citizen",
            icon='MdMedicalServices',
            shouldClose = true,
            event="esx_ambulancejob:heal",
            client= true
        }
    },
    police = {
        {
            label='Citizen Interaction',
            icon="MdAccountCircle",
            submenu={
                {
                    label="Fine Citizen",
                    event="esx_policejob:actions",
                    shouldClose=true,
                    icon="MdReceipt",
                    args={'fine'},
                    client=true
                },
                {
                    label="Cuff",
                    event="esx_policejob:actions",
                    shouldClose=true,
                    icon="MdOutlineLock",
                    args={'cuff'},
                    client=true
                },
                {
                    label="Uncuff",
                    event="esx_policejob:actions",
                    shouldClose=true,
                    icon="MdOutlineLockOpen",
                    args={'uncuff'},
                    client=true
                },
                {
                    label="Search Citizen",
                    event="esx_policejob:actions",
                    shouldClose=true,
                    icon="MdOutlineSearch",
                    args={'search'},
                    client=true
                },
                {
                    label="Drag Citizen",
                    event="esx_policejob:actions",
                    shouldClose=true,
                    icon="MdSportsKabaddi",
                    args={'drag'},
                    client=true
                },
                {
                    label="Put In Vehicle",
                    event="esx_policejob:actions",
                    shouldClose=true,
                    icon="MdDirectionsCar",
                    args={'drag'},
                    client=true
                },
                {
                    label="Put Out Vehicle",
                    event="esx_policejob:actions",
                    shouldClose=true,
                    icon="MdDirectionsCarFilled",
                    args={'outveh'},
                    client=true
                },
            }
        },
        {
            label = 'Vehicle Interaction',
            icon="MdDirectionsCarFilled",
            submenu = {
                {
                    label = 'Impound vehicle',
                    event = 'hrpd_h_impound:openImpound',
                    icon="MdDirectionsCarFilled",
                    shouldClose = true,
                    client = true,
                }
            }
        }
    },
    mafia={
        {
            label="Tie Citizen",
            event="esx_mafiajob:actions",
            shouldClose=true,
            icon="MdOutlineLock",
            args={'cuff'},
            client=true
        },
        {
            label="Untie",
            event="esx_mafiajob:actions",
            shouldClose=true,
            icon="MdOutlineLockOpen",
            args={'uncuff'},
            client=true
        },
        {
            label="Search Citizen",
            event="esx_mafiajob:actions",
            shouldClose=true,
            icon="MdOutlineSearch",
            args={'search'},
            client=true
        },
    },
    cartel={
        {
            label="Tie Citizen",
            event="esx_carteljob:actions",
            shouldClose=true,
            icon="MdOutlineLock",
            args={'cuff'},
            client=true
        },
        {
            label="Untie",
            event="esx_carteljob:actions",
            shouldClose=true,
            icon="MdOutlineLockOpen",
            args={'uncuff'},
            client=true
        },
        {
            label="Search Citizen",
            event="esx_carteljob:actions",
            shouldClose=true,
            icon="MdOutlineSearch",
            args={'search'},
            client=true
        },
    }
}