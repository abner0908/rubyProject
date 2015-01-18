while(line = gets.chop) # A loop starts here
  break if line == "quit" # If this break statement is executed...
  next if line[0,1] == "#" # If this line is a comment, go on to the next
  puts line
end
puts "Good bye" # ...then control is transferred here