class FibonacciRange
  include Enumerable

  attr_reader :stop

  def each
    previous_fib = 0
    current_fib = 0
    while (current_fib <= stop)
      if current_fib == 0
        yield current_fib
        current_fib += 1
      else
        next_fib = previous_fib + current_fib
        yield current_fib
        previous_fib = current_fib
        current_fib = next_fib
      end
    end
  end

  def initialize(stop)
    @stop = stop
  end
end

class FibonacciNumber
end
