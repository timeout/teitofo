require 'teitofo/text_part'
require 'teitofo/exceptions'

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

    it 'raises a EmptyTextPartError' do
      expect{ TeiToFo::TextPart.new('') }.to raise_error(TeiToFo::EmptyTextPartError)
    end

    it 'raises a EmptyTextPartError' do
      expect{ TeiToFo::TextPart.new(String.new) }.to raise_error(TeiToFo::EmptyTextPartError)
    end
  end

  describe '#to_s' do
    it 'creates the string: "text: This is some text"' do
      expect(text_part.to_s).to eq('text: This is some text')
    end

    it 'creates the string: "italic: IMPORTANT"' do
      italic_text = TeiToFo::TextPart.new('IMPORTANT', :italic)
      expect(italic_text.to_s).to eq('italic: IMPORTANT')
    end
  end

end
