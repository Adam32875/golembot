local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
    print('Logged in as '.. client.user.username)
        client:setGame("!pomoc")
end)
						
client:on('messageCreate', function(message)
	if message.content == '!ping' then
		message.channel:send('Pong!')
	end
end)

client:on('messageCreate', function(message)
	if message.content == '!zniszcz' then
		message.channel:send('Nie da sie zniszczyć tego serwera.')
	end
end)

client:on('messageCreate', function(message)
	if message.content == '!mute' then
		message.channel:send('Przepraszamy, ta komenda jest tymczasowo nie dostępna.')
	end
end)

client:on('messageCreate', function(message)
	if message.content == '!kick' then
		message.channel:send('Przepraszamy, ta komenda jest tymczasowo nie dostępna.')
	end
end)

client:on('messageCreate', function(message)
	if message.content == '!warn' then
		message.channel:send('Przepraszamy, ta komenda jest tymczasowo nie dostępna.')
	end
end)

client:on('messageCreate', function(message)
    if message.content == '!iq' then
                local max, random = math.max, math.random
                iq = random(1,1000)
                message.channel:send('Masz ' .. iq .. ' IQ!')
        end
end)

local fs = require('fs')
client:on('messageCreate', function(message)
    discordia.extensions()
    local args = message.content:split(" ")
    local command = table.remove(args, 1)
    if command == "!propozycja" then
    local text = table.concat(args, " ")
    text = text .. "\n"
    local report = fs.readFileSync("propozycje.txt")
    fs.appendFile('propozycje.txt', text)
    message.channel:send {
    content = "Wysłano propozycje!\n",
    }
end
end)

client:on("messageCreate", function(message)
    local content = message.content
    local author = message.author
    if content == "!pomoc" then
        message:reply {
            embed = {
                title = "--> Pomoc <--",
                description = "!pomoc admin\n!pomoc uzytkownik",
                author = {
                    name = author.username,
                    icon_url = author.avatarURL
                },
                footer = {
                    text = "By GolemMc.pl"
                },
                color = 0xB8FF00 -- hex color code
            }
        }
    end
end)

client:on("messageCreate", function(message)
    local content = message.content
    local author = message.author
    if content == "!pomoc admin" then
        message:reply {
            embed = {
                title = "--> Pomoc Admin <--",
                description = "!ban nick/id czas powód\n!kick nick/id podód\n!mute nick/id czas powód\n!warn nick/id czas powód",
                author = {
                    name = author.username,
                    icon_url = author.avatarURL
                },
                footer = {
                    text = "By GolemMc.pl"
                },
                color = 0xB8FF00 -- hex color code
            }
        }
    end
end)

client:on("messageCreate", function(message)
    local content = message.content
    local author = message.author
    if content == "!pomoc uzytkownik" then
        message:reply {
            embed = {
                title = "--> Pomoc Uzytkownika <--",
                description = "!propozycja treść - propozycja komendy/zmiany w bocie\n!iq - ile masz iq\n!pusc - puszcza muzyka\n!stop - stopuje muzyke\n!start - włącza wstrzymaną muzyke\n",
                author = {
                    name = author.name,
                    icon_url = author.avatarURL
                },
                footer = {
                    text = "By GolemMc.pl"
                },
                color = 0xB8FF00 -- hex color code
            }
        }
    end
end)


client:on("messageCreate", function(message)
    discordia.extensions()
	if not message.guild then return end
	local connection = message.guild.connection
	local args = message.content:split(" ") 
	local command = table.remove(args, 1)
	if command == "!pusc" then
    local nazwa = table.concat(args, " ")
	    if nazwa == "" then 
		    local channel = client:getChannel('855523134202445884')
			local connection = channel:join()
			message.channel:send("Puszczam muzyke!")
			connection:playFFmpeg('muzyka.mp3')
			end
	    elseif command == "!stop" then
		    connection:pauseStream()
	    elseif command == "!start" then
		    connection:resumeStream()
		end
end)

client:run('Bot ODU0NzcyODAxOTgxNzc1OTEy.YMozNA.h0re6tfRD3JkrDwKqEtJ90uI9f0')