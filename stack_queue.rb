require_relative 'my_stack.rb'

class StackQueue
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue(el)
    @in_stack.push(el)
  end

  def dequeue
    switch_stacks if @out_stack.empty?
    @out_stack.pop
  end

  def size
    @out_stack.size + @in_stack.size
  end

  def empty?
    @out_stack.empty? && @in_stack.empty?
  end

  def min
    [@in_stack.min, @out_stack.min].min
  end

  def max
    [@out_stack.max, @in_stack.max].max
  end

  private

  def switch_stacks
    until @in_stack.empty?
      @out_stack.push(@in_stack.pop)
    end
  end
end
