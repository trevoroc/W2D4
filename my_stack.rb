class MyStack
  def initialize
    @store = []
  end

  def push(el)
    next_el = empty? ? [el, el, el] :
      [el, [@store.peek[1], el].max, [@store.peek.last, el].min]
    @store << next_el
  end

  def pop
    @store.pop.first
  end

  def peek
    @store.last.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def max
    empty? ? nil : @store.peek[1]
  end

  def min
    empty? ? nil : @store.peek.last
  end
end
