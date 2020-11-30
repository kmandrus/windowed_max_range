require_relative "my_stack.rb"

class My_Stack_Queue

    def initialize
        @in_stack = My_Stack.new
        @out_stack = My_Stack.new
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

    private
    def empty_in_stack
        @out_stack.push(@in_stack.pop) until @in_stack.empty?
    end

end