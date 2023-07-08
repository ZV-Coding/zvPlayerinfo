ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local function checkAdmin(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "admin" then
		return true
	end
	return false
end

RegisterServerEvent('zvPlayerinfo:sendWebhook')
AddEventHandler('zvPlayerinfo:sendWebhook', function(webhookUrl, message, playerName, playerIp)
	local name = GetPlayerName(source)
	local steam = GetPlayerIdentifier(source)
	local ip = GetPlayerEndpoint(source)
	local identifiers = ExtractIdentifiers(source)
	local license = identifiers.license
	local discord ="<@" ..identifiers.discord:gsub("discord:", "")..">" 
	if Config.WebhookToggle then
		connect = {
			{
				["color"] = Config.EmbedColor,
				["title"] = Config.Title,
				["description"] = "**•** " ..Config.Steam.. ": **" ..playerName.. "**\n**•** " ..Config.CommandUsed.. ": **/" ..Config.Command.. "**\n**•** " ..Config.Status.. ": **" ..Config.OnText.. "**\n\n Discord: **" ..discord.. "**\n " ..Config.PlayerIp.. ": **" ..playerIp.. "**\n " ..license.. "",
				["thumbnail"] = {
					["url"] = Config.ThumbnailImage,
				},
				["footer"] = {
					["text"] = Config.FooterText.. " | by ZV Coding",
				}
			}
		}

		PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode({username = Config.WebhookName, embeds = connect}), { ['Content-Type'] = 'application/json' })
	end
end)

RegisterServerEvent('zvPlayerinfo:sendWebhook2')
AddEventHandler('zvPlayerinfo:sendWebhook2', function(webhookUrl, message, playerName, playerIp)
	local name = GetPlayerName(source)
	local steam = GetPlayerIdentifier(source)
	local ip = GetPlayerEndpoint(source)
	local identifiers = ExtractIdentifiers(source)
	local license = identifiers.license
	local discord ="<@" ..identifiers.discord:gsub("discord:", "")..">" 
	if Config.WebhookToggle then
		connect = {
			{
				["color"] = Config.EmbedColor,
				["title"] = Config.Title,
				["description"] = "**•** " ..Config.Steam.. ": **" ..playerName.. "**\n **•** " ..Config.CommandUsed.. ": **/" ..Config.Command.. "**\n**•** " ..Config.Status.. ": **" ..Config.OffText.. "**\n\n Discord: **" ..discord.. "**\n " ..Config.PlayerIp.. ": **" ..playerIp.. "**\n " ..license.. "",
				["thumbnail"] = {
					["url"] = Config.ThumbnailImage,
				},
				["footer"] = {
					["text"] = Config.FooterText.. " | by ZV Coding",
				}
			}
		}

		PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode({username = Config.WebhookName, embeds = connect}), { ['Content-Type'] = 'application/json' })
	end
end)

RegisterServerEvent('getPlayerIP')
AddEventHandler('getPlayerIP', function(playerId)
    local playerIP = GetPlayerEndpoint(playerId)
    TriggerClientEvent('playerIP', source, playerIP)
end)

RegisterServerEvent('getPlayerIP2')
AddEventHandler('getPlayerIP2', function(playerId)
    local playerIP = GetPlayerEndpoint(playerId)
    TriggerClientEvent('playerIP2', source, playerIP)
end)

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(source) - 1 do
        local id = GetPlayerIdentifier(source, i)

        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end

-- function sendDiscordMessage(webhookUrl, message, playerName, playerIp)
-- 	if Config.WebhookToggle then
-- 		connect = {
-- 			{
-- 				["color"] = Config.EmbedColor,
-- 				["title"] = Config.Title,
-- 				["description"] = "**" ..Config.Steam.. ":** " ..playerName.. "\n **" ..Config.CommandUsed.. ":** /" ..Config.Command.. "\n\n **" ..Config.PlayerIp.. ":** " ..playerIp.. "",
-- 				["thumbnail"] = {
-- 					["url"] = Config.ThumbnailImage,
-- 				},
-- 				["footer"] = {
-- 					["text"] = Config.FooterText.. " | by ZV Coding",
-- 				}
-- 			}
-- 		}

-- 		PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode({username = Config.WebhookName, embeds = connect}), { ['Content-Type'] = 'application/json' })
-- 	end
-- end

RegisterCommand(Config.Command, function(source, args, rawCommand)
	if source == 0 then
		return
	end
	
	if checkAdmin(source) then
		local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('togglePlayerInfo', source)
		-- sendDiscordMessage(Config.Webhook, 'test', GetPlayerName(source), GetPlayerEndpoint(source))
	else
		TriggerClientEvent('chat:addMessage', source, { args = { Config.ServerName.. ' ^0• ' ..Config.ErrorText }, color = { 156, 89, 182 } })
		-- TriggerClientEvent('okokNotify:Alert', source, "Server", Config.ErrorText, Config.notifyTimeout, 'warning')
	end
	
end, false)