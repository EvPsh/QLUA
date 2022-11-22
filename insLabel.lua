--[[
function main()
-- ���� ��� ��������
-- ������������� ������� - qtl, ����, ����� � ���� ���������� ������ � �������
-- ������������� �����, ��� 3 ���, ������� ��� ����� � �������.
---
    insLabel ("qtl", 0, "20221122", "214233", "8.510")
    sleep(3000)
    DelAllLabels("qtl")
end
--]]

function insLabel (idnt, lType, lDate, lTime, y)
-- �-��� ��������� ����� �� �������
-- idnt ������������� �������
-- lType - 1, -1, 0. �������, �������, ������ ������
-- lDate - ���� � ������� YYYYMMDD (string)
-- lTime - ����� � ������� HHMMSS (string)
-- y - ������ ����� �� ������ ����
---

local lParams = {}
    if lType == 1 then lParams.IMAGE_PATH = getScriptPath() .. "\\buy.bmp"
    elseif lType == -1 then lParams.IMAGE_PATH = getScriptPath() .. "\\sell.bmp"
    elseif lType == 0 then
        --lParams.IMAGE_PATH = getScriptPath() .. "\\0.bmp"
    end

    lParams.DATE = lDate
    lParams.TIME = lTime

    lParams.YVALUE = y
    lParams.ALIGNMENT = LEFT -- LEFT, RIGHT, TOP, BOTTOM
    lParams.FONT_FACE_NAME = "Arial"
    lParams.FONT_HEIGHT = 10

    lParams.R = 255 -- ���� �� ��������� "�����"
    lParams.G = 255
    lParams.B = 255

    lParams.TRANSPARENT_BACKGROUND = 0 -- ������������ ����. �0� � ���������, �1� � ��������

    lParams.TEXT = "������ �����"
    lParams.HINT = "��� ����������� ����������"

    AddLabel(idnt, lParams)
end
