function IsFileExists(file)
-- ������� �������� ������������� �����
-- true - ���� ����, false - ���� ���.
---
	local f = io.open(file)
	if f ~= nil then io.close(f) return true 
	else return false end
end