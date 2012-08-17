def zeckendorf(num)
  fibs = [1, 2]
  i = 1

  until fibs[i] > num
    fibs[i + 1] = fibs[i - 1] + fibs[i]
    i = i + 1
  end

  if fibs[i - 1] == num
    return [fibs[i - 1]]
  else
    return zeckendorf(num - fibs[i - 1]).concat([fibs[i - 1]])
  end
end

p zeckendorf(100)
p zeckendorf(1001)
p zeckendorf(1)