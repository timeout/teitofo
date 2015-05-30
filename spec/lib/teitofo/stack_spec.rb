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
end
