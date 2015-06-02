require 'teitofo/text_part'

RSpec.describe TeiToFo::TextPart do
  let(:text_part) { TeiToFo::TextPart.new('This is some text') }
  describe '#type' do
    it 'has type italic' do
      italic_text = TeiToFo::TextPart.new('IMPORTANT', :italic)
      expect(italic_text.type).to eq(:italic)
    end

    it 'has default type: text' do
      expect(text_part.type).to eq(:text)
    end
  end

  describe '#text' do
    it 'has some text' do
      expect(text_part.text).to include('some text')
    end
  end

end
