#Min_Max_Stack_Queue implementation of windowed_max_range method. Uses a
#Min_Max_Stack_Queue to find the minimum and maximum values in the stack in O(1)
#time while preserving enqueue and dequeue operations at O(1) as well.

#Given an array of numbers and a "window size," this method finds the maximum
#range within that window size. For example, if I have an array:
#   [1, 3, 5, -2, 4]
#and a window size of 3, then the max range is 7 and is in the window [5, -2, 4].

require_relative 'my_min_max_stack_queue.rb'
require_relative 'my_stack_queue.rb'

#Time: O(n)
#Space: O(n), where n is the size of the array 
def windowed_max_range_mmsq(array, window_size)
    max_range = nil
    queue = My_Stack_Queue.new
    array.each { |num| queue.enqueue(num) }
    window = My_Min_Max_Stack_Queue.new
    (window_size - 1).times { window.enqueue(queue.dequeue) } #O(n) b/c the dequeue operation is now O(1)

    until queue.empty? #O(n)
        window.enqueue(queue.dequeue) #O(1)
        range = window.max - window.min #O(1)
        max_range ||= range #O(1)
        max_range = range if max_range < range #O(1)
        window.dequeue #O(1)
    end

    max_range
end

#Test Cases
#p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
#p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
#p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
#p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8