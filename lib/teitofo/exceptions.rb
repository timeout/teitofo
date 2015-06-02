module TeiToFo
  class Error < StandardError
  end

  class StackError < Error
  end

  class StackEmptyError < StackError
  end

  class StackIndexOutOfBoundsError < StackError
  end

  class ArticleMachineError < Error
  end

  class IncompleteArticleError < ArticleMachineError
  end
end
