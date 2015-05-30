require 'teitofo/exceptions'

module TeiToFo
  class Stack

    def initialize
      @data = Array.new
    end

    def empty?
      @data.empty?
    end

    def size
      @data.size
    end

    def [](n)
      if (n < 0 or n >= self.size)
        raise StackIndexOutOfBounds.new("for #{self}")
      end
      @data[n]
    end

    def push(element)
      @data << element
    end

    def pop
      raise StackEmpty.new("for: #{self}") if @data.empty?
      @data.pop
    end

  end
end
