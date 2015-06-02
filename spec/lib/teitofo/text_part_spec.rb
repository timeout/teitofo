require 'teitofo/text_part'

RSpec.describe TeiToFo::TextPart do
  describe '#type' do
    it 'returns italic' do
      text_part = TeiToFo::TextPart.new(:italic)
      expect(text_part.type).to eq(:italic)
    end
  end
end
