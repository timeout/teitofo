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
      @data.pop
    end

  end
end
