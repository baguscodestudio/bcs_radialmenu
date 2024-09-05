fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'bcs_radialmenu'
author 'baguscodestudio'
version '2.0.0'
repository 'https://github.com/baguscodestudio/bcs_radialmenu'
description 'A radial menu for FiveM'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/assets/*.css',
	'html/assets/*.js',
	'html/images/*'
}

shared_scripts {
	'@ox_lib/init.lua',
	'config/*.lua'
}

client_scripts {
	'client/framework/*.lua',
	'client/*.lua',
}
