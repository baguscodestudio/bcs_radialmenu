# BCS Radial Menu V2

![Thumbnail](https://cdn.discordapp.com/attachments/853638271430557747/1281238400023793674/Thumbnail_Radialmenu.png?ex=66dafdbe&is=66d9ac3e&hm=ef3c01414990d11f680ffb1dfdb58b6b97feeedc59a4f8e449911e98fd543cf2&)

A fresh new look of a unique radial menu for FiveM

## Features

- Optimized 0.00
- Smooth animation and Clean UI
- Flexible menu with exports for addition on the go
- Supports ESX and QBCore for job menu

## [Youtube](https://youtu.be/HR9OwqEdow4)

## Documentation

In `config/menu.lua` you can add more options for your radial menu using these properties. `config/job.lua` are the same, the difference is just on the first key must be the **job name**.

#### Menu or Submenu

```lua
    {
        menu = 'home', -- ID of the menu
        isHome = true,
        options = {
            -- See the content examples in Option
        }
    },
```

- `menu` (string): The ID of the menu, used for submenu if its a submenu
- `isHome`? (boolean): Should only be for one object of the array, to indicate the home or the initial menu options
- `options` (table): An array of tables with **Options**

#### Option

```lua
    options = {
        {
            label = 'Interaction Menu',
            images = 'https://www.pngfind.com/pngs/m/686-6862044_minecraft-dirt-block-png-minecraft-logo-png-transparent.png',
            menu = 'interaction_menu'
        },
        {
            label = 'Open Your Phone',
            icon = 'fa-solid fa-mobile-screen-button',
            onSelect = function()
                ExecuteCommand('+use_phone_key')
            end
        },
        {
            label = 'Toggle Shoes',
            image = 'shoes',
            event = 'Clothing:client:RemoveClothes',
            args = { 'shoes' }
        },
    }
```

- `label` (string): The title that will appear in the middle
- `images`? (string): This can be a link or the file name for the image within the **html/images/** folder
- `icon`? (string): Uses the icon from [fontawesome](https://fontawesome.com/icons)
- `onSelect`? (function): A function that will be triggered after selecting the option
- `event`? (string): The event that will be triggered after selecting
- `args`? (table): Array of any type of data that will be sent to the event triggered

### Exports

You can check more of this example usage within the `example.lua` file.

#### RegisterMenus

```lua
    -- exports.bcs_radialmenu:RegisterMenus(Menus: table)
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
                    label = 'Engine',
                    image = 'vehicle_engine',
                    onSelect = function()
                        EngineControl()
                    end
                },
            }
        },
    })
```

This is for registering the menus that can be called later on.

- `Menus` (table): An array of menu

#### AddOption

```lua
    -- exports.bcs_radialmenu:AddOption(Menu: table)
    exports.bcs_radialmenu:AddOption({
        id = 'veh_control',
        label = 'Vehicle',
        icon = 'fa-solid fa-car',
        menu = 'vehicle_menu'
    })
```

Adds the option to the **Home** menu

- `Menu` (table): An object of menu

#### RemoveOption

```lua
    -- exports.bcs_radialmenu:RemoveOption(menu_id: string)
    exports.bcs_radialmenu:RemoveOption('veh_control')
```

Removes the option from the **Home** menu

- `menu_id` (string): The menu ID

Further option can be seen in the `config` folder!

## Contributing

Contribution is welcome! Feel free to fork and create a pull request. I believe my code is still messy and needs more refactoring (as of 0.7.0 release)

## Support

Further support or issue can be submitted in the github issue or in my [discord](https://discord.gg/92JZmrMMez) in the public chat.

### Other Scripts

**Paid**

- [Company Manager (Bill, Boss Menu, Duty)](https://forum.cfx.re/t/esx-qb-boss-and-billing-menu-company-manager-updated-v3/4805265)
- [License Manager (ID Card + Badge + License)](https://forum.cfx.re/t/esx-qb-mb-license-manager-v3/4808241/)
- [Housing Script](https://forum.cfx.re/t/esx-qb-housing-with-mlo-shells-mortgage/4913311)
- [Jobcenter](https://forum.cfx.re/t/job-center-joblisting-menu-v2-clean-configurable/4797677)

**Free**

- [HUD](https://forum.cfx.re/t/notification-ui-drawtext-keyboardinput-confirmation-menu/4831831)
- [Radialmenu](https://forum.cfx.re/t/free-radial-menu-new-minimalistic-and-optimized-esx-qb-standalone/4791991/1)
- [Questionare](https://forum.cfx.re/t/standalone-questionare-quiz-test-ui-with-easy-exports/4803161)
- [Prop Animation Tool](https://forum.cfx.re/t/free-dev-tool-ped-animation-and-prop-menu/4785352)
