require 'teitofo/article_part'

RSpec.describe TeiToFo::ArticlePart do
  let(:articlePart) { TeiToFo::ArticlePart.new }
  let(:article_name) { 'article' }
  describe '#name=' do
    it 'sets a name' do
      articlePart.name = article_name
    end
  end

  describe '#name' do
    it 'gets a name' do
      articlePart.name = article_name
      expect(articlePart.name).to eq(article_name)
    end
  end
end
