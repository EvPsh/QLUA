function round(number, znaq) -- функция округления числа num до знаков znaq
local num = tonumber(number)
local idp = tonumber(znaq)

	if num then
		local mult = 10 ^ (znaq or 0)
		if num >= 0 then return math.floor(num * mult + 0.5) / mult
		else return math.ceil(num * mult - 0.5) / mult
		end
	else return num
	end
end
