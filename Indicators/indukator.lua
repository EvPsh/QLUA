-- ���������, ������ � ��������� ����. 
-- ������ 4 �����: 
-- �� �������� ����� - High-Low, Close-Low, Open-Close, High-Low; 
-- �� �������� ����� - Open-Low, High-Close, Close-Open, High-Low. 
-- ����� ������������ ��� �������� ������� ���� ��������

Settings = 
    {
        Name="Indukator",
        line =
        {
            {Name = "H-C(H-O)", Color = RGB(0, 255, 0), Type = TYPE_POINT, Width = 2},
            {Name = "C-O(O-C)", Color = RGB(0, 128, 128), Type = TYPE_LINE, Width = 2},
            {Name = "O-L(C-L)", Color = RGB(255, 0, 0), Type = TYPE_POINT, Width = 2},
            {Name = "H-L(H-L)", Color = RGB(0, 128, 0), Type = TYPE_LINE, Width = 2}

        }
    }
function Init()
    return #Settings.line -- �.�. 4 ����� - ���������� ������ �����.
end

function OnCalculate(idx)
    -- line1 = O(idx)
    -- line2 = H(idx)
    -- line3 = L(idx)
    -- line4 = C(idx)

    if O(idx) - C(idx) > 0 then -- ���� �������� �����
        line1 = H(idx) - O(idx)
        line2 = O(idx) - C(idx)
        line3 = C(idx) - L(idx)
        line4 = H(idx) - L(idx)

    elseif O(idx) - C(idx) < 0 then -- ���� �������� �����
        line1 = H(idx) - C(idx)
        line2 = C(idx) - O(idx)
        line3 = O(idx) - L(idx)
        line4 = H(idx) - L(idx)
    end

    return line1, line2, line3, line4
end