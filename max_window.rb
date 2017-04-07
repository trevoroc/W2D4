def windowed_max_range(array, window_size)
  max_range = 0

  (array.length - window_size + 1).times do |window_start|
    sub_arr = array[window_start..window_start + window_size - 1]
    min, max = sub_arr.min, sub_arr.max
    delta = max - min
    max_range = delta if delta > max_range
  end

  max_range
end


def optimal_windowed_max_range(array, window_size)
  max_range = 0

  queue = StackQueue.new
  window_size.times { |i| queue.enqueue(array[i]) }
  (window_size...array.length).times do |window_start|
    delta = queue.max - queue.min
    max_range = delta if delta > max_range
    queue.dequeue
    queue.enqueue(array[window_start])
  end

  max_range
end

p optimal_windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p optimal_windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p optimal_windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p optimal_windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
