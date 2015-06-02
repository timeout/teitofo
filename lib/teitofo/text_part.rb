require 'teitofo/exceptions'

module TeiToFo
  class TextPart

    def initialize(text, type = :text)
      raise EmptyTextPartError.new("error: #{self}") if text.nil? || text.empty?
      @text, @type = text, type
    end

    attr_reader :type, :text

    def to_s
      "#{type}: #{text}"
    end

  end
end
