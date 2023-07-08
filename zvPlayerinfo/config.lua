Config = {}

Config.Command = "playerinfo" --Command


--Default Notify
Config.DefaultNotify = true --turn default notify on(true) or off(false)
Config.NotifyOn = "You have turned <b>on</b> playerinfo" --message when notify go on
Config.NotifyOff = "You have turned <b>off</b> playerinfo" --message when notify go off
Config.notifyTimeout = 5000 --timeout of notify in ms

--okokNotify
Config.OkokNotify = false --turn okoknotify on(true) or off(false)
Config.OkokTitle = "zvPlayerinfo" --header of notify
Config.OkokMessageOn = "You have turned <b>on</b> playerinfo" --message when notify go on
Config.OkokMessageOff = "You have turned <b>off</b> playerinfo" --message when notify go off
Config.OkokNotifyTimeout = 5000 --timeout of notify in ms
Config.OkokTypeOn = 'info' --type of notify when go on
Config.OkokTypeOff = 'info' --type of notify when go out

--Pnotify
Config.PnotifyNotify = false --turn pnotify on(true) or off(false)
Config.PnotifyMessageOn = "You have turned <b>on</b> playerinfo" --message when notify go on
Config.PnotifyMessageOff = "You have turned <b>off</b> playerinfo" --message when notify go off
Config.PnotifyTimeout = 5000 --timeout of notify in ms
Config.PnotifyTypeOn = 'success' --type of notify when go on
Config.PnotifyTypeOff = 'success' --type of notify when go out
Config.PnotifyLayout = "topright" --position of notify

Config.BlipColor = 1 --Here you can change the Blip Color of Blips. https://docs.fivem.net/docs/game-references/blips/#blip-colors


----------------------------------------------
-------------------WEBHOOK--------------------
----------------------------------------------
Config.WebhookToggle = true --Set it to false to disable the webhook and set it to true to enable the webhook
Config.Webhook = "https://discord.com/api/webhooks/1096888398502961164/liWBc9d40v7L7KhffqphghAjMC-AFjoYWdhW6LoFQf-VBR2MPdkMXLGwTBcu6FMPZGUQ" --Webhook

Config.WebhookName = "ZV Coding" --Webhook name
Config.Title = "zvPlayerinfo Logs" --Webhook title
Config.EmbedColor = 10246582 --embed color. 
Config.ThumbnailImage = "https://media.discordapp.net/attachments/1079484678987325642/1079484738114424893/image.png" --image
Config.FooterText = "zvPlayerinfo 1.2" --Footer text

Config.Steam = "Steam"
Config.CommandUsed = "Command used"
Config.PlayerIp = "Player IP"
Config.Status = "Status"
Config.OnText = "On"
Config.OffText = "Off"

Config.ServerName = "ZV Coding" --Your Server name | You will see it in an error message in chat
Config.ErrorText = "You can't use this command" --No permission Text