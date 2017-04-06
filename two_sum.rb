def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |el1, i|
    arr[i..-1].each do |el2|
      return true if el1 + el2 == target_sum
    end
  end
  false
end

def okay_two_sum?(arr, target_sum)
  arr = arr.sort
  arr.each_with_index do |el, idx|
    delta = target_sum - el
    return true if binary_search(arr[0...idx] + arr[idx + 1..-1], delta)
  end
  false
end

def binary_search(arr, target)
  return arr.first == target if arr.length == 1
  mid_i = arr.length / 2
  case target <=> arr[mid_i]
  when -1
    binary_search(arr[0...mid_i], target)
  when 0
    true
  when 1
    binary_search(arr[mid_i + 1..-1], target)
  end
end

def hash_search(arr, target)
  hash = Hash.new(false)
  arr.each do |el|
    hash[el] = true
  end

  arr.each do |el|
    delta = target - el
    return true if hash[delta] && delta != el
  end
  false
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
