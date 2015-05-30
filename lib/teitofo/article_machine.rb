require 'teitofo/article_part'

module TeiToFo
  class ArticleMachine

    def initialize
      @state = nil
    end

    attr_reader :state

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
