require 'teitofo/article_part'
require 'teitofo/stack'

module TeiToFo
  class ArticleMachine

    def initialize
      @state = nil
      @stack = Stack.new
    end

    attr_reader :state

    def stack_size
      @stack.size
    end

    # delegate methods
    def on_element_start(name)
      @state = ArticlePart.new
      @state.name = name
    end

    def on_element_end(name)
    end

    def on_text(value)
    end

  end
end
