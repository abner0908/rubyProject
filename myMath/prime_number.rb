def is_prime_number(num)
  max = Math.sqrt(num).to_i
  for i in 2..max
    if num % i == 0
    return false
    end
  end
  return true
end

print "input prime number search range:"
col_count = 0
totalPrimes = 0
for num in  2..gets.to_i
  if is_prime_number(num)
    totalPrimes = totalPrimes + 1
    print "#{num}\t"
    col_count = col_count + 1
    if col_count % 10 == 0
      puts ""
    end
  end
end

print "\ntotal:#{totalPrimes}"
puts ""
