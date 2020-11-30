require_relative "my_min_max_stack.rb"

class My_Min_Max_Stack_Queue

    def initialize
        @in_stack = My_Min_Max_Stack.new
        @out_stack = My_Min_Max_Stack.new
    end

    def size
        @out_stack.size + @in_stack.size
    end

    def empty?
        @out_stack.empty? && @in_stack.empty?
    end

    def enqueue(item)
        @in_stack.push(item)
    end

    def dequeue
        empty_in_stack if @out_stack.empty?
        @out_stack.pop
    end

    def max
        maxes = []
        maxes << @in_stack.max unless @in_stack.empty?
        maxes << @out_stack.max unless @out_stack.empty?
        maxes.max
    end

    def min
        mins = []
        mins << @in_stack.min unless @in_stack.empty?
        mins << @out_stack.min unless @out_stack.empty?
        mins.min
    end

    private
    def empty_in_stack
        @out_stack.push(@in_stack.pop) until @in_stack.empty?
    end

end