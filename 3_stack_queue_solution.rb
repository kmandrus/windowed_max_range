#Stack_Queue implementation of windowed_max_range method. Uses a stack_queue
#instead of a stack. Trades O(1) enqueue for O(1) dequeue. Still seems better
#to use a linked list implementation for O(1) for both enqueue and dequeue...

#Given an array of numbers and a "window size," this method finds the maximum
#range within that window size. For example, if I have an array:
#   [1, 3, 5, -2, 4]
#and a window size of 3, then the max range is 7 and is in the window [5, -2, 4].

require_relative 'my_stack_queue.rb'

#Time: O(n^2)
#Space: O(n), where n is the size of the array 
def windowed_max_range(array, window_size)
    max_range = nil
    queue = My_Stack_Queue.new
    array.each { |num| queue.enqueue(num) }
    window = []
    (window_size - 1).times { window << queue.dequeue } #O(n) b/c the dequeue operation is now O(1)

    until queue.empty? #O(n)
        window.push(queue.dequeue) #O(1)
        range = window.max - window.min #O(n)
        max_range ||= range #O(1)
        max_range = range if max_range < range #O(1)
        window.shift #O(n)
    end

    max_range
end

#Test Cases
p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8