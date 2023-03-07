--[[ -- для проверки убрать скобки
SEC_CODE = "CRH3" 		-- код инструмента
CLASS_CODE = "SPBFUT" 	-- код класса

function main()
-- использование:
---

  local price_step = GetPriceStep(CLASS_CODE, SEC_CODE)
  message("Шаг цены инструмента:\n" .. SEC_CODE .. " равен " .. tostring(price_step))

end
--]]

function GetPriceStep(classcode, seccode)
-- принимаем на вход код класса и код инструмента, 
-- узнаём шаг цены и возвращаем в number
---
	return rNum(getParamEx(classcode, seccode, "SEC_PRICE_STEP").param_value)
end

function rNum(str)
-- принимаем на вход строку в виде 5.0
-- возвращаем number в виде 5
---
	return removeZero(tonumber(str))
end

function removeZero(str)
-- обрезака .0 
--- 

   while (string.sub(str, -1) == "0" and str ~= "0") do
      str = string.sub(str, 1, -2)
   end

   if (string.sub(str, -1) == ".") then
      str = string.sub(str, 1, -2)
   end
   return str
end


