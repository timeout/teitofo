module TeiToFo
  class ArticlePart

    def initialize
      @article_parts = Array.new
    end

    attr_accessor :name

    def add_part(article_part)
      @article_parts << article_part
    end

    def number_of_parts
      count = 1
      @article_parts.each { |part| count += part.number_of_parts }
      count
    end

  end
end
