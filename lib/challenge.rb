require 'pry'

class FibonacciRange
  include Enumerable

  attr_reader :stop

  def initialize(stop)
    @stop = stop
  end

  def each
    previous_fib = 0
    current_fib = 0
    while (current_fib <= stop)
      if current_fib == 0
        yield current_fib
        current_fib += 1
      else
        yield current_fib
        next_fib = previous_fib + current_fib
        previous_fib = current_fib
        current_fib = next_fib
      end
    end
  end

end

# does not use FibonacciRange
# class FibonacciNumber
#   def self.new(position = 1)
#     if position - 1 < 0
#       "Position must be greater than 0"
#     elsif position - 1 < 2
#       position - 1
#     else
#       FibonacciNumber.new(position - 1) + FibonacciNumber.new(position - 2)
#     end
#   end
# end



# uses golden ratio & Fibonacci Range
# http://www.goldennumber.net/fibonacci-series/
# fn =  Phi n / (Phi + 2)
class FibonacciNumber
  # use all caps here to define constant
  # pry will get upset if you try to redefine
  PHI = (1 + Math.sqrt(5)) / 2

  def self.new(position = 1)
    if position - 1 < 0
      "Position must be greater than 0"
    else
      # this will approximate value, but not be exact
      # for positions >2, it will overshoot the exact value
      # so we can use it as the upper bound for our Fib Range
      # PHI**position / (PHI + 2)
      upper_bound = PHI**position / Math.sqrt(2)
      
      # create a range & convert into array
      fib_range = FibonacciRange.new(upper_bound).map(&:itself)
      # puts "#{fib_range}"
      # extract current number
      fib_range[position - 1]
    end
  end
end

# binding.pry

# puts 'done'
