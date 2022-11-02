-- Флаг поддержания работы скрипта
IsRun = true

function main()
   -- Цикл будет выполнятся, пока IsRun == true
   while IsRun do
      sleep(3000)
   end
end

function OnAccountBalance()
   message("OnAccountBalance - изменение позиции по счету "..tostring(os.clock()))
end
function OnAccountPosition()
   message("OnAccountPosition - изменение позиции по счету "..tostring(os.clock()))
end
function OnAllTrade()
   --message("OnAllTrade - новая обезличенная сделка "..tostring(os.clock()))
end
function OnCleanUp()
   message("OnCleanUp - смена торговой сессии и при выгрузке файла qlua.dll "..tostring(os.clock()))
end
function OnClose()
   message("OnClose - закрытие терминала QUIK "..tostring(os.clock()))
end
function OnConnected()
   message("OnConnected - установление связи с сервером QUIK "..tostring(os.clock()))
end
function OnDepoLimit()
   message("OnDepoLimit - изменение бумажного лимита "..tostring(os.clock()))
end
function OnDepoLimitDelete()
   message("OnDepoLimitDelete - удаление бумажного лимита "..tostring(os.clock()))
end
function OnDisconnected()
   message("OnDisconnected - отключение от сервера QUIK "..tostring(os.clock()))
end
function OnFirm()
   message("OnFirm - описание новой фирмы "..tostring(os.clock()))
end
function OnFuturesClientHolding()
   message("OnFuturesClientHolding - изменение позиции по срочному рынку "..tostring(os.clock()))
end
function OnFuturesLimitChange()
   message("OnFuturesLimitChange - изменение ограничений по срочному рынку "..tostring(os.clock()))
end
function OnFuturesLimitDelete()
   message("OnFuturesLimitDelete - удаление лимита по срочному рынку "..tostring(os.clock()))
end
function OnInit()
   message("OnInit - инициализация функции main "..tostring(os.clock()))
end
function OnMoneyLimit()
   message("OnMoneyLimit - изменение денежного лимита "..tostring(os.clock()))
end
function OnMoneyLimitDelete()
   message("OnMoneyLimitDelete - удаление денежного лимита "..tostring(os.clock()))
end
function OnNegDeal()
   message("OnNegDeal - новая заявка на внебиржевую сделку "..tostring(os.clock()))
end
function OnNegTrade()
   message("OnNegTrade - новая сделка для исполнения "..tostring(os.clock()))
end
function OnOrder()
   message("OnOrder - новая заявка или изменение параметров существующей заявки "..tostring(os.clock()))
end
function OnParam()
   --message("OnParam - изменение текущих параметров "..tostring(os.clock()))
end
function OnQuote()
   --message("OnQuote - изменение стакана котировок "..tostring(os.clock()))
end
function OnStop()
   message("OnStop - остановка скрипта из диалога управления "..tostring(os.clock()))
   -- Останавливает цикл в функции main
   IsRun = false
end
function OnStopOrder()
   message("OnStopOrder - новая стоп-заявка или изменение параметров существующей стоп-заявки "..tostring(os.clock()))
end
function OnTrade()
   message("OnTrade - новая сделка "..tostring(os.clock()))
end
function OnTransReply()
   message("OnTransReply - ответ на транзакцию "..tostring(os.clock()))
end
