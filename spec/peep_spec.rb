require 'peep'

describe Peep do
  describe '#initialize' do
    it 'stores id and message' do
      peep = Peep.new(id: 1, message: 'Hello!!This is my first peep!')
      expect(peep.id).to eq(1)
      expect(peep.message).to eq('Hello!!This is my first peep!')
    end
  end
end
