require 'teitofo/article_part'
require 'teitofo/stack'

module TeiToFo
  class ArticleMachine

    def initialize
      @state = nil
      @stack = Stack.new
      @has_changed_state = false
    end

    attr_reader :state

    def stack_size
      @stack.size
    end

    def success?
      (false ^ @has_changed_state) && @state.nil?
    end

    # delegate methods
    def on_element_start(name)
      @state = ArticlePart.new
      @state.name = name
      @stack.push(@state)
      @has_changed_state ||= true
    end

    def on_element_end(name)
      @stack.pop
      @state = @stack.top
    end

    def on_text(value)
    end

  end
end
