class MedianSort
  def sort(array)
    sort!(array.dup)
  end

  def sort!(array)
    medianSort(array, 0, array.size - 1)
  end

  def medianSort(array, left, right)
    if left >= right then return end

    middle = ((left+1 + right+1) / 2).ceil
    medianIndex = selectKthIndex(array, middle, left, right)

    medianSort(array, left, medianIndex - 1)
    medianSort(array, medianIndex + 1, right)
  end

  def findMedian(array)
    median = (array.size / 2.0).ceil
    medianIndex = selectKthIndex(array, median, 0, array.size - 1)
    if medianIndex >= 0 then
      array[medianIndex]
    else
      nil
    end
  end

  def selectKthIndex(array, k, left, right)
    if k <= 0 or (k - 1) > right or (k - 1) < left then return -1 end

    pos = partition(array, left, right)

    if pos == (k - 1) then
      return pos
    elsif pos > (k - 1) then
      return selectKthIndex(array, k, left, (pos - 1))
    else
      return selectKthIndex(array, k, pos + 1 , right)
    end

  end

  def partition(array, left, right)

    pivot = array[right]
    pivotIndex = left

    left.upto(right - 1) do |index|
      if array[index] <= pivot then
        swap(array, index, pivotIndex)
        pivotIndex = pivotIndex + 1
      end
    end

    swap(array, pivotIndex, right)
    pivotIndex
  end

  def swap(array, x, y)
    temp = array[x]
    array[x] = array[y]
    array[y] = temp
  end
end

input = ARGV.shift.to_i

if input.is_a? Integer and input > 0 then
  arrSize = input
else
  arrSize = 100
end

myArray = (1..arrSize).to_a
myArray.shuffle!

randArray = Array.new
1.upto(arrSize){randArray.push(rand(arrSize * 10))}
myArray =  randArray

puts "before sorting..."
myArray.each{|item| print "#{item} "} ; puts

sorter = MedianSort.new
sortingArray = myArray.clone
sorter.sort!(sortingArray)

puts "after sorting..."
sortingArray.each{|item| print "#{item} "} ; puts