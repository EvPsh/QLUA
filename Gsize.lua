function Gsize(m)
-- вычисляем размерность массива m
-- на вход - массив, на выходе количество элементов массива, number
---
    local cnt = 0
    for _, _ in pairs(m) do
        cnt = cnt + 1
    end
    return cnt
end