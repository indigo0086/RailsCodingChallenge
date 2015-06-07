require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.  
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do

  describe "move_to" do
    it "changes the origin in the simple happy case" do
      subject = Cuboid.new(0, 0, 0)
      expect(subject.move_to!(1,2,3)).to be true
    end
  end    
  
  describe "intersects?" do
  	it "should be true if origin is the same" do
  		subject1 = Cuboid.new(0,0,0)
  		subject2 = Cuboid.new(0,0,0)
  		expect(subject1.intersects?(subject2)).to be true
		end

		it "should be true if two cuboids overlap" do
  		subject1 = Cuboid.new(0,0,0)
  		subject2 = Cuboid.new(0.9,0,0)
  		expect(subject1.intersects?(subject2)).to be true
		end

		it "should be false if two cuboids do not overlap" do
  		subject1 = Cuboid.new(0,0,0)
  		subject2 = Cuboid.new(2,2,2)
  		expect(subject1.intersects?(subject2)).to be false
		end
  end

end
