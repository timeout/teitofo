require 'teitofo/text_part'

RSpec.describe TeiToFo::TextPart do
  describe '#type' do
    let(:text_part) { TeiToFo::TextPart.new }
    it 'has type italic' do
      italic_text = TeiToFo::TextPart.new(:italic)
      expect(italic_text.type).to eq(:italic)
    end

    it 'has default type: text' do
      expect(text_part.type).to eq(:text)
    end
  end
end
