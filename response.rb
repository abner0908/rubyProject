puts "Please enter the first word you think of"
words = %w(apple banana cherry) # shorthand for ["apple", "banana", "cherry"]
response = words.collect do |word|
  # Control returns here when redo is executed
  print word + "> " # Prompt the user
  response = gets.chop # Get a response
  if response.size == 0 # If user entered nothing
    word.upcase! # Emphasize the prompt with uppercase
    redo # And skip to the top of the block
  end
  response # Return the response
end

puts "\nyour link:"
words.each_with_index {|word, index| puts "#{word}->#{response[index]}"}