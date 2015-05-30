module TeiToFo
  class Error < StandardError
  end

  class StackError < Error
  end

  class StackEmpty < StackError
  end

  class StackIndexOutOfBounds < StackError
  end

end
