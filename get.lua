function main
	-- пример работы функции. ѕриостановка на клиринг
	local ServerTime=getInfoParam("SERVERTIME")
	local tTime = {"14:00:00","14:05:00"} -- врем€ начала/окончани€ неторгового периода
	local result = diffTime(tTime[1], tTime[2])

	if ServerTime>=tTime[1] and ServerTime<=tTime[2] then
		message("ѕриостановка работы скрипта на ".. tostring(result).." сек.")
		sleep(result*1000) -- врем€ приостановки в секундах. ¬рем€ в Quik в миллисек., поэтому * 1000
	end
end

function diffTime(time1, time2)
-- возвращает разницу в секундах между time2-time1; либо 0, если time1 > time2
-- time1 = "14:00:00"
-- time2 = "14:05:00"
-- result = diffTime(time1, time2) -- = 300 секунд

local dt1 = {}
local dt2 = {}
local dTime1 = 0
local dTime2 = 0
local result = 0

	dt1.hour,dt1.min,dt1.sec = string.match(time1,"(%d*):(%d*):(%d*)")
	for key,value in pairs(dt1) do
		dt1[key] = tonumber(value)
	end

	dt2.hour,dt2.min,dt2.sec = string.match(time2,"(%d*):(%d*):(%d*)")
	for key,value in pairs(dt2) do
		dt2[key] = tonumber(value)
	end

	--часы*3600 + минуты*60 + секунды.
	dTime1 = dt1.hour*3600 + dt1.min*60 + dt1.sec
	dTime2 = dt2.hour*3600 + dt2.min*60 + dt2.sec
	result = dTime2 - dTime1

	if result <= 0 then
		return 0
	else
		return result
	end
end
