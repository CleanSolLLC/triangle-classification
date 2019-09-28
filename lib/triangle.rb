require 'pry-nav'
class Triangle

	attr_accessor :equilateral, :isosceles, :scalene

	  @sides = []
  	  @triangle_sides = []

	def initialize(side1, side2, side3)
		@side1 = side1
		@side2 = side2
		@side3 = side3
		@triangle_sides = @side1, @side2, @side3

	end

	def all
    	@triangle_sides
  	end


  	def max_length
    	#longest side of triangle
    	all.sort.last
  	end

  	def has_side?
    	#not a triange if any side <= 0 
    	if all.any? {|side| side <= 0}
    		false
    	end
    	
  	end


  	def valid?
		(@side1 + @side2 > @side3) && (@side2 + @side3 > @side1) && (@side1 + @side3 > @side2)	
  	end

	def kind
		 if has_side? == false || valid? == false
			 raise TriangleError
		 end

		if (@side1 == @side2) && (@side2 == @side3)
			:equilateral
		elsif (@side1 == @side2) || (@side2 == @side3) || (@side1 == @side3)
			:isosceles
		elsif (@side1 != @side2) && (@side2 != @side3) && (@side1 != @side3)
			:scalene
		end
	end

		class TriangleError < StandardError

		end
	

end
