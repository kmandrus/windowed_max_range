require_relative 'my_stack.rb'

class My_Min_Max_Stack

    def initialize
        @store = My_Stack.new
    end

    def push(item)
        @store.push({
            max: new_max(item), 
            min: new_min(item), 
            value: item
        })
    end

    def pop
        @store.pop[:value]
    end

    def peek
        @store.peek[:value]
    end

    def size
        @store.size
    end

    def empty?
        @store.empty?
    end

    def max
        @store.peek[:max]
    end

    def min
        @store.peek[:min]
    end

    private
    def new_min(val)
        if !empty? && min < val
            min
        else
            val
        end
    end

    def new_max(val)
        if !empty? && max > val
            max
        else
            val
        end
    end

end