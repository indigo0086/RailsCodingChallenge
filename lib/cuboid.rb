
class Vertex
	attr_reader :x, :y, :z
	def initialize(x, y, z)
		@x = x
		@y = y
		@z = z
	end

	def ==(other)
		return @x == other.x && @y == other.y	&& @z == other.z
	end

	def to_s
		return "(x:#{@x}, y:#{@y}, z:#{@z})"
	end
end

class Cuboid
	attr_reader :x, :y, :z, :length, :width, :height
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

		#front facing vertices
		yield Vertex.new(@x - halfWidth, @y + halfHeight, @z + halfLength)
		yield Vertex.new(@x + halfWidth, @y + halfHeight, @z + halfLength)
		yield Vertex.new(@x + halfWidth, @y - halfHeight, @z + halfLength)
		yield Vertex.new(@x - halfWidth, @y - halfHeight, @z + halfLength)

		#back facing vertices
		yield Vertex.new(@x + halfWidth, @y + halfHeight, @z - halfLength)
		yield Vertex.new(@x + halfWidth, @y - halfHeight, @z - halfLength)
		yield Vertex.new(@x - halfWidth, @y + halfHeight, @z - halfLength)
		yield Vertex.new(@x - halfWidth, @y - halfHeight, @z - halfLength)
  end

  def print_vertices
  	vertices do |vertex|
  		puts vertex
  	end
  	return
  end
  
  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
  	if [@x, @y, @z] == [other.x, other.y, other.z]
  		return true
  	else 
  		return sides_overlap?(other)
  	end
  end

  private
  def sides_overlap?(other)
  	#define ranges that vertices would have to exist to be overlapping or colliding
   	x_range = [other.x - other.width / 2, other.x + other.width / 2]
  	y_range = [other.y - other.height / 2, other.y + other.height / 2]
  	z_range = [other.z - other.length / 2, other.z + other.length / 2]

  	#test vertices to see if any lie within ranges
  	vertices do |vertex|
  		return true if vertex.x.between?(*x_range) && 
  		vertex.y.between?(*y_range) &&
  		vertex.z.between?(*z_range)
  	end

  	return false
  end

  #END public methods that should be your starting point  
end
