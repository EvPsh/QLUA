--[[ -- для теста убрать скобки

is_run = true

function main
-- использование:
	local ts = "00"
	while is_run do
		WaitForTrade(ts)
		--
		--
	end
end
--]]

function WaitForTrade(bsec)
-- Функция приостановки скрипта на клиринги, начало и конец раб. дня.
---

local local_run = true
local datetime = {}

   while local_run do
      datetime = returnTime(getInfoParam("SERVERTIME"))
      if tonumber(datetime.hour) <= 8 and tonumber(datetime.min) <= 59 then
          pse(DiffTime(getInfoParam("SERVERTIME"), "08:59:05"))
          datetime = returnTime(getInfoParam("SERVERTIME"))
      end

      if StrText(datetime.hour) == "14" and StrText(datetime.min) == "00" and StrText(datetime.sec) == bsec then
          pse(245)
          datetime = returnTime(getInfoParam("SERVERTIME"))
      end

      if StrText(datetime.hour) == "18" and StrText(datetime.min) == "50" and StrText(datetime.sec) == bsec then
          pse(845)
          datetime = returnTime(getInfoParam("SERVERTIME"))
      end

      if StrText(datetime.hour) == "23" and StrText(datetime.min) == "50" and StrText(datetime.sec) == bsec then
          --message("Остановка")
          OnStop()
      end

      if StrText(datetime.sec) == bsec then
          local_run = false
          return datetime
      end
      sleep(500)
   end
end

-- dopfunc --

function pse(tSec) -- пауза в секундах
-- ф-ция приостановки
-- данные приводятся к числу
---
    sleep(tonumber(tSec) * 1000)
end

function StrText(int) 
-- добавляем "0" к данным, если число 1 < x < 10
-- возвращает 01, 02, .. , 09. значения типа string
-- используется для работы со временем, 
-- пример, при переводе времени 17:09:00 в number, вернётся:
-- 17, 9, 0. чтобы работать с временем, как с текстом, нужна эта ф-ция
---
    local m = tostring(int)
    local mLen = string.len(int)

    if mLen == 1 then output = "0" .. tostring(m)
    else output = m
    end

    return output
end

function diffTime(time1, time2)
-- возвращает разницу в секундах между time2 - time1; либо 0, если time1 > time2 в секундах
-- time1 = "14:00:00"
-- time2 = "14:05:00"
-- result = diffTime(time1, time2) -- = 300 секунд
---

local dt1 = {}
local dt2 = {}
local dTime1 = 0
local dTime2 = 0
local result = 0

	dt1.hour, dt1.min, dt1.sec = string.match(time1,"(%d*):(%d*):(%d*)")
	for key, value in pairs(dt1) do
		dt1[key] = tonumber(value)
	end

	dt2.hour, dt2.min, dt2.sec = string.match(time2,"(%d*):(%d*):(%d*)")
	for key, value in pairs(dt2) do
		dt2[key] = tonumber(value)
	end

	--часы * 3600 + минуты * 60 + секунды.
	dTime1 = dt1.hour * 3600 + dt1.min * 60 + dt1.sec
	dTime2 = dt2.hour * 3600 + dt2.min * 60 + dt2.sec
	result = dTime2 - dTime1

	if result <= 0 then return 0
	else return result -- result - время приостановки, сек.
	end
end

function returnTime(time1)
-- ф-ция возврата времени
-- на вход кидаем string "21:00:00"
-- на выходе получаем массив dt1 типа string: 
-- dt1.hour = "21"
-- dt1.min = "00"
-- dt1.sec = "00"
-- использование: 
-- datetime = {}
-- datetime = returnTime(getInfoParam("SERVERTIME"))
---

    local dt1 = {}

    dt1.hour, dt1.min, dt1.sec = string.match(time1,"(%d*):(%d*):(%d*)")
    for key, value in pairs(dt1) do
        dt1[key] = StrText(value)
    end
    return dt1
end
