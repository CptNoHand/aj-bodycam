local QBCore = exports['qb-core']:GetCoreObject()

local on = false
RegisterNetEvent('BodyCam:Toggle', function()
	local PlayerData = QBCore.Functions.GetPlayerData()
	if not on then
		if PlayerData.job.name == 'police' then
			local callSign = PlayerData.metadata["callsign"]
			local first = PlayerData.charinfo.firstname
			local job = PlayerData.job.grade.name
			showJob = '['..callSign..'] '..job.. ' ' ..first
			SendNUIMessage({
				action  = 'changeJob',
				data = showJob
			})
			on = true
		else
			local first = PlayerData.charinfo.firstname
			local last = PlayerData.charinfo.lastname
			showJob = first..' '..last
			SendNUIMessage({
				action  = 'changeJob',
				data = showJob
			})
			on = true
		end
	else
		SendNUIMessage({
			action  = 'changeJob',
			data = 'none'
		})
		on = false
	end
end)

local function formatTime(data)
	for i=1, #data do
		local v = data[i]
		if v <= 9 then
			data[i] = "0"..v
		end
	end
	return data
end

CreateThread(function()
	while true do
		Wait(1000)
		hour = GetClockHours()
		minute = GetClockMinutes()
		month = GetClockMonth()
		dayOfMonth = GetClockDayOfMonth()

		local type = ' AM'
		if hour == 0 or hour == 24 then
			hour = 12
			type = ' AM'
		elseif hour >= 13 then
			hour = hour - 12
			type = ' PM'
		end

		minute, month, dayOfMonth, hour = table.unpack(formatTime({minute, month, dayOfMonth, hour}))
		local formatted = month..'/'..dayOfMonth..'/2021'..' '..hour..':'..minute..type
		SendNUIMessage({
			action  = 'changeTime',
			data = formatted
		})
		Wait(1000)
	end
end)
