require 'teitofo/article_part.rb'
require 'teitofo/text_part.rb'

RSpec.describe TeiToFo::TextBlock do
  let (:text_block) { TeiToFo::TextBlock.new }
  describe '#to_s' do
    it 'returns an empty string' do
      expect(text_block.to_s).to eq(String.new)
    end

    it 'returns a text string' do
      text_block << TeiToFo::TextPart.new('This is some text')
      expect(text_block.to_s).to include('some text')
    end

    it 'returns a text string' do
      text_block << TeiToFo::TextPart.new('This is some')
      text_block << TeiToFo::TextPart.new('IMPORTANT', :italic)
      text_block << TeiToFo::TextPart.new('text')
      expect(text_block.to_s).to include('some IMPORTANT text')
    end
  end
end
