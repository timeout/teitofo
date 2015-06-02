module TeiToFo
  class ArticlePart

    def initialize
      @article_parts = Array.new
    end

    attr_accessor :name

    def add_part(article_part)
      @article_parts << article_part
    end

    alias_method :<<, :add_part

    def number_of_parts
      count = 1
      @article_parts.each { |part| count += part.number_of_parts }
      count
    end

  end

  class TextBlock < ArticlePart
    def initialize
      super
      self.name = :text_block
    end

    def to_s
      parts = @article_parts.map { |part| part.to_s }
      parts.join(' ')
    end
  end
end
