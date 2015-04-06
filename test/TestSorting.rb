require 'test/unit'
require 'sort/InsertionSort'
require 'sort/MedianSort'

class TestSorting < Test::Unit::TestCase
  def setup
    @sortedArray = (1..25).to_a
    @randArray = @sortedArray.shuffle
  end

  def test_insertionSort()
    sorter = InsertionSort.new
    assert((@sortedArray <=> @randArray) != 0)
    sorter.sort!(@randArray)
    assert((@sortedArray <=> @randArray) == 0)
  end
  
  def test_medianSort()
    sorter = MedianSort.new
    assert((@sortedArray <=> @randArray) != 0)
    sorter.sort!(@randArray)
    assert((@sortedArray <=> @randArray) == 0)
  end
end