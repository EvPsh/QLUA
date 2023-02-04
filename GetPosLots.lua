function GetPosLots(sec_code)
-- Узнаем количесво лотов в клиентском портфеле по заданному фьючерсу
-- использование NUMBER local pos = GetPosLots("BRH2")
---
local lots = 0
local n = getNumberOf("futures_client_holding")
local fch = {}    
 
    for i = 0, n - 1 do      
        fch = getItem("futures_client_holding", i)
        if tostring(fch["sec_code"]) == sec_code then
            lots = tonumber(fch["totalnet"])
        end
    end 
    return lots
end