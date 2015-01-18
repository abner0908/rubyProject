def fib(num)
  n1 = 0
  n2 = 1
  loop = 2
  print "#{n1}\t"
  print "#{n2}\t"

  while loop < num
    n3 = n1 + n2
    print "#{n3}\t"

    n1 = n2
    n2 = n3
    loop = loop + 1
    if loop % 10 == 0
      puts ''
    end
  end

end

print "input how many fibonacci series you need?"
fib(gets.to_i)

puts ''
