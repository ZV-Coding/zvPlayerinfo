fx_version 'cerulean'
game 'gta5'
version '1.0'
lua54 'on'

author 'Zv Coding'
description 'Playerinfo Script'


client_scripts{
	'config.lua',
	'client/client.lua',
	'@es_extended/locale.lua',
}

server_scripts {
	'config.lua',
	'server/server.lua',
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
}

escrow_ignore {
	'config.lua',
	'client/client.lua',
	'server/server.lua',
}