# BCS Radial Menu

This project is to freshen up the options for free radial menu for FiveM. It is inspired by qb-radialmenu config and [nashvail](https://github.com/nashvail/ReactPathMenu) radial menu design.

## Features

- Optimized 0.00 (Depending on your framework max tested is 0.03)
- Minimalistic Design with tooltip for label
- Responsive Design
- Flexible menu with exports for addition on the go
- Supports ESX and QBCore for job menu

## Screenshots & Preview

[Youtube](https://youtu.be/_LYpRTBsNf0)
![Preview](https://cdn.discordapp.com/attachments/817613758376706089/923251874906386442/unknown.png)

## Documentation

A Menu option will have the properties of
|Properties|Detail|
|----------|-----------|
|label |Text to display in the tooltip (Must be unique)|
|icon |Icon string (here is the [list](https://react-icons.github.io/react-icons/icons?name=md))|
|event |Client or Server event to trigger|
|client |True to trigger a client event and false to trigger server event|
|shouldClose|Whether or not if the menu should close after clicking the option|
|args |Arguments when triggering the event (Optional)|

To add an option in the home menu you can use

```lua
exports['hud']:addMenu({
    label = 'the label you want',
    icon = 'MdPhone', -- For example
    event = 'open:phone',
    client = true,
    shouldClose = true,
    args = {'test', '123', 4}
})
```

Don't forget to remove the menu after you are done with it. It takes the label property as its argument.

```lua
exports['hud']:removeMenu('the label you want')
```

To Create a menu option with a submenu, label, icon, and submenu properties are needed. In theory it should be possible to create as many submenu you want.
For Example:

```lua
{
    label = 'Job Menu',
    icon = 'MdWork',
    submenu = {
        {
            label = 'the label you want',
            icon = 'MdPhone', -- For example
            event = 'open:phone',
            client = true,
            shouldClose = true,
            args = {'test', '123', 4}
        },
        -- and continues
    }
}
```

Further option can be seen in the config.lua folder!

## Contributing

Contribution is welcome! Feel free to fork and create a pull request. I believe my code is still messy and needs more refactoring (as of 0.7.0 release)

## Support

Further support or issue can be submitted in the github issue or in my (discord)[https://discord.gg/caa7xt2d8G]

### Other Scripts

- [propanimenu](https://github.com/baguscodestudio/propanimenu)

## Acknowledgements

- [Nashvail tutorial](https://github.com/nashvail/ReactPathMenu)
- [qb-radialmenu](https://github.com/qbcore-framework/qb-radialmenu)
