
class Cuboid
  #BEGIN public methods that should be your starting point
  def initialize(x, y, z)
  	@x = x
  	@y = y
  	@z = z
  end

  def move_to!(x, y, z)
  	@x = x
  	@y = y
  	@z = z
  	true
  end
  
  def vertices
  end
  
  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
  end

  #END public methods that should be your starting point  
end
