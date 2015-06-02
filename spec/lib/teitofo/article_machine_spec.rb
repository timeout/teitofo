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
        expect(machine.state).to be_nil
      end

      it 'returns 1' do
        machine.on_element_start(:article)
        expect(machine.stack_size).to eq(1)
        expect(machine.state.class).to eq(TeiToFo::ArticlePart)
        expect(machine.state.name).to eq(:article)
      end

      it 'returns 0' do
        machine.on_element_start(:article)    # article |
        machine.on_element_end(:article)      # |
        expect(machine.stack_size).to eq(0)
        expect(machine.state).to be_nil
      end
    end
  end

  describe '#success?' do
    it 'returns false' do
      expect(machine.success?).to be_falsey
    end

    it 'returns false' do
      machine.on_element_start(:article)
      expect(machine.success?).to be_falsey
    end

    it 'returns true' do
      machine.on_element_start(:article)
      machine.on_element_end(:article)
      expect(machine.success?).to be_truthy
    end
  end

  describe '#article' do
    describe 'raises an IncompleteArticleError' do
      it 'has not processed an article' do
        expect{ machine.article }.to raise_error(TeiToFo::IncompleteArticleError)
      end

      it 'is in an incomplete state' do
        machine.on_element_start(:article)
        expect{ machine.article }.to raise_error(TeiToFo::IncompleteArticleError)
      end
    end

    it 'returns an article' do
      machine.on_element_start(:article)
      machine.on_element_end(:article)
      expect(machine.article.name).to eq(:article)
    end

    it 'returns an article' do
      machine.on_element_start(:article)
      machine.on_element_start(:body)
      machine.on_element_end(:body)
      machine.on_element_end(:article)
      expect(machine.article.name).to eq(:article)
    end

    it 'the article has 1 sub part' do
      machine.on_element_start(:article)
      machine.on_element_start(:body)
      machine.on_element_end(:body)
      machine.on_element_end(:article)
      article = machine.article
      expect(article.number_of_parts).to eq(2)
    end

    it 'the article has 2 sub part' do
      machine.on_element_start(:article)
      machine.on_element_start(:front)
      machine.on_element_end(:front)
      machine.on_element_start(:body)
      machine.on_element_end(:body)
      machine.on_element_end(:article)
      article = machine.article
      expect(article.number_of_parts).to eq(3)
    end
  end

end
