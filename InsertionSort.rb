class InsertionSort
  def sort!(array)
    array.each_with_index do |value, index|
      insert(array, index, value)
    end
  end

  def insert(array, pos, value)
    i = pos - 1
    while(i >= 0 and array[i] >= value)do
      array[i+1] = array[i]
      i = i - 1
    end
    array[i+1] = value
  end
end

myArray = (1..15).to_a
myArray.shuffle!
puts "before sorting..."
myArray.each{|item| print "#{item} "}
puts ""
sorter = InsertionSort.new
sorter.sort!(myArray)
puts "after sorting..."
myArray.each{|item| print "#{item} "}

