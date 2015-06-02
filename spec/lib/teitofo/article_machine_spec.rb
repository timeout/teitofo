require 'teitofo/article_machine'

RSpec.describe TeiToFo::ArticleMachine do
  let(:machine) { TeiToFo::ArticleMachine.new }
  describe '#state' do
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

  describe '#stack_size' do
    describe 'returns the number of states currently on the stack' do
      it 'returns 0' do
        expect(machine.stack_size).to eq(0)
      end

      it 'returns 1' do
        machine.on_element_start(:article)
        expect(machine.stack_size).to eq(1)
      end
    end
  end
end
