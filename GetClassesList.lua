function main()
-- Вывод списка классов Quik
---
local list = getClassesList() 

-- string sec_list = getClassSecurities("SPBFUT")  
-- TABLE getClassInfo (STRING)

message("list: " .. tostring(list))

end