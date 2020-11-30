#Naive implementation of windowed_max_range method.
#Given an array of numbers and a "window size," this method finds the maximum
#range within that window size. For example, if I have an array:
#   [1, 3, 5, -2, 4]
#and a window size of 3, then the max range is 7 and is in the window [5, -2, 4].

#Time: O(n^2)
#Space: O(n), n in this case is window_size
def windowed_max_range(array, window_size)
    max_range = nil
    (0..(array.length - window_size)).each do |i|
        window = array[i...i + window_size] #O(n)
        range = window.max - window.min #O(n)
        max_range ||= range #O(1)
        max_range = range if max_range < range #O(1)
    end
    max_range
end

#Test Cases
p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8