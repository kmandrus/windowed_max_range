require_relative "my_stack.rb"

class My_Stack_Queue

    def initialize
        @stack_1 = My_Stack.new
        @stack_2 = My_Stack.new
    end

    def size
        @stack_2.size
    end

    def empty?
        @stack_2.empty?
    end

    def enqueue(item)
        unless @stack_2.empty?
            until @stack_2.empty? do 
                @stack_1.push(@stack_2.pop)
            end
        end
        @stack_1.push(item)
        until @stack_1.empty? do
             @stack_2.push(@stack_1.pop)
        end
    end

    def dequeue
        @stack_2.pop
    end

end