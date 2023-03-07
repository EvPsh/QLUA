--[[ -- ��� �������� ������ ������
SEC_CODE = "CRH3" 		-- ��� �����������
CLASS_CODE = "SPBFUT" 	-- ��� ������

function main()
-- �������������:
---

  local price_step = GetPriceStep(CLASS_CODE, SEC_CODE)
  message("��� ���� �����������:\n" .. SEC_CODE .. " ����� " .. tostring(price_step))

end
--]]

function GetPriceStep(classcode, seccode)
-- ��������� �� ���� ��� ������ � ��� �����������, 
-- ����� ��� ���� � ���������� � number
---
	return rNum(getParamEx(classcode, seccode, "SEC_PRICE_STEP").param_value)
end

function rNum(str)
-- ��������� �� ���� ������ � ���� 5.0
-- ���������� number � ���� 5
---
	return removeZero(tonumber(str))
end

function removeZero(str)
-- �������� .0 
--- 

   while (string.sub(str, -1) == "0" and str ~= "0") do
      str = string.sub(str, 1, -2)
   end

   if (string.sub(str, -1) == ".") then
      str = string.sub(str, 1, -2)
   end
   return str
end


