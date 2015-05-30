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

      it 'returns 1' do
        stack.push(20)
        expect(stack.size).to eq(1)
      end

      it 'returns 0' do
        stack.push(20)
        stack.pop
        expect(stack.size).to eq(0)
      end

      it 'returns n' do
        (1..5).each do |n|
          stack.push(:element)
          expect(stack.size).to eq(n)
        end
        4.downto(0) do |n|
          stack.pop
          expect(stack.size).to eq(n)
        end
      end
    end
  end
end
