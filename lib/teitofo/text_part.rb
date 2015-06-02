module TeiToFo
  class TextPart

    def initialize(text, type = :text)
      @text, @type = text, type
    end

    attr_reader :type, :text

  end
end
