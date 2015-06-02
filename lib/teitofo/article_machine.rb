require 'teitofo/article_part'
require 'teitofo/stack'
require 'teitofo/exceptions'

module TeiToFo
  class ArticleMachine

    def initialize
      @article = @state = nil
      @stack = Stack.new
    end

    attr_reader :state

    def stack_size
      @stack.size
    end

    def success?
      has_started_processing? && @state.nil?
    end

    def article
      raise IncompleteArticleError.new("incomplete article: #{@stack}") unless success?
      @article
    end

    # delegate methods
    def on_element_start(name)
      new_state = ArticlePart.new
      new_state.name = name

      unless has_started_processing?
        @article ||= new_state
        push_state(new_state)
        return @state
      end

      add_new_part(new_state)
      push_state(new_state)
      @state
    end

    def on_element_end(name)
      @stack.pop
      @state = @stack.top
    end

    def on_text(value)
    end

    private
    def has_started_processing?
      @article
    end

    def push_state(new_state)
      @state = new_state
      @stack.push(@state)
    end

    def add_new_part(new_state)
      @state = @stack.top
      @state.add_part(new_state)
    end
  end
end
