
class Cuboid
	attr_reader :x, :y, :z
  #BEGIN public methods that should be your starting point
  def initialize(x, y, z, length = 1.0, width = 1.0, height = 1.0)
  	@x = x
  	@y = y
  	@z = z
  	@length = length
  	@width = width
  	@height = height
  end

  def move_to!(x, y, z)
  	@x = x
  	@y = y
  	@z = z
  	true
  end
  
  def vertices
  	halfWidth = @width / 2
  	halfHeight = @height / 2
  	halfLength = @length / 2
  	return [
  		#front facing vertices
  		[@x - halfWidth, @y + halfHeight, @z + halfLength],
  		[@x + halfWidth, @y + halfHeight, @z + halfLength],
  		[@x + halfWidth, @y - halfHeight, @z + halfLength],
  		[@x - halfWidth, @y - halfHeight, @z + halfLength],

  		#back facing vertices
  		[@x + halfWidth, @y + halfHeight, @z - halfLength],
  		[@x + halfWidth, @y - halfHeight, @z - halfLength],
  		[@x - halfWidth, @y + halfHeight, @z - halfLength],
  		[@x - halfWidth, @y - halfHeight, @z - halfLength]
  	]
  end

  def print_vertices
  	vertices.each do |vertex|
  		puts "x:#{vertex[0]}, y:#{vertex[1]}, z:#{vertex[2]}"
  	end
  	return
  end
  
  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
  	if [@x, @y, @z] == [other.x, other.y, other.z]
  		return true
  	end
  end

  #END public methods that should be your starting point  
end
