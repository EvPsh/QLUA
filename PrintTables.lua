--@JJ_FXE

function msg(text) message(text) end

function main()
    -- ������� ������
    -- ����� � ���� ��������� ������ lua (�������� ����� � �������� �����) ����� getitem
    -- str = "firms"                    --   �����
    -- str = "classes"                  --   ������
    -- str = "securities"               --   �����������
    -- str = "trade_accounts"           --   �������� �����
    -- str = "client_codes"             --   * ���� ��������
    -- str = "all_trades"               --   ������������ ������
    -- str = "account_positions"        --   �������� �������
    str = "orders"                   --   ������
    -- str = "futures_client_holding"   --   ������� �� ���������� ������ (��������)
    -- str = "futures_client_limits"    --   ������ �� ���������
    -- str = "money_limits"             --   ������ �� �������� ���������
    -- str = "depo_limits"              --   ������ �� �������
    -- str = "trades"                   --   ������
    -- str = "stop_orders"              --   ����-������
    -- str = "neg_deals"                --   ������ �� ����������� ������
    -- str = "neg_trades"               --   ������ ��� ����������
    -- str = "neg_deal_reports"         --   ������ �� ������� ��� ����������
    -- str = "firm_holding"             --   ������� ������� �� �������
    -- str = "account_balance"          --   ������� �� ���������� ������
    -- str = "ccp_holdings"             --   ������������� � ���������� �� �������
    -- str = "rm_holdings"              --   ������: ������������� � ���������� �� �������

    PrintTables(str)
end

function PrintTables(str) -- ����� �� ����� � ���������� ��������� �������� ������
    for i = 0, getNumberOf(str) - 1 do
        local tbl = getItem(str, i)
        for k, v in pairs(tbl) do
            msg(tostring(k) .. " = " .. tostring(v)) -- todo
        end
    end
end