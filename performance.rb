#Interestingly, the performace of the 'best' solution, min_max_stack_queue,
#only becomes apparent as the window size grows large. I wonder what causes
#the large overhead?

require_relative "1_naive_solution.rb"
require_relative "2_queue_solution.rb"
require_relative "3_stack_queue_solution.rb"
require_relative "4_min_max_stack_queue_solution.rb"

require 'benchmark'

def performance_test(array, window_size)
    Benchmark.benchmark(Benchmark::CAPTION, 14, Benchmark::FORMAT) do |b|
        min_max_stack_queue = b.report("Tot. MM_Stk_Q: ") { windowed_max_range_mmsq(array, window_size) }
        stack_queue = b.report("Tot. Stk_Q: ") { windowed_max_range_sq(array, window_size) }
        queue = b.report("Tot. Queue: ") { windowed_max_range_queue(array, window_size) }
        naive = b.report("Tot. Naive:  ") { windowed_max_range_naive(array, window_size) }
    end
end

def random_array(size)
    Array.new(size) { rand(100) }
end

def run_benchmarks
    sizes = [1000, 10000, 100000, 1000000]
    sizes.each do |size|
        window_size = size / 100
        puts "Size: #{size}, window size: #{window_size}"
        performance_test(random_array(size), window_size)
        puts
    end
end

run_benchmarks