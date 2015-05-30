require 'teitofo/article_part'

RSpec.describe TeiToFo::ArticlePart do
  let(:article_part) { TeiToFo::ArticlePart.new }
  let(:article_name) { 'article' }
  describe '#name=' do
    it 'sets a name' do
      article_part.name = article_name
    end
  end

  describe '#name' do
    it 'gets a name' do
      article_part.name = article_name
      expect(article_part.name).to eq(article_name)
    end
  end

  describe '#add_part' do
    let(:article_sub_part) { TeiToFo::ArticlePart.new }
    it 'adds an article part to an article part' do
      article_part.add_part(article_sub_part)
    end
  end

  describe '#number_of_parts' do
    let(:article_sub_part) { TeiToFo::ArticlePart.new }
    it 'returns 0 when no parts have been added' do
      expect(article.number_of_parts).to eq(0)
    end

    it 'returns the number of parts added' do
      article_part.add_part(article_sub_part)
      expect(article.number_of_parts).to eq(1)
    end
  end
end
