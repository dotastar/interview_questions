def bsearch(arr, val)
  high = arr.length - 1
  low = 0
  
  while(high >= low)
    idx = (high+low)/2.floor
    check = arr[idx]
    if(check < val)
      low = idx + 1
    elsif(check > val)
      high = idx - 1
    else
      return idx
    end
  end
  
  return -1
end

puts bsearch((0..10).to_a, 9)
puts bsearch((-3..9).to_a, -1)
puts bsearch((15..20).to_a, 20)
puts bsearch((1..8).to_a, 0)
puts bsearch([], 6)