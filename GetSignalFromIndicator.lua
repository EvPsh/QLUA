-- ������������� ��������� �� ������ ���� (��������� ������ ���������� ��� �����/������������ ����� � ����)
-- ����� ������ �����, ����� ��������� �� �����
---

run = true
idgraf = "CAN" -- ctrl+E �� ������� ���� - �������� ��������� - �������������, ������ �������������

function main ()
    while run do
        if Get_signal(idgraf) ~= "" then pse(60) -- ���� ������ �������, �� ����� �� �������� ������ ��� - ����� � 1 ������
        else pse(10) -- ���� ������ �� ������� - ����� 10 ���.
        end
    end
end

function OnStop()
    run = false
    msg("����������")
end 

function pse(tSec) -- ����� � ��������
-- �-��� ������������
-- ������ ���������� � �����
---
    sleep(tonumber(tSec) * 1000)
end

function Get_signal(idgraf)
-- ��������� ������, ���� ������ ���, ��� ��������� ������� ����� ��� ����
-- ���� ������ ����� - ����� ��������� �����, � ��������
---

local i = 0
local numOfCandlesG = getNumCandles(idgraf)
        -- msg("getLinesCount1: " .. getLinesCount(idgraf))         -- �������� ������� ����� � ���������� ���� ��� �����������.
        -- msg("numOfCandlesG: " .. tostring(numOfCandlesG))    -- �������� ������� ����� � ���������� ���� ��� �����������.

    if numOfCandlesG == nil or numOfCandlesG == 0 then
        msg("��� ������ � �������,\n��������� ������������� ������� ����������")
        run = false  
    end
        
    local priceRed, priceGreen -- ��������� ������ � ���� ����� ������� (��������� �� ����)
    for i = 0, 1 do --0 - ��� �������� ������� �����, 1 - ��� �������� ������� ����� ����������.
        local t, _, _ = getCandlesByIndex(idgraf, i, numOfCandlesG - 1, 1) -- �������� ������ ������ � ������� � ������ ������ �����
        if i == 0 then 
            priceGreen = t[0].low -- ���� ������� ������ � 1 ����� ���������� - ��� ��� ����� � ����
            break
        elseif i == 1 then 
            priceRed = t[0].high -- ���� ������� ������ �� 2 ����� ���������� - ��� ��� ����� � ����
            break
        end
    end
        -- �������� ���������� ������
        -- msg("priceRed = "  .. tostring(priceRed))
        -- msg("priceGreen = "  .. tostring(priceGreen))    

    if priceGreen ~= nil and priceGreen ~= 0 then 
        msg("UP, sl = " .. tostring(priceGreen))
        return "up"
    elseif priceRed ~= nil and priceRed ~= 0 then 
        msg("DOWN, sl = " .. tostring(priceRed))
        return "down"
    else return ""
    end
end

function msg(txt) -- ���������
-- �-��� ������ ���������
-- ������ ���������� � ������, ��������� ��������� � ������������� '!'
---
    message(tostring(txt), 2)
end