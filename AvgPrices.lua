-- ������ ������� ������� �������� "�������" ���� � ���� �� num ���������� ������ �������:
-- �� �������� ����� - High-Low, Close-Low, Open-Close, High-Low; 
-- �� �������� ����� - Open-Low, High-Close, Close-Open, High-Low. 
-- ����� ������������ ��� �������� ������� ���� ��������

-- ���������� ���������� ����� �� ������� ����
-- ���������� ������� ��� ����������� � ��� ������ �����������
-- ���������� ������� ���������� ������ ��� �������� ��������
---

function main()
 ---------------------------- ������ ������ ����� ----------------------------------------------------
local CLASS_CODE = "SPBFUT"      -- ��� ������, ������ �����, ���� �������� ����� �� ���������� 
local SEC_CODE = "BRH4"          -- ���������� 
local num = 60                   -- ������� ������� �������� �� 60 ��������� ������
local idgraf = "BRH"             -- ����� ������� ���� (ctrl + E �� �������, �������� 'price', �������������, ������ � ���� '�������������')
------------------------------------------------------------------------------------------------------

-- ����� ������� ��� ����������� ������� ���
mes(CLASS_CODE, SEC_CODE, idgraf, num)

end

function mes(class_code, sec_code, idgraf, numCandles)
    local numOfCandlesG = getNumCandles(idgraf)
    local HCHO = 0
    local COOC = 0
    local OLCL = 0
    local HLHL = 0

    for index = numOfCandlesG - 2, numOfCandlesG - 2 - numCandles, -1 do
        local t, _, _ = getCandlesByIndex(idgraf, 0, index, 1)
        -- for k, v in pairs(t[0]) do
        --     message(tostring(k) .. " = "..tostring(v))
        -- end

        if t[0].doesExist == 1 then 
            if t[0].open - t[0].close > 0 then -- ���� �������� �����
                HCHO = HCHO + t[0].high - t[0].open
                COOC = COOC + t[0].open - t[0].close
                OLCL = OLCL + t[0].close - t[0].low
                HLHL = HLHL + t[0].high - t[0].low

            elseif t[0].open - t[0].close < 0 then -- ���� �������� �����
                HCHO = HCHO + t[0].high - t[0].close
                COOC = COOC + t[0].close - t[0].open
                OLCL = OLCL + t[0].open - t[0].low
                HLHL = HLHL + t[0].high - t[0].low
            end
        end
    end
    HCHO = round(HCHO, 2)
    COOC = round(COOC, 2)
    OLCL = round(OLCL, 2)
    HLHL = round(HLHL, 2)

    message("High-Open (High-Close) = " .. tostring(HCHO) ..
            "\nClose-Open (Open-Close) = " .. tostring(COOC) ..
            "\nOpen-Low (Close-Low) = " .. tostring(OLCL) ..
            "\n\nHigh-Low (High-Low) = " .. tostring(HLHL)
            )
end

function round(number, znaq) -- ������� ���������� ����� num �� ������ znaq
local num = tonumber(number)
local idp = tonumber(znaq)

    if num then
        local mult = 10 ^ (idp or 0)
        if num >= 0 then return math.floor(num * mult + 0.5) / mult
        else return math.ceil(num * mult - 0.5) / mult
        end
    else return num
    end
end

