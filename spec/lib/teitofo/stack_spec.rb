require 'teitofo/stack'

RSpec.describe TeiToFo::Stack do
  let (:stack) { TeiToFo::Stack.new }
  describe '#push' do
    it 'pushes an element onto the stack' do
      stack.push(10)
    end
  end

  describe '#pop' do
    it 'pops an element off the stack' do
      stack.pop
    end
  end

  describe '#size' do
    describe 'returns the stack\'s size' do
      it 'returns 0' do
        expect(stack.size).to eq(0)
      end
    end
  end
end
