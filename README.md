# QLUA
QLUA, алготрейдинг, Quik, MOEX, FORTS

-------------------------------------------------
ВАЖНО. Для корректного отображения русского языка: Quik принимает только кодировку файлов в windows 1251. Файлы здесь - в кодировке UTF-8. После сохранения на диск необходимо пересохранить в Windows-1251 (SublimeText, Notepad++ или любом другом текстовом редакторе).
-------------------------------------------------

#Call_back.lua - программа, основные коллбэки при использовании Quik.

#CandleSave.lua - Программа, сохранение результатов свечей в .CSV в виде: <Инструмент> <Дата> <Время> <Цена_Open> <Цена_High> <Цена_Low> <Цена_Close> <Объем>.

#Comma.lua - функция, меняет '.' на ',' в what и возвращает текстовое значение. Используется при выводе в csv для получения правильного числа (пример 50.50 -> 50,50).

#DaysToDie.lua - функция, получаем количество дней до погашения инструмента (фьючерсы), если < 4, просим заменить инструмент на новый.

#DiffTime.lua - функция, приостановка скрипта на определенный временной интервал (к примеру, приостанавливаем работу робота на клиринг).

#EndOfWord.lua - функция, добавляет окончание к словам: str = EndOfWord(22, "сигнал") -> str = "22 сигнала". (38, "сигнал") -> "38 сигналов"

#FileSize.lua - функция, возврат размера файла (если существует), либо nil.

#Formatted.lua - функция, визуальный вывод чисел (пример: 100000 -> 100 000).

#GetClassesList.lua - программа, вывод списка классов Quik, вывод инструментов класса, вывод справочных данных о классе в формате ключ(поле таблицы) = значение, вывод информации об инструменте в формате ключ(поле таблицы) = значение.

#GetASCII.lua - отдельный файл для запуска в lua (не для QLUA). Выводит ASCII-коды нажатия клавиш.

#GetLot.lua - функция, получение возможного количества лотов, исходя из ГО и средств на счёте. Возвращает числовое значение.

#GetPosLots.lua - функция, получение лотов в позиции по фьючерсам (сколько лотов в портфеле). Возвращает числовое значение

#GetTimeFrame.lua - функция, получение таймфрейма из разницы времени между свечами/барами.

#Gsize.lua - функция, вычисляем количество элементов массива m (там, где #m не подходит)

#HighlightRes.lua - две функции, подсветка определённой ячейки созданной таблицы и раскраска всей строки (если ticks меньше ноля = розовым, если больше = зеленым).

#InsLabel.lua - функция, простая установка метки на графике.

#IsDirExist.lua - функция, проверка существования папки.

#IsFileExists.lua - функция, проверка существования файла.

#Match.lua - функция, отбор данных из строки "xx, yy, zz" и возврат массива m[1] = "xx", m[2] = "yy", m[3] = "zz".

#Msg.lua - функция, вывод сообщений.

#myfunc.lua - функция, внутри две функции для отображения меток на графике (ставим на график идентификатор, передаём дату и время в функцию, выставляются метки).

#MyPos.lua - функция, определение текущей позиции по инструменту seccode счета account.

#Pse.lua - функция, приостановка скрипта на х секунд.

#RetTimeDS.lua - программа, возврат времени последнего бара с помощью CreateDataSource.

#ReturnTime.lua - функция, возврат времени. На вход кидаем string "21:00:00" на выходе получаем массив dt1 типа string: dt1.hour = "21", dt1.min = "00", dt1.sec = "00".

#Round.lua - функция, округление числа num до знаков znaq. По умолчанию в Lua такой функции нет.

#sName.lua - функция, получение имени запущенного скрипта. Можно использовать для создания файла-лога по имени скрипта.

#StopDayTrade.lua - функция, stopDayProfit (Результат, "несгораемая" сумма, отступ для трейлинг стопа). Трейлинг (Trailing stop) для результата торговли, если результат плюсует, то держит отступ в заданном шаге от результата, если минусует - позволяет ограничить торговлю робота.

#StrText.lua - функция, добавляем "0" к данным, если число 1 < x < 10, возвращает 01, 02, .. , 09. значения типа string.

#Table.GetRowFromTable.lua - функция, получает номер строки по значению.

#TGsend.lua - функция, простой способ отправки сообщений из Lua в Telegram. Для высоконагруженных систем не подходит (используется curl)

#WaitForTrade.lua - функция, приостановка скрипта на клиринги.

#WriteToFile.lua - функция, запись созданной таблицы в файл '.csv' в качестве разделителей - ';'.

-----------------------------------------------------------------------------------------














