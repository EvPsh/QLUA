-- функции в файле:
-- labelgreen("brent", 20200429, 193000, 24.10, "|") --идентификатор, дата, время, уровень, текст (зеленая метка)
-- labelred("brent", 20200429, 200000, 24.60, "|") --идентификатор, дата, время, уровень, текст (красная метка)
---

function labelred(ident, date, time, value, text)
-- ident - идентификатор графика  (ctrl-E в окне графика quik -> price -> дополнительно -> идентификатор "brent")
-- date вида гггммдд
-- time вида ччммсс
-- value вида 23.00
local table label_params = {
	TEXT = text, --задаётся при вызове ф-ции
	DATE = date, --дата вида 20200427, задаётся при вызове ф-ции
	TIME = time, --задаётся при вызове ф-ции
	FONT_HEIGHT = 15,
	YVALUE = value, --задаётся при вызове ф-ции
	R = 255,
	G = 0,
	B = 0,
	TRANSPARENT_BACKGROUND = 1
	}
AddLabel(ident, label_params) -- вставка обозначения на график с идентификатором 'brent'
end

function labelgreen(ident, date, time, value, text)
--ident - идентификатор графика  (ctrl-E в окне графика quik -> price -> дополнительно -> идентификатор "brent")
--date вида гггммдд
--time вида ччммсс
--value вида 23.00
---
local table label_params = {
	TEXT = text, --задаётся при вызове ф-ции
	DATE = date, --дата вида 20200427, задаётся при вызове ф-ции
	TIME = time, --задаётся при вызове ф-ции
	FONT_HEIGHT = 15,
	YVALUE = value, --задаётся при вызове ф-ции
	R = 0,
	G = 255,
	B = 0,
	TRANSPARENT_BACKGROUND = 1
	}
AddLabel(ident, label_params) -- вставка обозначения на график с идентификатором 'brent'
end
