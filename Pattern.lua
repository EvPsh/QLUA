function pattern ()
	local pattern = false
	if pattern = true then
		--
		-- ����� ������ ��������, ���� ���������, �� ���������� true
		--
		return true
	else
		return false
	end
	
	--[[
	-- ������� ���� require pattern.lua, ���� dofile pattern.lua
	while (false) do
		pattern()
		-- ��� ������ pattern ����� true -> ����� �� �����
	end
	--]]

end