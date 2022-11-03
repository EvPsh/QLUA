function lightTable (ticks, rows, cols) -- подсветка результатов ячейки в таблице
	-- Подсветка результатов в таблице
	-- раскраска результатат (если ticks меньше ноля = розовым, если больше = зеленым)
  -- t_id - глобальный идентификатор созданной таблицы 
	---
	if ticks < 0 then Highlight (t_id, rows, cols, RGB(255, 193, 193), QTABLE_DEFAULT_COLOR, 3000) -- заливка розовым
	else Highlight (t_id, rows, cols, RGB(193, 255, 193), QTABLE_DEFAULT_COLOR, 3000) -- заливка зелёным
	end
end

function lightAllTable(ticks) -- раскраска всей строки
	-- Подсветка строки таблицы
	-- раскраска всей строки (если ticks меньше ноля = розовым, если больше = зеленым)
  -- t_id - глобальный идентификатор созданной таблицы 
	---
	if ticks < 0 then SetColor(t_id, 1, QTABLE_NO_INDEX, RGB(255, 193, 193), QTABLE_DEFAULT_COLOR, RGB(255, 193, 193), QTABLE_DEFAULT_COLOR)
	else SetColor(t_id, 1, QTABLE_NO_INDEX, RGB(193, 255, 193), QTABLE_DEFAULT_COLOR, RGB(193, 255, 193), QTABLE_DEFAULT_COLOR)
	end
end
