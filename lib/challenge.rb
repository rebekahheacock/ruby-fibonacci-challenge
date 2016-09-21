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

class FibonacciNumber
  def self.new(position = 1)
    if position < 1
      "Position must be greater than 0"
    elsif position == 1
      0
    elsif position == 2
      1
    else
      FibonacciNumber.new(position - 1) + FibonacciNumber.new(position - 2)
    end
  end
end
