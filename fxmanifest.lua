fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name         'bcs_radialmenu'
author       'baguscodestudio'
version      '1.0.0'
repository   'https://github.com/baguscodestudio/bcs_radialmenu'
description  'A radial menu for FiveM'

ui_page 'web/html/index.html'

files {
    'web/html/index.html',
    'web/html/assets/*.css',
    'web/html/assets/*.js'
}

client_scripts {
    'config.lua',
    'client/main.lua'
}

