-- ���� ����������� ������ �������
IsRun = true

function main()
   -- ���� ����� ����������, ���� IsRun == true
   while IsRun do
      sleep(3000)
   end
end

function OnAccountBalance()
   message("OnAccountBalance - ��������� ������� �� ����� "..tostring(os.clock()))
end
function OnAccountPosition()
   message("OnAccountPosition - ��������� ������� �� ����� "..tostring(os.clock()))
end
function OnAllTrade()
   --message("OnAllTrade - ����� ������������ ������ "..tostring(os.clock()))
end
function OnCleanUp()
   message("OnCleanUp - ����� �������� ������ � ��� �������� ����� qlua.dll "..tostring(os.clock()))
end
function OnClose()
   message("OnClose - �������� ��������� QUIK "..tostring(os.clock()))
end
function OnConnected()
   message("OnConnected - ������������ ����� � �������� QUIK "..tostring(os.clock()))
end
function OnDepoLimit()
   message("OnDepoLimit - ��������� ��������� ������ "..tostring(os.clock()))
end
function OnDepoLimitDelete()
   message("OnDepoLimitDelete - �������� ��������� ������ "..tostring(os.clock()))
end
function OnDisconnected()
   message("OnDisconnected - ���������� �� ������� QUIK "..tostring(os.clock()))
end
function OnFirm()
   message("OnFirm - �������� ����� ����� "..tostring(os.clock()))
end
function OnFuturesClientHolding()
   message("OnFuturesClientHolding - ��������� ������� �� �������� ����� "..tostring(os.clock()))
end
function OnFuturesLimitChange()
   message("OnFuturesLimitChange - ��������� ����������� �� �������� ����� "..tostring(os.clock()))
end
function OnFuturesLimitDelete()
   message("OnFuturesLimitDelete - �������� ������ �� �������� ����� "..tostring(os.clock()))
end
function OnInit()
   message("OnInit - ������������� ������� main "..tostring(os.clock()))
end
function OnMoneyLimit()
   message("OnMoneyLimit - ��������� ��������� ������ "..tostring(os.clock()))
end
function OnMoneyLimitDelete()
   message("OnMoneyLimitDelete - �������� ��������� ������ "..tostring(os.clock()))
end
function OnNegDeal()
   message("OnNegDeal - ����� ������ �� ����������� ������ "..tostring(os.clock()))
end
function OnNegTrade()
   message("OnNegTrade - ����� ������ ��� ���������� "..tostring(os.clock()))
end
function OnOrder()
   message("OnOrder - ����� ������ ��� ��������� ���������� ������������ ������ "..tostring(os.clock()))
end
function OnParam()
   --message("OnParam - ��������� ������� ���������� "..tostring(os.clock()))
end
function OnQuote()
   --message("OnQuote - ��������� ������� ��������� "..tostring(os.clock()))
end
function OnStop()
   message("OnStop - ��������� ������� �� ������� ���������� "..tostring(os.clock()))
   -- ������������� ���� � ������� main
   IsRun = false
end
function OnStopOrder()
   message("OnStopOrder - ����� ����-������ ��� ��������� ���������� ������������ ����-������ "..tostring(os.clock()))
end
function OnTrade()
   message("OnTrade - ����� ������ "..tostring(os.clock()))
end
function OnTransReply()
   message("OnTransReply - ����� �� ���������� "..tostring(os.clock()))
end
