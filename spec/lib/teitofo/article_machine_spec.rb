require 'teitofo/article_machine'

RSpec.describe TeiToFo::ArticleMachine do
  describe '#state' do
    let(:machine) { TeiToFo::ArticleMachine.new }
    it 'returns the state of the article machine' do
      expect(machine.state).to be_nil
    end

    it 'returns an ArticlePart' do
      machine.on_element_start(:article)
      expect(machine.state.class).to eq(TeiToFo::ArticlePart)
    end

    it 'returns article' do
      machine.on_element_start(:article)
      expect(machine.state.name).to eq(:article)
    end
  end
end
