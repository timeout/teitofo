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
        raise StackIndexOutOfBoundsError.new("for #{self}")
      end
      @data.reverse[n]
    end

    def push(element)
      @data << element
    end

    def pop
      raise StackEmptyError.new("for: #{self}") if @data.empty?
      @data.pop
    end

    def top
      @data.last
    end
  end
end
