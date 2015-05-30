require 'ox'

require 'teitofo/article_machine'

module TeiToFo
  class ArticleHandler < Ox::Sax

    def initialize
      @machine = TeiToFo::ArticleMachine.new
    end

    def element_start(name)
      @machine.on_element_state(name)
    end

    def element_end(name)
      @machine.on_element_end(name)
    end

    def text(value)
      @machine.on_text(value)
    end
  end
end
