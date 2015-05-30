require 'teitofo/exceptions'

module TeiToFo
  class Stack

    def initialize
      @data = Array.new
    end

    def size
      @data.size
    end

    def push(element)
      @data << element
    end

    def pop
      raise StackEmpty.new("StackEmpty exception raise for: #{self}") if @data.empty?
      @data.pop
    end

  end
end
