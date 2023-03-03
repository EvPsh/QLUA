-- Для проверки данных инструмента
-- заменить код бумаги в переменной Tinstr
-- результат записывается в res.txt рядом со скриптом
---

Tinstr = "NGH3"

function main()

  -- https://forum.quik.ru/forum10/topic6280/
  params = {
            "STATUS", "LOTSIZE", "BID", 
            "BIDDEPTH", "BIDDEPTHT", "NUMBIDS", 
            "OFFER", "OFFERDEPTH", "OFFERDEPTHT", 
            "NUMOFFERS", "OPEN", "HIGH", 
            "LOW", "LAST", "CHANGE", 
            "QTY", "TIME", "VOLTODAY", 
            "VALTODAY", "TRADINGSTATUS", "VALUE", 
            "WAPRICE", "HIGHBID", "LOWOFFER", 
            "NUMTRADES", "PREVPRICE", "PREVWAPRICE", 
            "CLOSEPRICE", "LASTCHANGE", "PRIMARYDIST", 
            "ACCRUEDINT", "YIELD", "COUPONVALUE", 
            "YIELDATPREVWAPRICE", "YIELDATWAPRICE", "PRICEMINUSPREVWAPRICE", 
            "CLOSEYIELD", "CURRENTVALUE", "LASTVALUE", 
            "LASTTOPREVSTLPRC", "PREVSETTLEPRICE", "PRICEMVTLIMIT", 
            "PRICEMVTLIMITT1", "MAXOUTVOLUME", "PRICEMAX", 
            "PRICEMIN", "NEGVALTODAY", "NEGNUMTRADES", 
            "NUMCONTRACTS", "CLOSETIME", "OPENVAL", 
            "CHNGOPEN", "CHNGCLOSE", "BUYDEPO", 
            "SELLDEPO", "CHANGETIME", "SELLPROFIT", 
            "BUYPROFIT", "TRADECHANGE", "FACEVALUE", 
            "MARKETPRICE", "MARKETPRICETODAY", "NEXTCOUPON", 
            "BUYBACKPRICE", "BUYBACKDATE", "ISSUESIZE", 
            "PREVDATE", "DURATION", "LOPENPRICE", 
            "LCURRENTPRICE", "LCLOSEPRICE", "QUOTEBASIS", 
            "PREVADMITTEDQUOT", "LASTBID", "LASTOFFER", 
            "PREVLEGALCLOSEPR", "COUPONPERIOD", "MARKETPRICE2", 
            "ADMITTEDQUOTE", "BGOP", "BGONP", 
            "STRIKE", "STEPPRICET", "STEPPRICE", 
            "SETTLEPRICE", "OPTIONTYPE", "OPTIONBASE", 
            "VOLATILITY", "THEORPRICE", "PERCENTRATE", 
            "ISPERCENT", "CLSTATE", "CLPRICE", 
            "STARTTIME", "ENDTIME", "EVNSTARTTIME", 
            "EVNENDTIME", "MONSTARTTIME", "MONENDTIME", 
            "CURSTEPPRICE", "REALVMPRICE", "MARG", 
            "EXPDATE", "CROSSRATE", "BASEPRICE", 
            "HIGHVAL", "LOWVAL", "ICHANGE", 
            "IOPEN", "PCHANGE", "OPENPERIODPRICE", 
            "MIN_CURR_LAST", "SETTLECODE", "STEPPRICECL", 
            "STEPPRICEPRCL", "MIN_CURR_LAST_TI", "PREVLOTSIZE", 
            "LOTSIZECHANGEDAT", "CLOSING_AUCTION_PRICE", "CLOSING_AUCTION_VOLUME", 
            "LONGNAME", "SHORTNAME", "CODE", 
            "CLASSNAME", "CLASS_CODE", "TRADE_DATE_CODE", 
            "MAT_DATE", "DAYS_TO_MAT_DATE", "SEC_FACE_VALUE", 
            "SEC_FACE_UNIT", "SEC_SCALE", "SEC_PRICE_STEP", 
            "SECTYPE"
            }

    file = io.open("res.txt", "w")
    for key, v in ipairs(params) do
      file:write(params[key] .. " = " .. getParamEx("SPBFUT",  Tinstr, v).param_value .. "\n")
    end
    file:close()
end

--[[
Список возможных идентификаторов параметров, передаваемых в функцию getParamEx()

 STATUS                  STRING   Статус
 LOTSIZE                 NUMERIC  Размер лота
 BID                     NUMERIC  Лучшая цена спроса
 BIDDEPTH                NUMERIC  Спрос по лучшей цене
 BIDDEPTHT               NUMERIC  Суммарный спрос
 NUMBIDS                 NUMERIC  Количество заявок на покупку
 OFFER                   NUMERIC  Лучшая цена предложения
 OFFERDEPTH              NUMERIC  Предложение по лучшей цене
 OFFERDEPTHT             NUMERIC  Суммарное предложение
 NUMOFFERS               NUMERIC  Количество заявок на продажу
 OPEN                    NUMERIC  Цена открытия
 HIGH                    NUMERIC  Максимальная цена сделки
 LOW                     NUMERIC  Минимальная цена сделки
 LAST                    NUMERIC  Цена последней сделки
 CHANGE                  NUMERIC  Разница цены последней к предыдущей сессии
 QTY                     NUMERIC  Количество бумаг в последней сделке
 TIME                    STRING   Время последней сделки
 VOLTODAY                NUMERIC  Количество бумаг в обезличенных сделках
 VALTODAY                NUMERIC  Оборот в деньгах
 TRADINGSTATUS           STRING   Состояние сессии
 VALUE                   NUMERIC  Оборот в деньгах последней сделки
 WAPRICE                 NUMERIC  Средневзвешенная цена
 HIGHBID                 NUMERIC  Лучшая цена спроса сегодня
 LOWOFFER                NUMERIC  Лучшая цена предложения сегодня
 NUMTRADES               NUMERIC  Количество сделок за сегодня
 PREVPRICE               NUMERIC  Цена закрытия
 PREVWAPRICE             NUMERIC  Предыдущая оценка
 CLOSEPRICE              NUMERIC  Цена периода закрытия
 LASTCHANGE              NUMERIC  % изменения от закрытия
 PRIMARYDIST             STRING   Размещение
 ACCRUEDINT              NUMERIC  Накопленный купонный доход
 YIELD                   NUMERIC  Доходность последней сделки
 COUPONVALUE             NUMERIC  Размер купона
 YIELDATPREVWAPRICE      NUMERIC  Доходность по предыдущей оценке
 YIELDATWAPRICE          NUMERIC  Доходность по оценке
 PRICEMINUSPREVWAPRICE   NUMERIC  Разница цены последней к предыдущей оценке
 CLOSEYIELD              NUMERIC  Доходность закрытия
 CURRENTVALUE            NUMERIC  Текущее значение индексов Московской Биржи
 LASTVALUE               NUMERIC  Значение индексов Московской Биржи на закрытие предыдущего дня
 LASTTOPREVSTLPRC        NUMERIC  Разница цены последней к предыдущей сессии
 PREVSETTLEPRICE         NUMERIC  Предыдущая расчетная цена
 PRICEMVTLIMIT           NUMERIC  Лимит изменения цены
 PRICEMVTLIMITT1         NUMERIC  Лимит изменения цены T1
 MAXOUTVOLUME            NUMERIC  Лимит объема активных заявок (в контрактах)
 PRICEMAX                NUMERIC  Максимально возможная цена
 PRICEMIN                NUMERIC  Минимально возможная цена
 NEGVALTODAY             NUMERIC  Оборот внесистемных в деньгах
 NEGNUMTRADES            NUMERIC  Количество внесистемных сделок за сегодня
 NUMCONTRACTS            NUMERIC  Количество открытых позиций
 CLOSETIME               STRING   Время закрытия предыдущих торгов (для индексов РТС)
 OPENVAL                 NUMERIC  Значение индекса РТС на момент открытия торгов
 CHNGOPEN                NUMERIC  Изменение текущего индекса РТС по сравнению со значением открытия
 CHNGCLOSE               NUMERIC  Изменение текущего индекса РТС по сравнению со значением закрытия
 BUYDEPO                 NUMERIC  Гарантийное обеспечение продавца
 SELLDEPO                NUMERIC  Гарантийное обеспечение покупателя
 CHANGETIME              STRING   Время последнего изменения
 SELLPROFIT              NUMERIC  Доходность продажи
 BUYPROFIT               NUMERIC  Доходность покупки
 TRADECHANGE             NUMERIC  Разница цены последней к предыдущей сделки (FORTS, ФБ СПБ, СПВБ)
 FACEVALUE               NUMERIC  Номинал (для бумаг СПВБ)
 MARKETPRICE             NUMERIC  Рыночная цена вчера
 MARKETPRICETODAY        NUMERIC  Рыночная цена
 NEXTCOUPON              NUMERIC  Дата выплаты купона
 BUYBACKPRICE            NUMERIC  Цена оферты
 BUYBACKDATE             NUMERIC  Дата оферты
 ISSUESIZE               NUMERIC  Объем обращения
 PREVDATE                NUMERIC  Дата предыдущего торгового дня
 DURATION                NUMERIC  Дюрация
 LOPENPRICE              NUMERIC  Официальная цена открытия
 LCURRENTPRICE           NUMERIC  Официальная текущая цена
 LCLOSEPRICE             NUMERIC  Официальная цена закрытия
 QUOTEBASIS              STRING   Тип цены
 PREVADMITTEDQUOT        NUMERIC  Признаваемая котировка предыдущего дня
 LASTBID                 NUMERIC  Лучшая спрос на момент завершения периода торгов
 LASTOFFER               NUMERIC  Лучшее предложение на момент завершения торгов
 PREVLEGALCLOSEPR        NUMERIC  Цена закрытия предыдущего дня
 COUPONPERIOD            NUMERIC  Длительность купона
 MARKETPRICE2            NUMERIC  Рыночная цена 2
 ADMITTEDQUOTE           NUMERIC  Признаваемая котировка
 BGOP                    NUMERIC  БГО по покрытым позициям
 BGONP                   NUMERIC  БГО по непокрытым позициям
 STRIKE                  NUMERIC  Цена страйк
 STEPPRICET              NUMERIC  Стоимость шага цены
 STEPPRICE               NUMERIC  Стоимость шага цены (для новых контрактов FORTS и RTS Standard)
 SETTLEPRICE             NUMERIC  Расчетная цена
 OPTIONTYPE              STRING   Тип опциона
 OPTIONBASE              STRING   Базовый актив
 VOLATILITY              NUMERIC  Волатильность опциона
 THEORPRICE              NUMERIC  Теоретическая цена
 PERCENTRATE             NUMERIC  Агрегированная ставка
 ISPERCENT               STRING   Тип цены фьючерса
 CLSTATE                 STRING   Статус клиринга
 CLPRICE                 NUMERIC  Котировка последнего клиринга
 STARTTIME               STRING   Начало основной сессии
 ENDTIME                 STRING   Окончание основной сессии
 EVNSTARTTIME            STRING   Начало вечерней сессии
 EVNENDTIME              STRING   Окончание вечерней сессии
 MONSTARTTIME            STRING   Начало утренней сессии
 MONENDTIME              STRING   Окончание утренней сессии
 CURSTEPPRICE            STRING   Валюта шага цены
 REALVMPRICE             NUMERIC  Текущая рыночная котировка
 MARG                    STRING   Маржируемый
 EXPDATE                 NUMERIC  Дата исполнения инструмента
 CROSSRATE               NUMERIC  Курс
 BASEPRICE               NUMERIC  Базовый курс
 HIGHVAL                 NUMERIC  Максимальное значение (RTSIND)
 LOWVAL                  NUMERIC  Минимальное значение (RTSIND)
 ICHANGE                 NUMERIC  Изменение (RTSIND)
 IOPEN                   NUMERIC  Значение на момент открытия (RTSIND)
 PCHANGE                 NUMERIC  Процент изменения (RTSIND)
 OPENPERIODPRICE         NUMERIC  Цена предторгового периода
 MIN_CURR_LAST           NUMERIC  Минимальная текущая цена
 SETTLECODE              STRING   Код расчетов по умолчанию
 STEPPRICECL             DOUBLE   Стоимость шага цены для клиринга
 STEPPRICEPRCL           DOUBLE   Стоимость шага цены для промклиринга
 MIN_CURR_LAST_TI        STRING   Время изменения минимальной текущей цены
 PREVLOTSIZE             DOUBLE   Предыдущее значение размера лота
 LOTSIZECHANGEDAT        DOUBLE   Дата последнего изменения размера лота
 CLOSING_AUCTION_PRICE   NUMERIC  Цена послеторгового аукциона
 CLOSING_AUCTION_VOLUME  NUMERIC  Количество в сделках послеторгового аукциона
 LONGNAME                STRING   Полное название бумаги
 SHORTNAME               STRING   Краткое название бумаги
 CODE                    STRING   Код бумаги
 CLASSNAME               STRING   Название класса
 CLASS_CODE              STRING   Код класса
 TRADE_DATE_CODE         DOUBLE   Дата торгов
 MAT_DATE                DOUBLE   Дата погашения
 DAYS_TO_MAT_DATE        DOUBLE   Число дней до погашения
 SEC_FACE_VALUE          DOUBLE   Номинал бумаги
 SEC_FACE_UNIT           STRING   Валюта номинала
 SEC_SCALE               DOUBLE   Точность цены
 SEC_PRICE_STEP          DOUBLE   Минимальный шаг цены
 SECTYPE                 STRING   Тип инструмента
 --]]