class Point3D < Point
  def initialize(x,y,z)
    super(x,y)
    @z = z
  end
  
  def to_s
   "(#@x,#@y,#@z)"
  end
  
  ORIGIN = Point3D.new(0,0,0)
end