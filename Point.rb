class Point

  attr_accessor :x, :y
  include Comparable, Enumerable # Mix in methods from the Comparable, Enumerable module.
  
#  # Initialize our class instance variables in the class definition itself
#  @count = 0 # How many points have been created
#  @totalX = 0 # The sum of all X coordinates
#  @totalY = 0 # The sum of all Y coordinates
  
  def initialize(x,y)
    @x, @y = x, y
  end

#  def self.new(x,y) # Class method to create new Point objects
#    # Use the class instance variables in this class method to collect data
#    @count += 1 # Keep track of how many Points have been created
#    @totalX += x # Add these coordinates to the totals
#    @totalY += y
#    super # Invoke the real definition of new to create a Point
#    # More about super later in the chapter
#  end
#
#  class << self
#    attr_accessor :count, :totalX, :totalY
#  end

  ORIGIN = Point.new(0,0)
  UNIT_X = Point.new(1,0)
  UNIT_Y = Point.new(0,1)

  def to_s
    "(#@x,#@y)"
  end

  def +(other)
    raise TypeError, "Point argument expected" unless other.is_a? Point
    Point.new(@x + other.x, @y + other.y)
  end

  def -@
    Point.new(-@x, -@y)
  end

  def *(scalar)
    Point.new(@x*scalar, @y*scalar)
  end

  def [](index)
    case index
    when 0, -2 then @x
    when 1, -1 then @y
    when :x, "x" then @x
    when :y, "y" then @y
    else nil
    end
  end

  def each
    yield @x
    yield @y
  end

  def to_a
    [@x,@y]
  end

  def ==(other)
    if other.is_a? Point then
      other.x == @x and other.y == @y
    else
      false
    end
  end

  def eql?(other)
    if other.is_a? Point then
      @x.eql?(other.x) && @y.eql?(other.y)
    else
      false
    end
  end

  def hash
    code = 17
    code = 37*code + @x.hash
    code = 37*code + @y.hash
    # Add lines like this for each significant instance variable
    code # Return the resulting code
  end

  # Define an ordering for points based on their distance from the origin.
  # This method is required by the Comparable module.
  def <=>(other)
    return nil unless other.instance_of? Point
    @x**2 + @y**2 <=> other.x**2 + other.y**2
  end

  def add!(p) # Add p to self, return modified self
    @x += p.x
    @y += p.y
    self
  end

  def add(p) # A nonmutating version of add!
    q = self.dup # Make a copy of self
    q.add!(p) # Invoke the mutating method on the copy
  end

  def self.sum(*points)
    x = y = 0
    points.each{|p| x+=p.x; y+=p.y}
    Point.new(x,y)
  end

  def raise_exception
    raise 'A exception is raised!!'
  end

end