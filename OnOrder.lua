Is_run = true
function main()
    while Is_run do
        sleep(100)
    end
end

function OnStopOrder(id)
    for k, v in pairs(id) do
        message(tostring(k) .. " = " .. tostring(v))
    end
    -- ��� ������ ����-������ ��������
    -- flags = 30
    -- ��������� � �������� ������� => 11110
    -- ������� ������ ������ bit 0 = 0 , bit 1 = 1, bit 2 = 1, bit 3 = 1, bit 4 = 1
    -- ������� qlua.chm "����� ��� ������� �����-������"
    -- bit 0 = 0 - ������ �������, ����� �� �������(!)
    -- bit 1 = 1 - ������ �����(!). ���� �� ���������� � �������� ���� 0 ����� 0, �� ������ ��������� 
    -- bit 2 = 1 - ������ �� �������(!), ����� � �� ������� 
    -- bit 3 = 1 - �������������� ������(!)
    -- bit 4 = 1 - � �������� ���. ���� ������ bit 5


end

function OnStop()
    Is_run = false
end