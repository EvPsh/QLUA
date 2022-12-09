# QLUA
QLUA, алготрейдинг, Quik, MOEX, FORTS

-------------------------------------------------
ВАЖНО. Для корректного отображения русского языка: Quik принимает только кодировку файлов в windows 1251. Файлы здесь - в кодировке UTF-8. После сохранения на диск необходимо пересохранить в Windows-1251 (SublimeText, Notepad++ или любом другом текстовом редакторе).
-------------------------------------------------

#DaysToDie.lua функция, получаем количество дней до погашения инструмента (фьючерсы), если < 4, просим заменить инструмент на новый.

#HighlightRes.lua - две функции, подсветка определённой ячейки созданной таблицы и раскраска всей строки (если ticks меньше ноля = розовым, если больше = зеленым)

#CandleSave.lua - Программа, сохранение результатов свечей в .CSV в виде: <Инструмент> <Дата> <Время> <Цена_Open> <Цена_High> <Цена_Low> <Цена_Close> <Объем>

#Comma.lua - функция, меняет '.' на ',' в what и возвращает текстовое значение. Используется при выводе в csv для получения правильного числа (пример 50.50 -> 50,50)

#MyPos.lua - функция, определение текущей позиции по инструменту seccode счета account

#Round.lua - функция, округление числа num до знаков znaq. По умолчанию в Lua такой функции нет.

#StopDayTrade.lua - функция, stopDayProfit (Результат, "несгораемая" сумма, отступ для трейлинг стопа). Трейлинг (Trailing stop) для результата торговли, если результат плюсует, то держит отступ в заданном шаге от результата, если минусует - позволяет ограничить торговлю робота.

#TGsend.lua - функция, простой способ отправки сообщений из Lua в Telegram.

#get.lua - функция, приостановка скрипта на определенный временной интервал (к примеру, приостанавливаем работу робота на клиринг)

#GetASCII.lua - отдельный файл для запуска в lua (не для QLUA). Выводит ASCII-коды нажатия клавиш.

#getLot.lua - функция, получение возможного количества лотов, исходя из ГО и средств на счёте. Возвращает числовое значение

#GetTimeFrame.lua - функция, получение таймфрейма из графика с меткой.

#call_back.lua - программа, основные коллбэки при использовании Quik.

#insLabel.lua - функция, простая установка метки на графике.

#myfunc.lua - функция, внутри две функции для отображения меток на графике (ставим на график идентификатор, передаём дату и время в функцию, выставляются метки)

#sName.lua - функция, получение имени запущенного скрипта. Можно использовать для создания файла-лога по имени скрипта.
