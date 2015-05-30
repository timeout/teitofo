require 'teitofo/article_machine'

RSpec.describe TeiToFo::ArticleMachine do
  describe '#state' do
    let(:machine) { TeiToFo::ArticleMachine.new }
    it 'returns the state of the article machine' do
      expect(machine.state).to be_nil
    end
  end
end
