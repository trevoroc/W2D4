def my_min(arr)
  min_val = nil

  arr.length.times do |idx|
    curr_val = arr[idx]
    is_min = true
    arr.length.times do |idx2|
      if curr_val > arr[idx2]
        is_min = false
        break
      end
    end
    min_val = curr_val if is_min
  end

  min_val
end

def my_min_better(arr)
  min_val = arr[0]
  arr.each do |el|
    min_val = el if min_val > el
  end
  min_val
end

def largest_contiguous_subsum(list)
  subs = []

  list.each_index do |first|
    (first...list.length).each do |last|
      subs << list[first..last]
    end
  end

  max_sum = 0

  subs.each do |sub_array|
    sub_sum = sub_array.inject(&:+)
    max_sum = sub_sum if sub_sum > max_sum
  end

  max_sum
end

def better_cont_subsum(list)
  best_sum = list.max
  running_sum = 0

  list.each do |el|
    next_val = running_sum + el
    if next_val < 0
      running_sum = 0
    else
      running_sum = next_val
    end
    best_sum = running_sum if running_sum > best_sum
  end
  best_sum
end

#
# 100.times do
#     arr = (-100..100).to_a.sample(20)
#     p largest_contiguous_subsum(arr) == better_cont_subsum(arr)
# end

# list = [0, 3, 4, 4, -5, 10, 1, 90]
# p my_min(list)
# p my_min_better(list)
