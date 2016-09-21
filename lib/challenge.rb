class FibonacciRange
  include Enumerable

  attr_reader :stop

  # def fib(current_fib)
  #   if (0..1).include? current_fib 
  #     return current_fib
  #   return fib(current_fib - 1) + fib(current_fib - 2)
  # end

  # def each
  #   current_fib = 0
  #   while (current_fib < stop)
  #       yield fib(current_fib)
  #   end
  # end

  # as written, this yields the 3rd number & beyond of the fib sequence
  def each
    previous_fib = 0
    current_fib = 1
    while (current_fib <= stop)
      next_fib = previous_fib + current_fib
      yield next_fib
      previous_fib = current_fib
      current_fib = next_fib
    end
  end

  def initialize(stop)
    @stop = stop
  end
end

class FibonacciNumber
end
