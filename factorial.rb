def factorial(n)
  raise AgumentError, "Expected argument >= 1. Got #{n}", caller if n < 1 # Raise an exception for bad n
  raise TypeError, "Integer argument expected" if not n.is_a? Integer
  return 1 if n == 1
  n * factorial(n-1)
end

print "input a integer that you want to fact up to: "
input = gets.to_i
begin # Handle exceptions in this block
  puts factorial(input) # Note illegal argument
rescue ArgumentError => ex # Store exception in variable ex
  puts "#{ex.class}: Try again with a value >=1" # Handle exception by printing message
rescue TypeError => ex
  puts "#{ex.class}: Try again with a integer"  
end # End the begin/rescue block
