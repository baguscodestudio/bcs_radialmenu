Config = Config or {}

Config.Menu = {
    {
        menu = 'home', -- ID of the menu
        isHome = true,
        options = {
            -- {
            --     label = 'Minecraft?',
            --     image =
            --     'https://www.pngfind.com/pngs/m/686-6862044_minecraft-dirt-block-png-minecraft-logo-png-transparent.png',
            --     event = 'Minecraft:client:InFivem',
            -- },
            {
                label = 'Interaction Menu',
                icon = 'fa-solid fa-person',
                menu = 'interaction_menu'
            },
            {
                label = 'Clothing Menu',
                icon = 'fa-solid fa-shirt',
                menu = 'clothing_menu'
            },
            {
                label = 'Open Your Phone',
                icon = 'fa-solid fa-mobile-screen-button',
                onSelect = function()
                    ExecuteCommand('+use_phone_key')
                end
            },
            {
                label = 'Mood',
                icon = 'fa-solid fa-face-smile',
                menu = 'emote_menu'
            },
        },
    },
    {
        menu = 'clothing_menu',
        options = {
            {
                label = 'Toggle Top',
                icon = 'fa-solid fa-shirt',
                event = 'Clothing:client:RemoveClothes',
                args = { 'top' }
            },
            {
                label = 'Toggle Pants',
                image = 'pants',
                event = 'Clothing:client:RemoveClothes',
                args = { 'pants' }
            },
            {
                label = 'Toggle Shoes',
                image = 'shoes',
                event = 'Clothing:client:RemoveClothes',
                args = { 'shoes' }
            },
            {
                label = 'Toggle Bag',
                icon = 'fa-solid fa-bag-shopping',
                event = 'Clothing:client:RemoveClothes',
                args = { 'bag' }
            },
            {
                label = 'Toggle Vest',
                icon = 'fa-solid fa-vest',
                event = 'Clothing:client:RemoveClothes',
                args = { 'vest' }
            },
            {
                label = 'Accessories Menu',
                icon = 'fa-solid fa-glasses',
                menu = 'accessories_menu'
            },
            {
                label = 'Reset Clothing',
                icon = 'fa-solid fa-rotate-left',
                event = 'Clothing:client:RestoreClothes'
            }
        },
    },
    {
        menu = 'emote_menu',
        options = {
            {
                label = 'Reset Mood',
                icon = 'fa-solid fa-face-meh',
                onSelect = function()
                    ExecuteCommand('mood reset')
                end
            },
            {
                label = 'Happy',
                icon = 'fa-solid fa-face-laugh',
                onSelect = function()
                    ExecuteCommand('mood happy')
                end
            },
            {
                label = 'Angry',
                icon = 'fa-solid fa-face-angry',
                onSelect = function()
                    ExecuteCommand('mood angry')
                end
            },
            {
                label = 'Crying',
                icon = 'fa-solid fa-face-sad-cry',
                onSelect = function()
                    ExecuteCommand('mood crying')
                end
            },
            {
                label = 'Grumpy',
                icon = 'fa-solid fa-face-frown',
                onSelect = function()
                    ExecuteCommand('mood grumpy2')
                end
            },
            {
                label = 'Drunk',
                icon = 'fa-solid fa-face-dizzy',
                onSelect = function()
                    ExecuteCommand('mood drunk')
                end
            },
        },
    },
    {
        menu = 'accessories_menu',
        options = {
            {
                label = 'Toggle Mask',
                icon = 'fa-solid fa-mask-face',
                event = 'Clothing:client:RemoveClothes',
                args = { 'mask' }
            },
            {
                label = 'Toggle Scarf/Chain',
                image = 'scarf',
                event = 'Clothing:client:RemoveClothes',
                args = { 'chain' }
            },
            {
                label = 'Toggle Glasses',
                icon = 'fa-solid fa-glasses',
                event = 'Clothing:client:RemoveClothes',
                args = { 'glasses' }
            },
            {
                label = 'Toggle Ears',
                icon = 'fa-solid fa-headphones',
                event = 'Clothing:client:RemoveClothes',
                args = { 'ears' }
            },
            {
                label = 'Toggle Hats',
                icon = 'fa-solid fa-hat-cowboy-side',
                event = 'Clothing:client:RemoveClothes',
                args = { 'hats' }
            },
            {
                label = 'Toggle Bracelets',
                image = 'bracelet',
                event = 'Clothing:client:RemoveClothes',
                args = { 'bracelets' }
            },
            {
                label = 'Toggle Watch',
                image = 'watch',
                event = 'Clothing:client:RemoveClothes',
                args = { 'watch' }
            },
        }
    },
    {
        menu = 'interaction_menu',
        options = {
            {
                label = 'Steal',
                icon = 'fa-solid fa-people-robbery',
                onSelect = function()
                    ExecuteCommand('steal')
                end
            },
            {
                label = 'Carry',
                icon = 'fa-solid fa-person',
                onSelect = function()
                    ExecuteCommand('carry')
                end
            },
            {
                label = 'Billing Menu',
                icon = 'fa-solid fa-file-invoice-dollar',
                onSelect = function()
                    ExecuteCommand('billing')
                end
            }
        }
    },
}
