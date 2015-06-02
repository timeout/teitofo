module TeiToFo
  class TextPart

    def initialize(type = :text)
      @type = type
    end

    attr_reader :type

  end
end
