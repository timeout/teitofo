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

      if has_started_processing?
        @state = @stack.top
        @state.add_part(new_state)
      end

      @article ||= new_state
      @state = new_state
      @stack.push(@state)
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
  end
end
