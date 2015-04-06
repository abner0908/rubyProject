require 'test/unit'
require 'myMath/Point'
require 'myMath/Point3D'

class TestPoint < Test::Unit::TestCase
  def setup
    @point = Point.new(2,3)
  end

  def test_point_class_name
    expect = Point
    actual = @point.class
    assert_equal(expect, actual)
    assert (@point.is_a? Point)
  end

  def test_to_s
    expect = "(2,3)"
    actual = @point.to_s
    assert_equal(expect, actual)
  end

  def test_accessor
    assert_equal(2, @point.x)
    assert_equal(3, @point.y)

    @point.x = 1
    assert_equal(1, @point.x)
    @point.y = 9
    assert_equal(9, @point.y)
    assert_equal('(1,9)', @point.to_s)
  end

  def test_operator
    newPoint = Point.new(1,2) + Point.new(2,3)
    assert_equal('(3,5)', newPoint.to_s)

    assert_equal('(-3,-5)', (-newPoint).to_s)

    assert_equal('(6,10)', (newPoint * 2).to_s)

    p = @point.add(Point.new(1,2))
    assert_equal('(3,5)', p.to_s)
    assert_equal('(2,3)', @point.to_s)

    @point.add!(Point.new(1,2))
    assert_equal('(3,5)', @point.to_s)

  end

  def test_raise_error
    assert_raise(TypeError){@point + 2}
  end

  def test_index
    assert_equal(2, @point[0])
    assert_equal(3, @point[1])
    assert_equal(2, @point[-2])
    assert_equal(3, @point[-1])
    assert_equal(2, @point[:x])
    assert_equal(3, @point[:y])
  end

  def test_each
    expect = '23'
    actual = ''
    @point.each{|x| actual += x.to_s}
    assert_equal(expect, actual)
  end

  def test_array
    assert_equal([2,3], @point.to_a)
  end

  def test_quality
    expect = Point.new(2,3)
    actual = @point
    assert(actual == expect)
    assert(expect.eql?(actual))
    #assert(actual.eql?(expect), "expect: #{expect.object_id}, but actual: #{actual.object_id}")
  end

  def test_comparable
    p1 = Point.new(1,2)
    p2 = Point.new(2,3)
    p3 = Point.new(3,4)
    assert_equal(@point <=> p1, 1)
    assert_equal(@point <=> p2, 0)
    assert_equal(@point <=> p3, -1)
    assert(p2.between?(p1, p3))
  end

  def test_sum
    p1 = Point.new(1,2)
    p2 = Point.new(2,3)
    p3 = Point.new(3,4)
    assert_equal('(6,9)', Point.sum(p1,p2,p3).to_s)
  end

  def test_constants
    assert_equal('(0,0)', Point::ORIGIN.to_s)
    assert_equal('(1,0)', Point::UNIT_X.to_s)
    assert_equal('(0,1)', Point::UNIT_Y.to_s)
    assert_equal(Point.new(1,1), (Point::UNIT_X + Point::UNIT_Y))
  end

  #  def test_class_instance_variables
  #    p1 = Point.new(1,2)
  #    p2 = Point.new(2,3)
  #    p3 = Point.new(3,4)
  #    assert_equal(9, Point.count)
  #  end

  def test_inheritance
    assert_equal('(1,2,3)', Point3D.new(1,2,3).to_s)
    assert_equal('(0,0,0)', Point3D::ORIGIN.to_s)
  end

  #測試dup和clone是深度複製還是影子複製
  def test_copy
    origin = Point3D.new(1,2,3)
    copyByClone = origin.clone
    copyByDup = origin.dup
    copyByClone.x = 4
    copyByDup.x = 5
    assert_equal(4, copyByClone.x)
    assert_equal(5, copyByDup.x)
    assert_equal(1, origin.x)
  end

  def test_raise_exception
    begin
      @point.raise_exception
    rescue => ex
      assert_equal('A exception is raised!!', ex.message)
    end

    assert_raise do
      @point.raise_exception
    end
    #    assert_raise_with_message(StandardError, 'A exception is raised!') do
    #      @point.raise_exception
    #    end
  end

end