#!/usr/bin/ruby -w
i = 1
j = 1
while j <= 9
  i = 1
  while i <= 9
    print "#{i}*#{j}=#{i*j}\t"
    if i ==  9
      print "\n"
    end
    i = i + 1
  end
  j = j + 1
end
